﻿using HealthCare.Controller;
using HealthCare.Model;
using HealthCare.View;
using System;
using System.Windows.Forms;

namespace HealthCare.UserControls
{
    /// <summary>
    /// New Login User Control
    /// </summary>
    public partial class NewLoginUserControl : UserControl
    {
        private HashingService hashing;
        private HealthcareController healthcareController;

        /// <summary>
        /// Initialize the component
        /// </summary>
        public NewLoginUserControl()
        {
            InitializeComponent();
            hashing = new HashingService();
            healthcareController = new HealthcareController();
        }

        /// <summary>
        /// Process the create user button click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void CreateUserButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.passwordTextBox.Text == this.confirmPasswordTextBox.Text)
                {
                    Login login = new Login();
                    login.UserName = this.usernameTextBox.Text;
                    login.Password = hashing.PasswordHashing(this.passwordTextBox.Text);
                    var parent = this.ParentForm as UsernameCreationForm;
                    login.PersonID = parent.PersonID;
                    if (this.usernameTextBox.Text == "" || this.usernameTextBox.Text == null || this.usernameTextBox.Text.Length < 4)
                    {
                        MessageBox.Show("Username must not be null or blank. Username must be greater than 4 characters");
                        return;
                    }
                    if (this.passwordTextBox.Text == " " || this.passwordTextBox.Text == null || this.passwordTextBox.Text.Length < 6)
                    {
                        MessageBox.Show("Password must not be null or blank. Password must be at least 6 characters.");
                        return;
                    }

                    healthcareController.AddLogin(login);
                    MessageBox.Show("Username and password created successfully!");
                    parent.Close();
                }
                else
                {
                    MessageBox.Show("Passwords must match.");
                    return;
                }
            }
            catch
            {
                MessageBox.Show("Username could not be created.");
            }

        }
    }
}
