using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImageAnalyzer
{
    internal class FinalVulnerableItem
    {
        internal TagMetaData tagData;
        internal int vulLevel;
        internal string cmt;
        internal FinalVulnerableItem(TagMetaData tagMetaData, int vulnerabilityLevel, string comment)
        {
            tagData = tagMetaData;
            vulLevel = vulnerabilityLevel;
            cmt = comment;
        }

        public override string ToString()
        {
            return tagData.ToString() + " " + vulLevel + " " + cmt;
        }
    }
}
