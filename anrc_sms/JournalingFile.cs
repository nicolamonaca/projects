// @Class-Name:    JournalingFile
// @Status:        COMPLETED
// @Last-Modified: 09/07/2011 20.08


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
	class JournalingFile : AbstractDataSource
	{
		private String path = null;
		private StreamReader reader = null;
		private StreamWriter writer = null;
		private FileStream fileStream = null;


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
            		this.path = Configuration.getPath();
            		this.reader = Configuration.getReader();
           		this.writer = Configuration.getWriter();
            		this.fileStream = Configuration.getFileStream();
        	}


        	/// <summary>
        	///     Overrides the respective method declared in the abstract class <code>AbstractDataSource</code>
        	///     It appends a relevation in the Journaling file.
        	///     The Journaling file is opened in Append mode.
        	/// </summary>
        	/// <param name="metatag">The relevation to be appended in the Journaling file</param>
        	public override String appendRelevation(String metatag)
		{
            		openFile(Configuration.JOURNALING_FILE_NAME, FileAccess.Write, FileMode.Append);

            		writer.WriteLine(metatag);
            		reader.Close();
            		writer.Close();
            		fileStream.Close();
            
           	 	return "OK";
        	}


        	/// <summary>
        	///     Overrides the respective method declared in the abstract class <code>AbstractDataSource</code>
        	/// </summary>
		/// <returns>The empty string</returns>
        	///
        	public override String readLine()
		{
            		// Empty implementation
            		return "";
        	}
        

        	/// <summary>
        	///     Overrides the respective method declared in the abstract class <code>AbstractDataSource</code>
        	/// </summary>
        	/// <returns>The empty string</returns>
        	public override String showContent()
		{
			// Empty implementation
            		return  "";
        	}

       
        	/// <summary>
        	///     Overrides the method <code>ToString()</code> to return the name of the current class.
        	/// </summary>
        	/// <returns>The name of the current class</returns>
        	public override String ToString()
		{
            		return typeof(JournalingFile).Name;
        	}
    	}
}