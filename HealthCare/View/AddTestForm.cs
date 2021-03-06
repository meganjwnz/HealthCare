﻿using HealthCare.UserControls;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HealthCare.View
{
    public partial class AddTestForm : Form
    {
        public int VisitID { get; set; }
        public VisitUserControl VisitControl { get; set; }
        public AddTestForm(int visitID, VisitUserControl visitControl)
        {
            InitializeComponent();
            this.VisitID = visitID;
            this.VisitControl = visitControl;
        }
    }
}
