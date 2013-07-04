// @Class-Name:    RelevationsFile
// @Status:        COMPLETED
// @Last-Modified: 11/07/2011 20.00


using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;
using System.IO;


namespace SMSMobile_R3
{
	/// <summary>
    	///     Incapsula le operazioni di lettura/scrittura sul file delle Rilevazioni.
    	/// </summary>
    	class RelevationsFile : Abstract_DataSource
    	{
        	private String path = null;
        	private StreamReader reader = null;
        	private StreamWriter writer = null;
        	private FileStream fileStream = null;
        	private static int lineCounter = 0;


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


	        private void setStreamVariables()
	        {
	            path = Configuration.GetPath();
	            reader = Configuration.GetReader();
	            writer = Configuration.GetWriter();
	            fileStream = Configuration.getTempFileStream();
	        }


        	/// <summary>
        	///     Overrides the respective method declared in the abstract class <code>AbstractDataSource</code>
        	///     It appends a relevation in the Journaling file.
        	///     The Journaling file is opened in Append mode.
        	/// </summary>
        	/// <param name="metatag">The empty string</param>
        	public override String appendRelevation(String metatag)
        	{
			// Empty implementation
			return "";
        	}

        
        	/// <summary>
        	///     Overrides the respective method declared in the abstract class <code>AbstractDataSource</code>
        	/// </summary>
		/// <returns>A string representing a relevation</returns>
        	///
        	public override String readLine()
        	{
	            	// Opens the Relevations file
	            	openFile(Configuration.RELEVATIONS_FILE_NAME, FileAccess.Read, FileMode.Open);
			
			String relevation = null;

  		        // Reads a line and updates the pointer to the next line to be read
            		for(int i = 0; i < lineCounter + 1; i++)
                		relevation = reader.ReadLine();
            
            		lineCounter++;           

            		return relevation;
        	}


        	/// <summary>
        	///     Overrides the respective method declared in the abstract class <code>AbstractDataSource</code>
        	/// </summary>
        	/// <returns>The empty string</returns>
        	public override String showContent()
        	{
            		// Empty implementation
			return "";
        	}
   

        	/// <summary>
        	///     Overrides the method <code>ToString()</code> to return the name of the current class.
        	/// </summary>
        	/// <returns>The name of the current class</returns>
        	public override String ToString()
        	{
        	    return typeof(RelevationsFile).Name;
        	}
    	}
}