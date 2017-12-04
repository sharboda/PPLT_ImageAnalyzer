using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ImageAnalyzer
{
    public partial class Form1 : Form
    {
        private FolderBrowserDialog folderBrowserDialog;
        private ImageManager iManager;
        private static Form1 form1;
        private bool suppressChange = false;
        private string profileName = "profile";
        private static List<string> ResultType = new List<string>{
           Constants.CATEGORIES,
           Constants.TAGS,
           Constants.CAPTIONS,
           Constants.LANDMARK
        };
        public Dictionary<string, List<Tuple<string, string>>> imageData = new Dictionary<string, List<Tuple<string, string>>>();
        internal List<FinalVulnerableItem> finalSelectedItems = new List<FinalVulnerableItem>();

        public Form1()
        {
            InitializeComponent();
            iManager = new ImageManager();
            folderBrowserDialog = new FolderBrowserDialog();
            cmbView.DataSource = ResultType;
            cmbView.SelectedIndex = 0;
            this.WindowState = FormWindowState.Maximized;
            form1 = this;
            listResults.SelectedIndexChanged += ListResults_SelectedIndexChanged;
            listImage.SelectedIndexChanged += ListImage_SelectedIndexChanged;
        }

        internal void updateFinalList(FinalVulnerableItem item)
        {
            finalSelectedItems.Add(item);
            refreshFinalList();
        }

        private void refreshFinalList()
        {
            BindingSource bindingSource = new BindingSource();
            bindingSource.DataSource = finalSelectedItems;
            listFinalTags.DataSource = bindingSource;
        }

        public static Form1 GetInstance()
        {
            return form1;
        }

        private void btnFolderPicker_Click(object sender, EventArgs e)
        {
            folderBrowserDialog.Description = "Select the directory containing the pictures to be imported";
            string path = openFolder();
            if (String.IsNullOrEmpty(path))
                return;
            int index = path.LastIndexOf(Path.DirectorySeparatorChar);
            profileName = path.Substring(index+1);
            txtFolderPicker.Text = path;
            iManager.parseAllImages(path);
        }

        private string openFolder()
        {
            DialogResult result = folderBrowserDialog.ShowDialog();
            string path = null;
            if (result == DialogResult.OK)
            {
                path = folderBrowserDialog.SelectedPath;
            }
            return path;
        }

        private void btnViewRes(object sender, EventArgs e)
        {
            String type = cmbView.SelectedValue.ToString();
            if(iManager.finalResult == null || iManager.finalResult.Count == 0)
            {
                return;
            }
            switch(type)
            {
                case Constants.CATEGORIES:
                case Constants.TAGS:
                case Constants.CAPTIONS:
                case Constants.LANDMARK:
                    if (!iManager.finalResult.ContainsKey(type))
                        break;
                    iManager.finalResult[type].Sort();
                    PopulateList(iManager.finalResult[type]);
                    break;
            }
        }

        private void PopulateList(List<TagMetaData> data)
        {
            BindingSource bindingSource = new BindingSource();
            bindingSource.DataSource = data;
            listResults.DataSource = bindingSource;
        }

        private void ListResults_SelectedIndexChanged(object sender, EventArgs e)
        {
            TagMetaData tagMetaData = listResults.SelectedItem as TagMetaData;
            suppressChange = true;
            listImage.DataSource = tagMetaData.GetImageList();
        }

        private void ListImage_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (suppressChange)
            {
                suppressChange = false;
                return;
            }
            string imagePath = listImage.SelectedValue.ToString();
            ImageForm imagePopup = new ImageForm(imagePath);
            imagePopup.Show();
        }

        public void writeToConsole(string text)
        {
            listConsole.Invoke((MethodInvoker)delegate() {
                listConsole.TopIndex = listConsole.Items.Add(text);
            });
            Console.WriteLine(text);
        }

        private void selectTag_Click(object sender, EventArgs e)
        {
            if (listResults.SelectedIndex == -1)
                return;
            AddVulnerableTag addVulnerableTagPopup = new AddVulnerableTag((TagMetaData)listResults.SelectedItem);
            addVulnerableTagPopup.ShowDialog();
        }

        private void btnRemoveFinalTag_Click(object sender, EventArgs e)
        {
            if (listFinalTags.SelectedIndex == -1)
                return;
            finalSelectedItems.Remove((FinalVulnerableItem) listFinalTags.SelectedItem);
            refreshFinalList();
        }

        private void btnExport_Click(object sender, EventArgs e)
        {
            folderBrowserDialog.Description = "Select the directory to import final selected tags";
            string path = openFolder();
            if (String.IsNullOrEmpty(path))
                return;
            using (StreamWriter bw = new StreamWriter(Path.Combine(path, profileName + ".csv")))
            {
                bw.WriteLine("Tag, Frequency, Vulnerability Level, Coder Comment, Image List");
                int numOfPicsWithBabies = iManager.GetCountOfPicsWithBabies();
                int totalPics = iManager.finalResult.Count;
                foreach (FinalVulnerableItem item in finalSelectedItems)
                {
                    bw.Write(item.tagData.tag + ",");
                    bw.Write(item.tagData.frequency + ",");
                    bw.Write(item.vulLevel + ",");
                    bw.Write(item.cmt + ",");
                    StringBuilder imageList = new StringBuilder();
                    foreach(string image in item.tagData.GetImageList())
                    {
                        imageList.Append(image);
                        imageList.Append("   ");
                    }
                    bw.WriteLine(imageList);
                    //bw.WriteLine(","+numOfPicsWithBabies+","+totalPics);
                }
            }
        }
    }
}
