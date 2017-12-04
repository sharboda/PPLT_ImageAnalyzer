using Google.Apis.Services;
using Google.Cloud.Vision.V1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImageAnalyzer
{
    class GoogleVisionAPIManager
    {
        static ImageAnnotatorClient client;
        const string API_KEY = "AIzaSyDW5xeeVO5jkWD9f0dGE75LlHTJZv-v9k0";


        static GoogleVisionAPIManager()
        {
            // Instantiates a client
            client = ImageAnnotatorClient.Create();
            
        }
        static int i = 0;
        public async static Task<Dictionary<string, List<string>>> detectAnnotations(string imageFile)
        {
            Dictionary<string, List<string>> finalResponse = new Dictionary<string, List<string>>();
            try
            {
                if(i++ > 5)
                {
                    i = 0;
                    Task.Delay(TimeSpan.FromMinutes(1)).Wait();
                }
                // Load the image file into memory
                var image = Image.FromFile(imageFile);
                // Performs label detection on the image file
                var response = await MakeCall(Constants.TAGS, image);
                string output = populateList(Constants.TAGS, response, finalResponse);
                response = await MakeCall(Constants.CAPTIONS, image);
                output += populateList(Constants.CAPTIONS, response, finalResponse);
                response = await MakeCall(Constants.LANDMARK, image);
                output += populateList(Constants.LANDMARK, response, finalResponse);


                if (!Form1.GetInstance().imageData.ContainsKey(imageFile))
                {
                    Form1.GetInstance().imageData.Add(imageFile, new List<Tuple<string, string>>());
                }
                Form1.GetInstance().imageData[imageFile].Add(new Tuple<string, string>("Google", output.ToString()));
            }
            catch (Exception ex)
            {
                Form1.GetInstance().writeToConsole("Google: "+ex.Message);
            }
            return finalResponse;
        }

        public static async Task<IReadOnlyList<EntityAnnotation>> MakeCall(String key, Image image)
        {
            IReadOnlyList<EntityAnnotation> response = null;
            try
            {
                switch (key)
                {
                    case Constants.TAGS:
                        response = await client.DetectLabelsAsync(image);
                        break;
                    case Constants.LANDMARK:
                        response = await client.DetectLandmarksAsync(image);
                        break;
                    case Constants.CAPTIONS:
                        response = await client.DetectTextAsync(image);
                        break;
                }
            }
            catch (Exception ex)
            {
                if(ex.Message.Contains("ResourceExhausted"))
                {
                    Task.Delay(TimeSpan.FromMinutes(1)).Wait();
                    return await MakeCall(key, image);
                }
            }
            return response;
        }

        private static string populateList(String key, IReadOnlyList<EntityAnnotation> response, Dictionary<string, List<string>> finalResponse)
        {
            List<string> tags = new List<string>();
            StringBuilder output = new StringBuilder();
            if (response == null || response.Count == 0)
                return null;
            output.Append("{\n"+key.ToUpper()+"\n");
            foreach (var annotation in response)
            {
                if (annotation.Description != null)
                {
                    tags.Add(annotation.Description);
                    output.Append(annotation.Description + "\n");
                }
            }
            output.Append("}\n");
            finalResponse.Add(key, tags);
            if (String.IsNullOrEmpty(output.ToString()))
                return null;
            return output.ToString();
        }
    }
}
