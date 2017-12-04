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
    public partial class ImageForm : Form
    {
        public ImageForm(string imagePath)
        {
            InitializeComponent();
            Bitmap bitmap = new Bitmap(imagePath);
            pictBox.Image = (Image)bitmap;
            pictBox.SizeMode = PictureBoxSizeMode.StretchImage;
            pictBox.ClientSize = new Size(200, 200);
            List<Tuple<string,string>> data = Form1.GetInstance().imageData[imagePath];
            if(data != null && data.Count > 0)
            {
                foreach(Tuple<string, string> item in data)
                {
                    if (item.Item1.Equals("Google"))
                    {
                        richGoogle.Text = item.Item2;
                    }
                    if (item.Item1.Equals("Microsoft"))
                    {
                        richMicrosoft.Text = item.Item2;
                    }
                }
            }
        }
        protected override void OnClosed(EventArgs e)
        {
            base.OnClosed(e);
            Image img = pictBox.Image;
            img.Dispose();
        }
    }
}
