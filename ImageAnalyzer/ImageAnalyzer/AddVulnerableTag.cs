using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ImageAnalyzer
{
    internal partial class AddVulnerableTag : Form
    {
        TagMetaData tagData;
        public AddVulnerableTag(TagMetaData metaData)
        {
            InitializeComponent();
            tagData = metaData;
            lblTag.Text = tagData.ToString();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            int vulLevel = 3;
            if (radioButton1.Checked)
                vulLevel = 1;
            else if (radioButton2.Checked)
                vulLevel = 2;
            else if (radioButton3.Checked)
                vulLevel = 3;
            else if (radioButton4.Checked)
                vulLevel = 4;
            else
                vulLevel = 5;
            FinalVulnerableItem item = new FinalVulnerableItem(tagData, vulLevel, rtxt.Text);
            Form1.GetInstance().updateFinalList(item);
            this.Close();
        }
    }
}
