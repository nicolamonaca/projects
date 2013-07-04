namespace SMSMobile_R3
{
	partial class SMSMobile
	{
        	private System.ComponentModel.IContainer components = null;
        	private System.Windows.Forms.MainMenu mainMenu1;
		private System.Windows.Forms.Label label1;
        	private System.Windows.Forms.PictureBox StateControl1;
        	private System.Windows.Forms.Timer timer1;
        	private System.Windows.Forms.ListView listView1;
        	private System.Windows.Forms.ColumnHeader ORA;
        	private System.Windows.Forms.ColumnHeader VALMAX;
        	private System.Windows.Forms.ColumnHeader UNITA;
        	private System.Windows.Forms.ColumnHeader FAULT;
        	private System.Windows.Forms.Label Ora1;
        	private System.Windows.Forms.Label ValMax1;
        	private System.Windows.Forms.Label Unita1;
       		private System.Windows.Forms.Label Fault1;
        	private System.Windows.Forms.PictureBox StateControl2;
        	private System.Windows.Forms.MenuItem Indietro;
        	private System.Windows.Forms.MenuItem Storico;
        	private System.Windows.Forms.Label Fault2;
        	private System.Windows.Forms.Label Unita2;
        	private System.Windows.Forms.Label ValMax2;
        	private System.Windows.Forms.Label Ora2;
        	private System.Windows.Forms.PictureBox pictureBox1;
        	private System.Windows.Forms.MenuItem menuItem1;
        	private System.Windows.Forms.MenuItem menuItem2;
        	private System.Windows.Forms.ColumnHeader TipoSensore;


        	/// <summary>
        	/// 	Frees the resources in use
        	/// </summary>
        	/// <param name="disposing">true if resources must be deleted, false otherwise</param>
        	protected override void Dispose(bool disposing)
        	{
            		if (disposing && (components != null))
                		components.Dispose();
            	
			base.Dispose(disposing);
        	}


        	#region

        	// DO NOT EDIT
        	private void initializeComponent()
        	{
            		System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SMSMobile));
            		this.mainMenu1 = new System.Windows.Forms.MainMenu();
            		this.Indietro = new System.Windows.Forms.MenuItem();
            		this.Storico = new System.Windows.Forms.MenuItem();
            		this.menuItem1 = new System.Windows.Forms.MenuItem();
            		this.menuItem2 = new System.Windows.Forms.MenuItem();
            		this.label1 = new System.Windows.Forms.Label();
            		this.StateControl1 = new System.Windows.Forms.PictureBox();
            		this.timer1 = new System.Windows.Forms.Timer();
            		this.listView1 = new System.Windows.Forms.ListView();
            		this.ORA = new System.Windows.Forms.ColumnHeader();
            		this.TipoSensore = new System.Windows.Forms.ColumnHeader();
            		this.VALMAX = new System.Windows.Forms.ColumnHeader();
            		this.UNITA = new System.Windows.Forms.ColumnHeader();
            		this.FAULT = new System.Windows.Forms.ColumnHeader();
            		this.Ora1 = new System.Windows.Forms.Label();
            		this.ValMax1 = new System.Windows.Forms.Label();
            		this.Unita1 = new System.Windows.Forms.Label();
            		this.Fault1 = new System.Windows.Forms.Label();
            		this.StateControl2 = new System.Windows.Forms.PictureBox();
            		this.Fault2 = new System.Windows.Forms.Label();
            		this.Unita2 = new System.Windows.Forms.Label();
            		this.ValMax2 = new System.Windows.Forms.Label();
            		this.Ora2 = new System.Windows.Forms.Label();
            		this.pictureBox1 = new System.Windows.Forms.PictureBox();
            		this.SuspendLayout();
            		// 
            		// mainMenu1
            		// 
            		this.mainMenu1.MenuItems.Add(this.Indietro);
            		this.mainMenu1.MenuItems.Add(this.Storico);
            		// 
            		// BACK
            		// 
            		this.Indietro.Text = "Indietro";
            		this.Indietro.Click += new System.EventHandler(this.Indietro_Click_1);
            		// 
            		// HISTORY
            		// 
            		this.Storico.MenuItems.Add(this.menuItem1);
            		this.Storico.MenuItems.Add(this.menuItem2);
            		this.Storico.Text = "Storico";
            		this.Storico.Click += new System.EventHandler(this.Storico_Click);
            		// 
            		// ROOM 1
            		// 
            		this.menuItem1.Text = "LOCALE 1";
            		this.menuItem1.Click += new System.EventHandler(this.menuItem1_Click);
            		// 
            		// ROOM 2
            		// 
           	 	this.menuItem2.Text = "LOCALE 2";
            		this.menuItem2.Click += new System.EventHandler(this.menuItem2_Click);
            		// 
            		// HEADER
            		// 
            		this.label1.BackColor = System.Drawing.Color.LightGray;
            		this.label1.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold);
            		this.label1.ForeColor = System.Drawing.SystemColors.ControlDarkDark;
            		this.label1.Location = new System.Drawing.Point(43, 109);
            		this.label1.Name = "label1";
            		this.label1.Size = new System.Drawing.Size(194, 21);
            		this.label1.Text = "Ora     Valore   Unità     Fault";
            		this.label1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            		// 
            		// STATECONTROL
            		// 
            		this.StateControl1.Location = new System.Drawing.Point(12, 145);
            		this.StateControl1.Name = "StateControl1";
            		this.StateControl1.Size = new System.Drawing.Size(26, 22);
            		// 
            		// TIMER
            		// 
            		this.timer1.Enabled = true;
            		this.timer1.Interval = 5000;
           		this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            		// 
            		// LISTVIEW
            		// 
            		this.listView1.Anchor = System.Windows.Forms.AnchorStyles.None;
            		this.listView1.BackColor = System.Drawing.Color.Lavender;
            		this.listView1.Columns.Add(this.ORA);
            		this.listView1.Columns.Add(this.TipoSensore);
            		this.listView1.Columns.Add(this.VALMAX);
            		this.listView1.Columns.Add(this.UNITA);
            		this.listView1.Columns.Add(this.FAULT);
            		this.listView1.Font = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Regular);
            		this.listView1.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
            		this.listView1.Location = new System.Drawing.Point(0, 96);
            		this.listView1.Name = "listView1";
            		this.listView1.Size = new System.Drawing.Size(240, 172);
            		this.listView1.TabIndex = 0;
            		this.listView1.TabStop = false;
            		this.listView1.View = System.Windows.Forms.View.Details;
            		this.listView1.Visible = false;
            		// 
           		// ORA
            		// 
            		this.ORA.Text = "Data e ora";
            		this.ORA.Width = 63;
            		// 
            		// SENSOR TYPE
            		// 
           		this.TipoSensore.Text = "Tipo sensore";
            		this.TipoSensore.Width = 51;
            		// 
            		// VALMAX
            		// 
            		this.VALMAX.Text = "ValMax";
            		this.VALMAX.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            		this.VALMAX.Width = 52;
            		// 
            		// UNIT
            		// 
            		this.UNITA.Text = "Unita";
            		this.UNITA.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            		this.UNITA.Width = 31;
            		// 
            		// FAULT
            		// 
            		this.FAULT.Text = "Fault";
            		this.FAULT.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            		this.FAULT.Width = 39;
            		// 
            		// TIME 1
            		// 
           	 	this.Ora1.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold);
            		this.Ora1.Location = new System.Drawing.Point(43, 148);
            		this.Ora1.Name = "Ora1";
            		this.Ora1.Size = new System.Drawing.Size(44, 22);
            		this.Ora1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            		// 
            		// VALMAX 1
            		// 
            		this.ValMax1.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold);
            		this.ValMax1.Location = new System.Drawing.Point(95, 148);
            		this.ValMax1.Name = "ValMax1";
            		this.ValMax1.Size = new System.Drawing.Size(37, 22);
            		this.ValMax1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            		// 
            		// UNIT 1
            		// 
            		this.Unita1.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold);
            		this.Unita1.Location = new System.Drawing.Point(144, 148);
            		this.Unita1.Name = "Unita1";
            		this.Unita1.Size = new System.Drawing.Size(37, 22);
            		this.Unita1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            		// 
            		// FAULT 1
            		// 
            		this.Fault1.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold);
            		this.Fault1.Location = new System.Drawing.Point(195, 148);
            		this.Fault1.Name = "Fault1";
            		this.Fault1.Size = new System.Drawing.Size(37, 22);
            		this.Fault1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            		// 
            		// STATECONTROL 2
            		// 
            		this.StateControl2.Location = new System.Drawing.Point(12, 176);
            		this.StateControl2.Name = "StateControl2";
            		this.StateControl2.Size = new System.Drawing.Size(26, 22);
            		// 
            		// FAULT 2
            		// 
            		this.Fault2.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold);
            		this.Fault2.Location = new System.Drawing.Point(195, 179);
            		this.Fault2.Name = "Fault2";
            		this.Fault2.Size = new System.Drawing.Size(37, 22);
            		this.Fault2.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            		// 
            		// UNIT 2
            		// 
            		this.Unita2.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold);
            		this.Unita2.Location = new System.Drawing.Point(144, 179);
            		this.Unita2.Name = "Unita2";
            		this.Unita2.Size = new System.Drawing.Size(37, 22);
            		this.Unita2.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            		// 
            		// VALMAX 2
            		// 
            		this.ValMax2.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold);
            		this.ValMax2.Location = new System.Drawing.Point(97, 179);
            		this.ValMax2.Name = "ValMax2";
            		this.ValMax2.Size = new System.Drawing.Size(37, 22);
            		this.ValMax2.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            		// 
            		// TIME 2
            		// 
            		this.Ora2.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold);
            		this.Ora2.Location = new System.Drawing.Point(43, 179);
            		this.Ora2.Name = "Ora2";
            		this.Ora2.Size = new System.Drawing.Size(44, 22);
            		this.Ora2.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            		// 
            		// PICTURE BOX 1
            		// 
            		this.pictureBox1.BackColor = System.Drawing.Color.White;
            		this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            		this.pictureBox1.Location = new System.Drawing.Point(0, 6);
            		this.pictureBox1.Name = "pictureBox1";
            		this.pictureBox1.Size = new System.Drawing.Size(240, 84);
            		// 
            		// SMSMobile
            		// 
            		this.AutoScaleDimensions = new System.Drawing.SizeF(96F, 96F);
            		this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            		this.AutoScroll = true;
            		this.ClientSize = new System.Drawing.Size(240, 268);
            		this.Controls.Add(this.pictureBox1);
            		this.Controls.Add(this.listView1);
            		this.Controls.Add(this.StateControl1);
            		this.Controls.Add(this.label1);
            		this.Controls.Add(this.Unita1);
            		this.Controls.Add(this.Fault1);
            		this.Controls.Add(this.Fault2);
            		this.Controls.Add(this.Unita2);
            		this.Controls.Add(this.ValMax2);
            		this.Controls.Add(this.ValMax1);
            		this.Controls.Add(this.Ora1);
            		this.Controls.Add(this.Ora2);
            		this.Controls.Add(this.StateControl2);
            		this.KeyPreview = true;
            		this.Menu = this.mainMenu1;
            		this.Name = "SMSMobile";
            		this.Text = "SMSMobile";
            		this.Load += new System.EventHandler(this.Form1_Load);
            		this.ResumeLayout(false);
        	}

       		#endregion
    }
}

