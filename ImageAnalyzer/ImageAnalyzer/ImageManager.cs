using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImageAnalyzer
{
    class ImageManager
    {
        public Dictionary<string, List<TagMetaData>> finalResult
        {
            private set;
            get;
        }

        public ImageManager()
        {
            finalResult = new Dictionary<string, List<TagMetaData>>();
        }

        public void parseAllImages(string folderPath)
        {
            if (String.IsNullOrEmpty(folderPath))
            {
                Form1.GetInstance().writeToConsole("Error: folder name is null or empty");
                return;
            }
            var filters = new String[] { "jpg", "jpeg", "png", "gif", "tiff", "bmp" };
            string[] files = GetFilesFrom(folderPath, filters, false);
            analyze(files);
        }

        private static String[] GetFilesFrom(String searchFolder, String[] filters, bool isRecursive)
        {
            List<String> filesFound = new List<String>();
            var searchOption = isRecursive ? SearchOption.AllDirectories : SearchOption.TopDirectoryOnly;
            foreach (var filter in filters)
            {
                filesFound.AddRange(Directory.GetFiles(searchFolder, String.Format("*.{0}", filter), searchOption));
            }
            return filesFound.ToArray();
        }

        private async Task<Dictionary<string, List<TagMetaData>>> analyze(string[] files)
        {
            var t = Task.Run(()=>parseEachImage(files));
            await t;
            System.Windows.Forms.MessageBox.Show("Processing Images is Completed!");
            return finalResult;
        }

        private void parseEachImage(string[] files)
        {
            List<Task> taskList = new List<Task>();
            foreach (string file in files)
            {
                var t = Task.Run(async ()=>
                {
                    try
                    {
                        Form1.GetInstance().writeToConsole("Loading: "+file);
                        Dictionary<string, List<string>> googleResult = await GoogleVisionAPIManager.detectAnnotations(file);
                        Dictionary<string, List<string>> microsoftResult = await MicrosoftVisionAPI.MakeAnalysisRequest(file);
                        mergeToSecondList(googleResult, microsoftResult);
                        mergeToFinal(file, microsoftResult);
                        Form1.GetInstance().writeToConsole(file + " processing is complete");
                    }
                    catch (Exception ex)
                    {
                        Form1.GetInstance().writeToConsole(ex.Message);
                    }
                });
                taskList.Add(t);
            }
            Task.WaitAll(taskList.ToArray());
            foreach (string key in finalResult.Keys)
            {
                Form1.GetInstance().writeToConsole(key);
                foreach (TagMetaData item in finalResult[key])
                {
                    Form1.GetInstance().writeToConsole("\t" + item.ToString());
                }
            }
        }

        private static void mergeToSecondList(Dictionary<string, List<string>> firstList, Dictionary<string, List<string>> secondList)
        {
            foreach (string key in firstList.Keys)
            {
                if (secondList.Keys.Contains(key))
                {
                    foreach (string item in firstList[key])
                    {
                        if (!secondList[key].Contains(item))
                        {
                            secondList[key].Add(item);
                        }
                    }
                }
                else
                {
                    secondList.Add(key, firstList[key]);
                }
            }
        }

        private bool mergeToFinal(string imagePath, Dictionary<string, List<string>> newData)
        {
            lock(finalResult) {
                foreach (string key in newData.Keys)
                {
                    foreach (string value in newData[key])
                    {
                        bool found = false;
                        if (finalResult.Keys.Contains(key))
                        {
                            foreach (TagMetaData item in finalResult[key])
                            {
                                if (item.tag.Equals(value))
                                {
                                    found = true;
                                    item.addImage(imagePath);
                                }
                            }
                        }
                        else
                        {
                            finalResult.Add(key, new List<TagMetaData>());
                        }
                        if (!found)
                        {
                            TagMetaData item = new TagMetaData(value, imagePath);
                            finalResult[key].Add(item);
                        }
                    }
                }
            }
            return true;
        }

        internal int GetCountOfPicsWithBabies()
        {
            int num = 0;
            foreach(List<TagMetaData> itemList in finalResult.Values)
            {
                foreach(TagMetaData item in itemList)
                {
                    if (String.IsNullOrEmpty(item.tag))
                        continue;
                    switch (item.tag.ToLower())
                    {
                        case "young":
                        case "baby":
                        case "boy":
                        case "girl":
                        case "toddler":
                            num++;
                            break;
                        default:
                            break;
                    }
                }
            }
            return num;
        }
    }
}
