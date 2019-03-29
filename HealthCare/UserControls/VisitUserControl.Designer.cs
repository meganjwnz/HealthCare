﻿namespace HealthCare.UserControls
{
    partial class VisitUserControl
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.doctorLabel = new System.Windows.Forms.Label();
            this.weightLabel = new System.Windows.Forms.Label();
            this.weightTextBox = new System.Windows.Forms.TextBox();
            this.tempTextBox = new System.Windows.Forms.TextBox();
            this.tempLabel = new System.Windows.Forms.Label();
            this.systolicTextBox = new System.Windows.Forms.TextBox();
            this.bpLabel = new System.Windows.Forms.Label();
            this.diastolicTextBox = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.symptomsLabel = new System.Windows.Forms.Label();
            this.symptomsTextBox = new System.Windows.Forms.TextBox();
            this.initDiagnosisTextBox = new System.Windows.Forms.TextBox();
            this.initDiagnosisLabel = new System.Windows.Forms.Label();
            this.orderedTestlabel = new System.Windows.Forms.Label();
            this.addTestsButton = new System.Windows.Forms.Button();
            this.finalDiagnosisTextBox = new System.Windows.Forms.TextBox();
            this.finalDiagnosisLabel = new System.Windows.Forms.Label();
            this.statusLabel = new System.Windows.Forms.Label();
            this.pendingRadioButton = new System.Windows.Forms.RadioButton();
            this.completeRadioButton = new System.Windows.Forms.RadioButton();
            this.updateButton = new System.Windows.Forms.Button();
            this.completedLabel = new System.Windows.Forms.Label();
            this.visitListView = new System.Windows.Forms.ListView();
            this.visitDateHeader = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.selectApttLabel = new System.Windows.Forms.Label();
            this.doctorTextBox = new System.Windows.Forms.TextBox();
            this.testsListView = new System.Windows.Forms.ListView();
            this.testNameHeader = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.resultHeader = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.SuspendLayout();
            // 
            // doctorLabel
            // 
            this.doctorLabel.AutoSize = true;
            this.doctorLabel.Location = new System.Drawing.Point(22, 138);
            this.doctorLabel.Name = "doctorLabel";
            this.doctorLabel.Size = new System.Drawing.Size(42, 13);
            this.doctorLabel.TabIndex = 0;
            this.doctorLabel.Text = "Doctor:";
            // 
            // weightLabel
            // 
            this.weightLabel.AutoSize = true;
            this.weightLabel.Location = new System.Drawing.Point(22, 166);
            this.weightLabel.Name = "weightLabel";
            this.weightLabel.Size = new System.Drawing.Size(66, 13);
            this.weightLabel.TabIndex = 2;
            this.weightLabel.Text = "Weight (lbs):";
            // 
            // weightTextBox
            // 
            this.weightTextBox.Location = new System.Drawing.Point(111, 163);
            this.weightTextBox.Name = "weightTextBox";
            this.weightTextBox.Size = new System.Drawing.Size(100, 20);
            this.weightTextBox.TabIndex = 3;
            // 
            // tempTextBox
            // 
            this.tempTextBox.Location = new System.Drawing.Point(290, 163);
            this.tempTextBox.Name = "tempTextBox";
            this.tempTextBox.Size = new System.Drawing.Size(96, 20);
            this.tempTextBox.TabIndex = 5;
            // 
            // tempLabel
            // 
            this.tempLabel.AutoSize = true;
            this.tempLabel.Location = new System.Drawing.Point(232, 166);
            this.tempLabel.Name = "tempLabel";
            this.tempLabel.Size = new System.Drawing.Size(52, 13);
            this.tempLabel.TabIndex = 4;
            this.tempLabel.Text = "Temp (F):";
            // 
            // systolicTextBox
            // 
            this.systolicTextBox.Location = new System.Drawing.Point(519, 163);
            this.systolicTextBox.Name = "systolicTextBox";
            this.systolicTextBox.Size = new System.Drawing.Size(45, 20);
            this.systolicTextBox.TabIndex = 7;
            // 
            // bpLabel
            // 
            this.bpLabel.AutoSize = true;
            this.bpLabel.Location = new System.Drawing.Point(405, 166);
            this.bpLabel.Name = "bpLabel";
            this.bpLabel.Size = new System.Drawing.Size(108, 13);
            this.bpLabel.TabIndex = 6;
            this.bpLabel.Text = "BP Systolic/Diastolic:";
            // 
            // diastolicTextBox
            // 
            this.diastolicTextBox.Location = new System.Drawing.Point(589, 163);
            this.diastolicTextBox.Name = "diastolicTextBox";
            this.diastolicTextBox.Size = new System.Drawing.Size(45, 20);
            this.diastolicTextBox.TabIndex = 8;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(571, 167);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(12, 13);
            this.label2.TabIndex = 9;
            this.label2.Text = "/";
            // 
            // symptomsLabel
            // 
            this.symptomsLabel.AutoSize = true;
            this.symptomsLabel.Location = new System.Drawing.Point(22, 190);
            this.symptomsLabel.Name = "symptomsLabel";
            this.symptomsLabel.Size = new System.Drawing.Size(58, 13);
            this.symptomsLabel.TabIndex = 10;
            this.symptomsLabel.Text = "Symptoms:";
            // 
            // symptomsTextBox
            // 
            this.symptomsTextBox.Location = new System.Drawing.Point(111, 190);
            this.symptomsTextBox.Multiline = true;
            this.symptomsTextBox.Name = "symptomsTextBox";
            this.symptomsTextBox.Size = new System.Drawing.Size(523, 75);
            this.symptomsTextBox.TabIndex = 11;
            // 
            // initDiagnosisTextBox
            // 
            this.initDiagnosisTextBox.Location = new System.Drawing.Point(111, 272);
            this.initDiagnosisTextBox.Name = "initDiagnosisTextBox";
            this.initDiagnosisTextBox.Size = new System.Drawing.Size(275, 20);
            this.initDiagnosisTextBox.TabIndex = 13;
            // 
            // initDiagnosisLabel
            // 
            this.initDiagnosisLabel.AutoSize = true;
            this.initDiagnosisLabel.Location = new System.Drawing.Point(22, 275);
            this.initDiagnosisLabel.Name = "initDiagnosisLabel";
            this.initDiagnosisLabel.Size = new System.Drawing.Size(83, 13);
            this.initDiagnosisLabel.TabIndex = 12;
            this.initDiagnosisLabel.Text = "Initial Diagnosis:";
            // 
            // orderedTestlabel
            // 
            this.orderedTestlabel.AutoSize = true;
            this.orderedTestlabel.Location = new System.Drawing.Point(22, 300);
            this.orderedTestlabel.Name = "orderedTestlabel";
            this.orderedTestlabel.Size = new System.Drawing.Size(77, 13);
            this.orderedTestlabel.TabIndex = 14;
            this.orderedTestlabel.Text = "Ordered Tests:";
            // 
            // addTestsButton
            // 
            this.addTestsButton.Location = new System.Drawing.Point(111, 414);
            this.addTestsButton.Name = "addTestsButton";
            this.addTestsButton.Size = new System.Drawing.Size(117, 23);
            this.addTestsButton.TabIndex = 16;
            this.addTestsButton.Text = "Add Tests";
            this.addTestsButton.UseVisualStyleBackColor = true;
            // 
            // finalDiagnosisTextBox
            // 
            this.finalDiagnosisTextBox.Location = new System.Drawing.Point(111, 443);
            this.finalDiagnosisTextBox.Name = "finalDiagnosisTextBox";
            this.finalDiagnosisTextBox.Size = new System.Drawing.Size(275, 20);
            this.finalDiagnosisTextBox.TabIndex = 18;
            // 
            // finalDiagnosisLabel
            // 
            this.finalDiagnosisLabel.AutoSize = true;
            this.finalDiagnosisLabel.Location = new System.Drawing.Point(22, 446);
            this.finalDiagnosisLabel.Name = "finalDiagnosisLabel";
            this.finalDiagnosisLabel.Size = new System.Drawing.Size(81, 13);
            this.finalDiagnosisLabel.TabIndex = 17;
            this.finalDiagnosisLabel.Text = "Final Diagnosis:";
            // 
            // statusLabel
            // 
            this.statusLabel.AutoSize = true;
            this.statusLabel.Location = new System.Drawing.Point(22, 480);
            this.statusLabel.Name = "statusLabel";
            this.statusLabel.Size = new System.Drawing.Size(62, 13);
            this.statusLabel.TabIndex = 19;
            this.statusLabel.Text = "Visit Status:";
            // 
            // pendingRadioButton
            // 
            this.pendingRadioButton.AutoSize = true;
            this.pendingRadioButton.Location = new System.Drawing.Point(111, 478);
            this.pendingRadioButton.Name = "pendingRadioButton";
            this.pendingRadioButton.Size = new System.Drawing.Size(64, 17);
            this.pendingRadioButton.TabIndex = 20;
            this.pendingRadioButton.TabStop = true;
            this.pendingRadioButton.Text = "Pending";
            this.pendingRadioButton.UseVisualStyleBackColor = true;
            // 
            // completeRadioButton
            // 
            this.completeRadioButton.AutoSize = true;
            this.completeRadioButton.Location = new System.Drawing.Point(200, 478);
            this.completeRadioButton.Name = "completeRadioButton";
            this.completeRadioButton.Size = new System.Drawing.Size(69, 17);
            this.completeRadioButton.TabIndex = 21;
            this.completeRadioButton.TabStop = true;
            this.completeRadioButton.Text = "Complete";
            this.completeRadioButton.UseVisualStyleBackColor = true;
            // 
            // updateButton
            // 
            this.updateButton.Location = new System.Drawing.Point(558, 515);
            this.updateButton.Name = "updateButton";
            this.updateButton.Size = new System.Drawing.Size(75, 23);
            this.updateButton.TabIndex = 22;
            this.updateButton.Text = "Update Visit";
            this.updateButton.UseVisualStyleBackColor = true;
            // 
            // completedLabel
            // 
            this.completedLabel.AutoSize = true;
            this.completedLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.completedLabel.ForeColor = System.Drawing.Color.Red;
            this.completedLabel.Location = new System.Drawing.Point(176, 515);
            this.completedLabel.Name = "completedLabel";
            this.completedLabel.Size = new System.Drawing.Size(341, 17);
            this.completedLabel.TabIndex = 23;
            this.completedLabel.Text = "Visit has been marked complete - cannot edit.";
            this.completedLabel.Visible = false;
            // 
            // visitListView
            // 
            this.visitListView.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.visitDateHeader});
            this.visitListView.FullRowSelect = true;
            this.visitListView.Location = new System.Drawing.Point(111, 18);
            this.visitListView.MultiSelect = false;
            this.visitListView.Name = "visitListView";
            this.visitListView.Size = new System.Drawing.Size(522, 102);
            this.visitListView.TabIndex = 25;
            this.visitListView.UseCompatibleStateImageBehavior = false;
            this.visitListView.View = System.Windows.Forms.View.Details;
            this.visitListView.SelectedIndexChanged += new System.EventHandler(this.VisitListView_SelectedIndexChanged);
            // 
            // visitDateHeader
            // 
            this.visitDateHeader.Text = "Date of Visit";
            this.visitDateHeader.Width = 92;
            // 
            // selectApttLabel
            // 
            this.selectApttLabel.AutoSize = true;
            this.selectApttLabel.Location = new System.Drawing.Point(22, 18);
            this.selectApttLabel.Name = "selectApttLabel";
            this.selectApttLabel.Size = new System.Drawing.Size(65, 13);
            this.selectApttLabel.TabIndex = 26;
            this.selectApttLabel.Text = "Select Appt:";
            // 
            // doctorTextBox
            // 
            this.doctorTextBox.Location = new System.Drawing.Point(111, 130);
            this.doctorTextBox.Name = "doctorTextBox";
            this.doctorTextBox.ReadOnly = true;
            this.doctorTextBox.Size = new System.Drawing.Size(100, 20);
            this.doctorTextBox.TabIndex = 27;
            // 
            // testsListView
            // 
            this.testsListView.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.testNameHeader,
            this.resultHeader});
            this.testsListView.Location = new System.Drawing.Point(111, 300);
            this.testsListView.Name = "testsListView";
            this.testsListView.Size = new System.Drawing.Size(522, 108);
            this.testsListView.TabIndex = 28;
            this.testsListView.UseCompatibleStateImageBehavior = false;
            // 
            // testNameHeader
            // 
            this.testNameHeader.Text = "Test Name";
            // 
            // resultHeader
            // 
            this.resultHeader.Text = "Result";
            // 
            // VisitUserControl
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.testsListView);
            this.Controls.Add(this.doctorTextBox);
            this.Controls.Add(this.selectApttLabel);
            this.Controls.Add(this.visitListView);
            this.Controls.Add(this.completedLabel);
            this.Controls.Add(this.updateButton);
            this.Controls.Add(this.completeRadioButton);
            this.Controls.Add(this.pendingRadioButton);
            this.Controls.Add(this.statusLabel);
            this.Controls.Add(this.finalDiagnosisTextBox);
            this.Controls.Add(this.finalDiagnosisLabel);
            this.Controls.Add(this.addTestsButton);
            this.Controls.Add(this.orderedTestlabel);
            this.Controls.Add(this.initDiagnosisTextBox);
            this.Controls.Add(this.initDiagnosisLabel);
            this.Controls.Add(this.symptomsTextBox);
            this.Controls.Add(this.symptomsLabel);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.diastolicTextBox);
            this.Controls.Add(this.systolicTextBox);
            this.Controls.Add(this.bpLabel);
            this.Controls.Add(this.tempTextBox);
            this.Controls.Add(this.tempLabel);
            this.Controls.Add(this.weightTextBox);
            this.Controls.Add(this.weightLabel);
            this.Controls.Add(this.doctorLabel);
            this.Name = "VisitUserControl";
            this.Size = new System.Drawing.Size(665, 555);
            this.Load += new System.EventHandler(this.VisitUserControl_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label doctorLabel;
        private System.Windows.Forms.Label weightLabel;
        private System.Windows.Forms.TextBox weightTextBox;
        private System.Windows.Forms.TextBox tempTextBox;
        private System.Windows.Forms.Label tempLabel;
        private System.Windows.Forms.TextBox systolicTextBox;
        private System.Windows.Forms.Label bpLabel;
        private System.Windows.Forms.TextBox diastolicTextBox;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label symptomsLabel;
        private System.Windows.Forms.TextBox symptomsTextBox;
        private System.Windows.Forms.TextBox initDiagnosisTextBox;
        private System.Windows.Forms.Label initDiagnosisLabel;
        private System.Windows.Forms.Label orderedTestlabel;
        private System.Windows.Forms.Button addTestsButton;
        private System.Windows.Forms.TextBox finalDiagnosisTextBox;
        private System.Windows.Forms.Label finalDiagnosisLabel;
        private System.Windows.Forms.Label statusLabel;
        private System.Windows.Forms.RadioButton pendingRadioButton;
        private System.Windows.Forms.RadioButton completeRadioButton;
        private System.Windows.Forms.Button updateButton;
        private System.Windows.Forms.Label completedLabel;
        private System.Windows.Forms.ListView visitListView;
        private System.Windows.Forms.Label selectApttLabel;
        private System.Windows.Forms.ColumnHeader visitDateHeader;
        private System.Windows.Forms.TextBox doctorTextBox;
        private System.Windows.Forms.ListView testsListView;
        private System.Windows.Forms.ColumnHeader testNameHeader;
        private System.Windows.Forms.ColumnHeader resultHeader;
    }
}
