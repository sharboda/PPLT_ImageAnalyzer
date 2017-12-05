using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AnalysisConsolidator
{
    class Program
    {
        static void Main(string[] args)
        {
            string path = "D:\\CMU";
            string[] files = Directory.GetFiles(path, "*.csv");
            string finalFile = Path.Combine(path, "VulnerabilityList.csv");
            using (StreamWriter bw = new StreamWriter(File.Create(finalFile)))
            {
                bw.WriteLine("Profile Name, Tag, Frequency, Vulnerability Level, Coder Comment, Image List, Category");
                foreach(string file in files)
                {
                    using (StreamReader sr = new StreamReader(file))
                    {
                        sr.ReadLine();
                        string line;
                        while((line = sr.ReadLine()) != null)
                        {
                            bw.WriteLine(Path.GetFileNameWithoutExtension(file) +"," +line);
                        }
                    }
                }
            }
        }
    }
}
