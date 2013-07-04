// @Class-Name:    HistoryFile
// @Status:        COMPLETED
// @Last-Modified: 10/07/2011 20.08


using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;
using System.IO;


namespace SMSMobile_R3
{

	/// <summary>
	///     Encapsulates I/O operations on the Journaling file
	/// </summary>
    	class HistoryFile : Abstract_DataSource
    	{
        	private String path = null;
        	private StreamReader reader = null;
        	private StreamWriter writer = null;
        	private FileStream fileStream = null;
        	private FileStream oldFileStream = null;
        	private String historyFileName_1 = "storico.txt";
        	private String historyFileName_2 = "storico_2.txt";


		/// <summary>
		///     Proxy method for the preparation of a file invoking the prepareFile methos defined in Configuration.cs <see cref="Configuration.cf"/>
		/// </summary>
		/// <param name="fileName">The name of the file to be opended</param>
		/// <param name="access">The access mode to the file</param>
		/// <param name="mode">The opening mode of the file</param>
        	private void openFile(String fileName, FileAccess access, FileMode mode)
		{
            		Configuration.prepareFile(fileName, access, mode);
            
			setStreamVariables();
        	}


        	public override String private void setStreamVariables()
		{
            		path = Configuration.GetPath();
            		reader = Configuration.GetReader();
            		writer = Configuration.GetWriter();
            		fileStream = Configuration.GetFileStream();
            		old_FileStream = Configuration.GetTempFileStream();
        	}


        	/// <summary>
        	///     Sets the name of the history file actually in use and returns the name of the history file previously in use
        	/// </summary>
        	private static String manageHistoryFileNames()
		{
            		String oldHistoryFileName = Configuration.ACTUAL_HISTORY_FILE_NAME;
            
            		switch (Configuration.ACTUAL_HISTORY_FILE_NAME)
            		{
                		case "storico.txt": Configuration.ACTUAL_HISTORY_FILE_NAME = "storico_2.txt"; break;
                		case "storico_2.txt": Configuration.ACTUAL_HISTORY_FILE_NAME = "storico.txt"; break;
                		default: break;
            		}

            		return oldHistoryFileName;
        	}


		/// <summary>
        	///     Overrides the respective method declared in the abstract class <code>AbstractDataSource</code>
        	///     It appends a relevation in the History file.
        	///     The History file is opened in Append mode.
        	/// </summary>
        	/// <param name="metatag">The relevation to be appended in the Journaling file</param>
        	public override String appendRelevation(String metatag)
		{
            		if ((Configuration.appendedLinesCounter) < (Configuration.HYSTORY_CAPACITY))
            		{
                		// Opens the history file actually in use
                		OpenFile(Configuration.ACTUAL_HISTORY_FILE_NAME, FileAccess.Write, FileMode.Append);
                
                		// Appends the relevation into the file storico.txt
                		writer.WriteLine(metatag);

                		// Increments the counter for appended relevations
                		Configuration.appendedLinesCounter += 1;
                
                		// System.Diagnostics.Debug.WriteLine("Configuration.appendedLinesCounter: " + Configuration.appendedLinesCounter);

                		reader.Close(); 
                		writer.Close();
                		fileStream.Close();  
            		}
			else
			{
				// String for the transfer of each line from the history file previously in use to the one currently in use
                		String stringToBeCopied = null;

                		// Discovers the history file actually in use
                		String oldHistoryFileName = manageHistoryFileNames();

                		// Opens the history file currently in use in write mode
                		OpenFile(Configuration.ACTUAL_HISTORY_FILE_NAME, FileAccess.Write, FileMode.Open);

                		// Opens the history file previously in use in read mode
                		OpenFile(oldHistoryFileName, FileAccess.Read, FileMode.Open);
                
				// Moves the pointer to the second line of the history file previously in use
                		stringToBeCopied = reader.ReadLine();
                
				// Copies lines from 2 to 100 in the history file currently in use
                		while((stringToBeCopied = reader.ReadLine()) != null)
                    			writer.WriteLine(stringToBeCopied);
                
                		// Appends the last relevation (metatag) to the file
                		writer.WriteLine(metatag);
                
                		// Closes all the open streams
                		reader.Close();
                		writer.Close();
                		fileStream.Close();
                		old_FileStream.Close();
            		}

			return "OK";
        	}


        	/// <summary>
        	///     Reads a line from the history file
        	/// </summary>
		/// <returns>A record from the history file</returns>
        	public override String readLine()
		{
            		// Empty implementation
            		return "";
        	}
        

        	/// <summary>
        	///     Overrides the respective method declared in the abstract class <code>AbstractDataSource</code>
        	/// </summary>
        	/// <returns>A string representing the entire content of the history file</returns>
        	public override String showContent()
		{
            		openFile(Configuration.ACTUAL_HISTORY_FILE_NAME, FileAccess.Read, FileMode.Open);
           
            		String content = null;
            		String line = null ;

            		// Obtains a line per time and appends it to the content string
            		try
            		{   
                		line = this.reader.ReadLine();
                		content = line + "-";
                		
				while ((line = this.reader.ReadLine()) != null)
                    			content += line + "-" ;

                		// Closes all the open streams
                		this.reader.Close();
                		this.fileStream.Close();
            		}
			catch (NullReferenceException e) { }
            	
			// Returns the content of the history file
            		return content;
        	}


		/// <summary>
        	///     Overrides the method <code>ToString()</code> to return the name of the current class.
        	/// </summary>
        	/// <returns>The name of the current class</returns>
        	public override String ToString()
		{
            		return typeof(HistoryFile).Name;
        	}
    	}
}
