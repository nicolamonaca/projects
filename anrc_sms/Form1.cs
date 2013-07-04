// @Class-Name:    SMSMobile
// @Status:        COMPLETED
// @Last-Modified: 10/07/2011 20.08


using System;
using System.Linq;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Media;
using System.Threading;
using System.Runtime.InteropServices;


namespace SMSMobile_R3
{
	public partial class SMSMobile : Form
	{
		[DllImport("coredll.dll")]

		private static extern int PlaySound(string szSound, IntPtr hModule, int flags);
		private const int SND_FILENAME = 0x20000;
		private const int SND_SYNC = 0x0;
       		private Image imageAlert;
       		private Image imageNoAlert;
       		private string path;
		private WSN start;


		public SMSMobile()
		{
			InitializeComponent();
		}


        	private String[] createRecord(String[] metatag)
		{
            		String[] record = new String[5];

            		for(int i = 0; i < record.Length; i++)
                		record[i] = metatag[i + 1];

            		return record;
        	}
        

        	public void Form1_Load(object sender, EventArgs e)
		{
            		string myDir = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase);

             		this.path = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase);
             		this.imageAlert = new Bitmap(myDir + @"\Red.png");
             		this.imageNoAlert = new Bitmap(myDir + @"\Green.png");
        	}


        	private void timer1_Tick(object sender, EventArgs e)
        	{
            		timer1.Interval = Configuration.PAUSA_STANDARD;
            
            		start = new WSN();
           
            		start.start();
            
            		if (start.getRelevationString() == null) 
            		{
               	 		timer1.Enabled = false;
                		MessageBox.Show("No more relevations available.");
            		}
            
            		MetatagManager metatagManager = new MetatagManager();
            		Metatag metatag = metatagManager.showMetatag();

            		if (metatag.getRoomCode() == "R001" && (metatag.getRadioactivityInterpretation() == "ALERT" || metatag.getTemperatureInterpretation() == "ALERT"))
               			PlaySound(path + @"\GiuliaAllarmeLocale1.wav", IntPtr.Zero, SND_FILENAME | SND_SYNC);
            		else if (metatag.getRoomCode() == "R002" && (metatag.getRadioactivityInterpretation() == "ALERT" || metatag.getTemperatureInterpretation() == "ALERT"))
               			PlaySound(path + @"\GiuliaAllarmeLocale2.wav", IntPtr.Zero, SND_FILENAME | SND_SYNC);

            		// Show a radioactivity metatag
            		if(metatag.getRadioactivityInterpretation() == "ALERT")
            		{
                		StateControl1.Image = imageAlert;
                		Ora1.Text = metatag.GetOra().Substring(0, 5);
                		ValMax1.Text = metatag.getMaximumRadioactivityValue().ToString();
                		Unita1.Text = metatag.getRadioactivityUnits();
                		Fault1.Text = metatag.getTotalFaultsInRadioactivityLevels() + "/5";
                		Ora1.ForeColor = Color.Red;
                		ValMax1.ForeColor = Color.Red;
                		Unita1.ForeColor = Color.Red;
                		Fault1.ForeColor = Color.Red;
            		}
            		else if (metatag.getRadioactivityInterpretation() == "NOALERT")
            		{
                		StateControl1.Image = imageNoAlert;
                		Ora1.Text = metatag.getTime().Substring(0, 5);
                		ValMax1.Text = metatag.getMaximumRadioactivityValue().ToString();
                		Unita1.Text = metatag.getRadioactivityUnits();
                		Fault1.Text = metatag.getTotalFaultsInRadioactivityLevels() + "/5";
                		Ora1.ForeColor = Color.Green;
                		ValMax1.ForeColor = Color.Green;
                		Unita1.ForeColor = Color.Green;
                		Fault1.ForeColor = Color.Green;
            		}

            		// Show a temperature metatag
            		if (metatag.getTemperatureInterpretation() == "ALERT")
            		{
                		StateControl2.Image = imageAlert;
                		Ora2.Text = metatag.geTime().Substring(0, 5);
                		ValMax2.Text = metatag.getMaximumTemperatureValue().ToString();
                		Unita2.Text = metatag.getTemperatureUnits();
                		Fault2.Text = metatag.getTotalFaultsInTemperatureLevels() + "/3";
                		Ora2.ForeColor = Color.Red;
                		ValMax2.ForeColor = Color.Red;
                		Unita2.ForeColor = Color.Red;
                		Fault2.ForeColor = Color.Red;
            		}
            		else if (metatag.getTemperatureInterpretation() == "NOALERT")
            		{
                 		StateControl2.Image = imageNoAlert;
                 		Ora2.Text = metatag.getTime().Substring(0, 5);
                 		ValMax2.Text = metatag.getMaximumTemperatureValue().ToString();
                 		Unita2.Text = metatag.getTemperatureUnits();
                 		Fault2.Text = metatag.getTotalFaultsInTemperatureLevels() + "/3";
                 		Ora2.ForeColor = Color.Green;
                 		ValMax2.ForeColor = Color.Green;
                 		Unita2.ForeColor = Color.Green;
                 		Fault2.ForeColor = Color.Green; 
            		}
        	}


        	private void Indietro_Click_1(object sender, EventArgs e)
        	{
			listView1.Visible = false;
        	}


        	private void Storico_Click(object sender, EventArgs e) { }


        	// Shows history of room 1
        	private void menuItem1_Click(object sender, EventArgs e)
		{
			listView1.Visible = true;
			listView1.Items.Clear();

			ListViewItem lvi;

			HistoryManager historyManager = new HistoryManager();

			String content = historyManager.sendViewHistoryRequest();
			String[] metatagValue = new String[6];
			String[] metatags = content.Split('-');
            		int metatags = metatags.Length - 1;
            		int metatagIndex = 0;

            		for(int z = 0; z < metatags; z++)
            		{
                		String temp = metatags[metatagIndex];
                		metatagValue = temp.Split(',');
                		metatagIndex++;

                		if(metatagValue[0] == Configuration.CODE_ROOM_1)
                		{
                    			lvi = new ListViewItem(createRecord(metatagValue));
                    			listView1.Items.Add(lvi);
                		}
            		}

            		metatagIndex = 0; // Resets metatags count
		}


        	// Shows history of room 2
        	private void menuItem2_Click(object sender, EventArgs e)
        	{
			listView1.Visible = true;
			listView1.Items.Clear();

			ListViewItem lvi;

			HistoryManager historyManager = new HistoryManager();

            		String content = historyManager.sendViewHistoryRequest();

            		String[] metatagValue = new String[6];
            		String[] metatags = content.Split('-');
            		int metatags = metatags.Length - 1;
            		int metatagIndex = 0;

            		for (int z = 0; z < metatags; z++)
            		{
                		String temp = metatags[metatagIndex];
                		metatagValue = temp.Split(',');
                		metatagIndex++;

                		if (metatagValue[0] == Configuration.CODE_ROOM_2)
                		{
                    			lvi = new ListViewItem(createRecord(metatagValue));
                    			listView1.Items.Add(lvi);
                		}
            		}

            		metatagIndex = 0; // Resets metatags count
		}
    	}
}