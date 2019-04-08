﻿using System;
using System.Collections.Generic;
using System.Windows.Forms;
using HealthCare.Controller;
using HealthCare.Model;

namespace HealthCare.UserControls
{
    public partial class ViewNurseUserControl : UserControl
    {
        private readonly HealthcareController healthController;
        private List<State> stateList;
        private Person currentNurse;

        public ViewNurseUserControl()
        {
            this.healthController = new HealthcareController();
            InitializeComponent();
        }

        private void addButton_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(this.lastNameTextBox.Text) || String.IsNullOrEmpty(this.firstNameTextBox.Text) || String.IsNullOrEmpty(this.cityTextBox.Text) || !this.phoneTextBox.MaskFull ||
                 !this.ssnTextBox.MaskFull || String.IsNullOrEmpty(this.addressTextBox.Text) || !this.zipTextBox.MaskFull || this.DOBDateTimePicker.Value == null)
            {
                MessageBox.Show("All fields must be filled in completely. SSN must be 9 digits, phone must be 10 digits, and zipcode must be 5 digits", "Invalid input format",
                MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                try
                {
                    Person person = new Person();
                    person.LastName = this.lastNameTextBox.Text;
                    person.FirstName = this.firstNameTextBox.Text;
                    person.City = this.cityTextBox.Text;
                    person.PhoneNumber = this.phoneTextBox.Text;
                    person.SSN = this.ssnTextBox.Text;
                    person.StreetAddress = this.addressTextBox.Text;
                    person.StateCode = stateList[this.stateCodeComboBox.SelectedIndex].stateCode;
                    person.ZipCode = Convert.ToInt32(this.zipTextBox.Text);
                    person.DateOfBirth = this.DOBDateTimePicker.Value;

                    this.healthController.addNurse(person);

                   // MessageBox.Show("New Nurse Added"); 
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, ex.GetType().ToString());
                }
            }
        }

        private void ViewNurseUserControl_Load(object sender, EventArgs e)
        {

            try
            {
                stateList = this.healthController.GetAllStates();

                stateCodeComboBox.DataSource = stateList;
                stateCodeComboBox.DisplayMember = "stateName";
                stateCodeComboBox.ValueMember = "stateCode";
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message,
                    "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void clear_Button_Click(object sender, EventArgs e)
        {
            this.ClearForm();
        }

        private void ClearForm()
        {
            this.addressTextBox.Clear();
            this.cityTextBox.Clear();
            this.zipTextBox.Clear();
            this.phoneTextBox.Clear();
            this.ssnTextBox.Clear();
            this.lastNameTextBox.Clear();
            this.firstNameTextBox.Clear();
            this.stateCodeComboBox.SelectedIndex = 0;
        }

        private void UpdateButton_Click(object sender, EventArgs e)
        {
            if (this.lastNameTextBox.Text == null || this.lastNameTextBox.Text == "" ||
                this.firstNameTextBox.Text == null || this.firstNameTextBox.Text == "" ||
                this.cityTextBox.Text == null || this.cityTextBox.Text == "" ||
                !this.phoneTextBox.MaskFull ||
                !this.ssnTextBox.MaskFull ||
                this.addressTextBox.Text == null || this.addressTextBox.Text == "" ||
                !this.zipTextBox.MaskFull ||
                !this.ssnTextBox.MaskFull ||
                this.DOBDateTimePicker.Value == null)
            {
                MessageBox.Show("All fields must be filled in completely. SSN must be 9 digits, phone must be 10 digits, and zipcode must be 5 digits", "Invalid input format",
                MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                string lName = this.lastNameTextBox.Text;
                string fName = this.firstNameTextBox.Text;
                DateTime dob = this.DOBDateTimePicker.Value.Date;
                string city = this.cityTextBox.Text;
                string streetAddress = this.addressTextBox.Text;
                string state = stateList[this.stateCodeComboBox.SelectedIndex].stateCode;
                int zipCode = Convert.ToInt32(this.zipTextBox.Text);
                string phoneNumber = this.phoneTextBox.Text;
                int ssn = Convert.ToInt32(this.ssnTextBox.Text);
                try
                {
                    this.healthController.UpdateNuse(this.currentNurse.PersonID, lName, fName, dob, streetAddress, city, state, zipCode, phoneNumber, ssn);
                    MessageBox.Show("Nurse has been updated");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, ex.GetType().ToString());
                }
            }

        }
    }
}
