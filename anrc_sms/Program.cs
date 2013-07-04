using System;
using System.Linq;
using System.Collections.Generic;
using System.Windows.Forms;


namespace SMSMobile_R3
{
    static class Program
    {
        /// <summary>
        ///    Main application's entry point.
        /// </summary>
        [MTAThread]
        static void Main()
        {
            Application.Run(new SMSMobile());
        }
    }
}