namespace ImageAnalyzer
{
    partial class Form1
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
            this.txtFolderPicker = new System.Windows.Forms.TextBox();
            this.btnFolderPicker = new System.Windows.Forms.Button();
            this.cmbView = new System.Windows.Forms.ComboBox();
            this.button1 = new System.Windows.Forms.Button();
            this.listResults = new System.Windows.Forms.ListBox();
            this.listImage = new System.Windows.Forms.ListBox();
            this.listConsole = new System.Windows.Forms.ListBox();
            this.listFinalTags = new System.Windows.Forms.ListBox();
            this.selectTag = new System.Windows.Forms.Button();
            this.btnRemoveFinalTag = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.btnExport = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // txtFolderPicker
            // 
            this.txtFolderPicker.Enabled = false;
            this.txtFolderPicker.Location = new System.Drawing.Point(624, 109);
            this.txtFolderPicker.Name = "txtFolderPicker";
            this.txtFolderPicker.ReadOnly = true;
            this.txtFolderPicker.Size = new System.Drawing.Size(932, 38);
            this.txtFolderPicker.TabIndex = 0;
            // 
            // btnFolderPicker
            // 
            this.btnFolderPicker.Location = new System.Drawing.Point(130, 100);
            this.btnFolderPicker.Name = "btnFolderPicker";
            this.btnFolderPicker.Size = new System.Drawing.Size(420, 55);
            this.btnFolderPicker.TabIndex = 1;
            this.btnFolderPicker.Text = "Browse to Folder With Pic";
            this.btnFolderPicker.UseVisualStyleBackColor = true;
            this.btnFolderPicker.Click += new System.EventHandler(this.btnFolderPicker_Click);
            // 
            // cmbView
            // 
            this.cmbView.FormattingEnabled = true;
            this.cmbView.Location = new System.Drawing.Point(118, 282);
            this.cmbView.Name = "cmbView";
            this.cmbView.Size = new System.Drawing.Size(545, 39);
            this.cmbView.TabIndex = 2;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(725, 282);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(194, 53);
            this.button1.TabIndex = 3;
            this.button1.Text = "View Results";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.btnViewRes);
            // 
            // listResults
            // 
            this.listResults.FormattingEnabled = true;
            this.listResults.ItemHeight = 31;
            this.listResults.Location = new System.Drawing.Point(130, 459);
            this.listResults.Name = "listResults";
            this.listResults.Size = new System.Drawing.Size(952, 376);
            this.listResults.TabIndex = 4;
            // 
            // listImage
            // 
            this.listImage.FormattingEnabled = true;
            this.listImage.ItemHeight = 31;
            this.listImage.Location = new System.Drawing.Point(1264, 459);
            this.listImage.Name = "listImage";
            this.listImage.Size = new System.Drawing.Size(666, 376);
            this.listImage.TabIndex = 5;
            // 
            // listConsole
            // 
            this.listConsole.FormattingEnabled = true;
            this.listConsole.ItemHeight = 31;
            this.listConsole.Location = new System.Drawing.Point(141, 963);
            this.listConsole.Name = "listConsole";
            this.listConsole.Size = new System.Drawing.Size(1796, 314);
            this.listConsole.TabIndex = 6;
            // 
            // listFinalTags
            // 
            this.listFinalTags.FormattingEnabled = true;
            this.listFinalTags.ItemHeight = 31;
            this.listFinalTags.Location = new System.Drawing.Point(2115, 459);
            this.listFinalTags.Name = "listFinalTags";
            this.listFinalTags.Size = new System.Drawing.Size(661, 686);
            this.listFinalTags.TabIndex = 7;
            // 
            // selectTag
            // 
            this.selectTag.Location = new System.Drawing.Point(1199, 258);
            this.selectTag.Name = "selectTag";
            this.selectTag.Size = new System.Drawing.Size(418, 63);
            this.selectTag.TabIndex = 8;
            this.selectTag.Text = "Add selected tag";
            this.selectTag.UseVisualStyleBackColor = true;
            this.selectTag.Click += new System.EventHandler(this.selectTag_Click);
            // 
            // btnRemoveFinalTag
            // 
            this.btnRemoveFinalTag.Location = new System.Drawing.Point(2042, 237);
            this.btnRemoveFinalTag.Name = "btnRemoveFinalTag";
            this.btnRemoveFinalTag.Size = new System.Drawing.Size(276, 64);
            this.btnRemoveFinalTag.TabIndex = 9;
            this.btnRemoveFinalTag.Text = "Remove final tag";
            this.btnRemoveFinalTag.UseVisualStyleBackColor = true;
            this.btnRemoveFinalTag.Click += new System.EventHandler(this.btnRemoveFinalTag_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(135, 406);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(356, 32);
            this.label1.TabIndex = 10;
            this.label1.Text = "Results of chosen category";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(1264, 406);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(366, 32);
            this.label2.TabIndex = 11;
            this.label2.Text = "Images detected for that tag";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(2115, 406);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(351, 32);
            this.label3.TabIndex = 12;
            this.label3.Text = "Selected Tags for Analysis";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(141, 925);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(101, 32);
            this.label4.TabIndex = 13;
            this.label4.Text = "Output";
            // 
            // btnExport
            // 
            this.btnExport.Location = new System.Drawing.Point(2398, 237);
            this.btnExport.Name = "btnExport";
            this.btnExport.Size = new System.Drawing.Size(323, 63);
            this.btnExport.TabIndex = 14;
            this.btnExport.Text = "Export Selected Tags";
            this.btnExport.UseVisualStyleBackColor = true;
            this.btnExport.Click += new System.EventHandler(this.btnExport_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(16F, 31F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(2854, 1247);
            this.Controls.Add(this.btnExport);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnRemoveFinalTag);
            this.Controls.Add(this.selectTag);
            this.Controls.Add(this.listFinalTags);
            this.Controls.Add(this.listConsole);
            this.Controls.Add(this.listImage);
            this.Controls.Add(this.listResults);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.cmbView);
            this.Controls.Add(this.btnFolderPicker);
            this.Controls.Add(this.txtFolderPicker);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtFolderPicker;
        private System.Windows.Forms.Button btnFolderPicker;
        private System.Windows.Forms.ComboBox cmbView;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.ListBox listResults;
        private System.Windows.Forms.ListBox listImage;
        private System.Windows.Forms.ListBox listConsole;
        private System.Windows.Forms.ListBox listFinalTags;
        private System.Windows.Forms.Button selectTag;
        private System.Windows.Forms.Button btnRemoveFinalTag;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnExport;
    }
}

