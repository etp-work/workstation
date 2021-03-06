﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using System.Security.Permissions;
using Gecko;

namespace TestNodeMonitor
{
    static class Program
    {

        private static string XULRUNNERPATH = "\\xulrunner\\";

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            
            Gecko.Xpcom.Initialize(Application.StartupPath + XULRUNNERPATH);
            Application.Run(new Monitor());
        }

        [PermissionSet(SecurityAction.Demand, Name = "FullTrust")]
        public static void Run()
        {

        }
    }
}
