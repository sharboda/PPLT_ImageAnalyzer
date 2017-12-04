namespace ImageAnalyzer
{
    partial class ImageForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.pictBox = new System.Windows.Forms.PictureBox();
            this.richGoogle = new System.Windows.Forms.RichTextBox();
            this.richMicrosoft = new System.Windows.Forms.RichTextBox();
            ((System.ComponentModel.ISupportInitialize)(this.pictBox)).BeginInit();
            this.SuspendLayout();
            // 
            // pictBox
            // 
            this.pictBox.Location = new System.Drawing.Point(28, 47);
            this.pictBox.Name = "pictBox";
            this.pictBox.Size = new System.Drawing.Size(1257, 389);
            this.pictBox.TabIndex = 0;
            this.pictBox.TabStop = false;
            // 
            // richGoogle
            // 
            this.richGoogle.Location = new System.Drawing.Point(58, 458);
            this.richGoogle.Name = "richGoogle";
            this.richGoogle.Size = new System.Drawing.Size(604, 629);
            this.richGoogle.TabIndex = 1;
            this.richGoogle.Text = "";
            // 
            // richMicrosoft
            // 
            this.richMicrosoft.Location = new System.Drawing.Point(710, 458);
            this.richMicrosoft.Name = "richMicrosoft";
            this.richMicrosoft.Size = new System.Drawing.Size(575, 629);
            this.richMicrosoft.TabIndex = 2;
            this.richMicrosoft.Text = "";
            // 
            // ImageForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(16F, 31F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1770, 1117);
            this.Controls.Add(this.richMicrosoft);
            this.Controls.Add(this.richGoogle);
            this.Controls.Add(this.pictBox);
            this.Name = "ImageForm";
            this.Text = "ImageForm";
            ((System.ComponentModel.ISupportInitialize)(this.pictBox)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.PictureBox pictBox;
        private System.Windows.Forms.RichTextBox richGoogle;
        private System.Windows.Forms.RichTextBox richMicrosoft;
    }
}