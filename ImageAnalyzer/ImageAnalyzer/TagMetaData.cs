using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImageAnalyzer
{
    internal class TagMetaData : IComparable<TagMetaData>
    {
        private List<string> imageList;
        public string tag
        {
            private set;
            get;
        }
        public int frequency
        {
            get
            {
                return imageList.Count;
            }
        }
        public bool hasBaby = false;

        internal TagMetaData(String newTag, string imagePath)
        {
            tag = newTag;
            imageList = new List<string> { imagePath };
        }

        internal void addImage(string imagePath)
        {
            imageList.Add(imagePath);
        }

        public List<string> GetImageList()
        {
            return imageList;
        }

        public override string ToString()
        {
            return "[" + tag + ", " + frequency + "]";
        }

        public int CompareTo(TagMetaData other)
        {
            return other.frequency.CompareTo(frequency);
        }
    }
}
