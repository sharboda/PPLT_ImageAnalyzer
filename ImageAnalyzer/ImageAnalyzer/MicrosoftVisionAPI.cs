using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace ImageAnalyzer
{
    internal class MicrosoftVisionAPI
    {
        // Replace the subscriptionKey string value with your valid subscription key.
        const string subscriptionKey = "a4ea7465a2524f61af97bf4262a9fa3d";
        const string subscriptionKey1 = "7db5bc125a9541df9ff5a05b775aa635";

        private enum dataKeys
        {
            tags,
            description,
            caption
        }

        // Replace or verify the region.
        //
        // You must use the same region in your REST API call as you used to obtain your subscription keys.
        // For example, if you obtained your subscription keys from the westus region, replace 
        // "westcentralus" in the URI below with "westus".
        //
        // NOTE: Free trial subscription keys are generated in the westcentralus region, so if you are using
        // a free trial subscription key, you should not need to change this region.
        const string uriBase = "https://westcentralus.api.cognitive.microsoft.com/vision/v1.0/analyze";

        /// <summary>
        /// Gets the analysis of the specified image file by using the Computer Vision REST API.
        /// </summary>
        /// <param name="imageFilePath">The image file.</param>
        internal static async Task<Dictionary<string, List<string>>> MakeAnalysisRequest(string imageFilePath)
        {

            // Request parameters. A third optional parameter is "details".
            string requestParameters = "visualFeatures=Categories,Description,Color&language=en";
            Dictionary<string, List<string>> finalResult = new Dictionary<string, List<string>>();
            finalResult = await MakeRequest(imageFilePath, requestParameters, finalResult);

            requestParameters = "model=landmarks";
           // finalResult = await MakeRequest(imageFilePath, requestParameters, finalResult);
            return finalResult;
        }

        private static async Task<Dictionary<string, List<string>>> MakeRequest(string imageFilePath, string requestParameters, Dictionary<string, List<string>> finalResult)
        {
            // Assemble the URI for the REST API Call.
            string uri = uriBase + "?" + requestParameters;

            HttpClient client = new HttpClient();

            // Request headers.
            client.DefaultRequestHeaders.Add("Ocp-Apim-Subscription-Key", subscriptionKey);

            HttpResponseMessage response;

            // Request body. Posts a locally stored JPEG image.
            byte[] byteData = GetImageAsByteArray(imageFilePath);
            using (ByteArrayContent content = new ByteArrayContent(byteData))
            {
                try
                {
                    // This example uses content type "application/octet-stream".
                    // The other content types you can use are "application/json" and "multipart/form-data".
                    content.Headers.ContentType = new MediaTypeHeaderValue("application/octet-stream");

                    // Execute the REST API call.
                    response = await client.PostAsync(uri, content);

                    if (response.StatusCode.ToString().Equals("429"))
                    {
                        Task.Delay(TimeSpan.FromMinutes(1)).Wait();
                        return await MakeRequest(imageFilePath, requestParameters, finalResult);
                    }
                    // Get the JSON response.
                    string contentString = await response.Content.ReadAsStringAsync();
                    Dictionary<string, object> result = JsonConvert.DeserializeObject<Dictionary<string, object>>(contentString);
                    AddValueOfFirstItemInDictionary(result, finalResult, Constants.CATEGORIES);
                    if (result.ContainsKey(Constants.DESCRIPTION) && result["description"] != null)
                    {
                        Dictionary<string, object> description = JsonConvert.DeserializeObject<Dictionary<string, object>>(result[Constants.DESCRIPTION].ToString());
                        if (description.ContainsKey(Constants.TAGS))
                        {
                            finalResult.Add(Constants.TAGS, JsonConvert.DeserializeObject<List<string>>(description[Constants.TAGS].ToString()));
                        }
                        AddValueOfFirstItemInDictionary(description, finalResult, Constants.CAPTIONS);
                    }
                    if (!Form1.GetInstance().imageData.ContainsKey(imageFilePath))
                    {
                        Form1.GetInstance().imageData.Add(imageFilePath, new List<Tuple<string, string>>());
                    }
                    if (result.ContainsKey(Constants.LANDMARK) && result[Constants.LANDMARK] != null)
                    {
                        Dictionary<string, object> landmarks = JsonConvert.DeserializeObject<Dictionary<string, object>>(result[Constants.LANDMARK].ToString());
                    }
                    Form1.GetInstance().imageData[imageFilePath].Add(new Tuple<string, string>("Microsoft", JsonPrettyPrint(contentString)));
                    // Display the JSON response.
                    //Console.WriteLine("\nResponse:\n");
                    //Console.WriteLine(JsonPrettyPrint(contentString));
                }
                catch (Exception ex)
                {
                    Form1.GetInstance().writeToConsole("Microsoft: " + ex.Message);
                }
            }
            return finalResult;
        }

        private static void AddValueOfFirstItemInDictionary(Dictionary<string, object> sourceDict, Dictionary<string, List<string>> destDict, string key)
        {
            if (sourceDict.ContainsKey(key))
            {
                List<Dictionary<string, string>> captions = JsonConvert.DeserializeObject<List<Dictionary<string, string>>>(sourceDict[key].ToString());
                destDict.Add(key, new List<string>());
                foreach (Dictionary<string, string> item in captions)
                {
                    destDict[key].Add(item.FirstOrDefault().Value);
                }
            }
        }

        /// <summary>
        /// Returns the contents of the specified file as a byte array.
        /// </summary>
        /// <param name="imageFilePath">The image file to read.</param>
        /// <returns>The byte array of the image data.</returns>
        static byte[] GetImageAsByteArray(string imageFilePath)
        {
            FileStream fileStream = new FileStream(imageFilePath, FileMode.Open, FileAccess.Read);
            BinaryReader binaryReader = new BinaryReader(fileStream);
            return binaryReader.ReadBytes((int)fileStream.Length);
        }


        /// <summary>
        /// Formats the given JSON string by adding line breaks and indents.
        /// </summary>
        /// <param name="json">The raw JSON string to format.</param>
        /// <returns>The formatted JSON string.</returns>
        static string JsonPrettyPrint(string json)
        {
            if (string.IsNullOrEmpty(json))
                return string.Empty;

            json = json.Replace(Environment.NewLine, "").Replace("\t", "");

            StringBuilder sb = new StringBuilder();
            bool quote = false;
            bool ignore = false;
            int offset = 0;
            int indentLength = 3;

            foreach (char ch in json)
            {
                switch (ch)
                {
                    case '"':
                        if (!ignore) quote = !quote;
                        break;
                    case '\'':
                        if (quote) ignore = !ignore;
                        break;
                }

                if (quote)
                    sb.Append(ch);
                else
                {
                    switch (ch)
                    {
                        case '{':
                        case '[':
                            sb.Append(ch);
                            sb.Append(Environment.NewLine);
                            sb.Append(new string(' ', ++offset * indentLength));
                            break;
                        case '}':
                        case ']':
                            sb.Append(Environment.NewLine);
                            sb.Append(new string(' ', --offset * indentLength));
                            sb.Append(ch);
                            break;
                        case ',':
                            sb.Append(ch);
                            sb.Append(Environment.NewLine);
                            sb.Append(new string(' ', offset * indentLength));
                            break;
                        case ':':
                            sb.Append(ch);
                            sb.Append(' ');
                            break;
                        default:
                            if (ch != ' ') sb.Append(ch);
                            break;
                    }
                }
            }

            return sb.ToString().Trim();
        }
    }
}
