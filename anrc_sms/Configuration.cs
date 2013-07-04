// @Class-Name:    Configuration
// @Status:        COMPLETED
// @Last-Modified: 10/07/2011 20.08


using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;
using System.IO;


namespace SMSMobile_R3
{
	static class Configuration
	{
        	// Configuration variables
        	private static String path = null;
        	private static StreamReader reader = null;
        	private static FileStream fileStream = null;
        	private static FileStream tempFileStream = null;
        	private static StreamWriter writer = null;   
        
        	// Constants for files names
        	public static String ACTUAL_HISTORY_FILE_NAME = "storico.txt";
        	public const  String JOURNALING_FILE_NAME     = "journaling.txt";
        	public const  String RELEVATIONS_FILE_NAME    = "rilevazioni.txt";

        	// Manager classes' IDs
        	public enum ClassesID
		{ 
            		WSN = 0,
            		JournalingManager = 1,
            		HistoryManager = 2,
            		NULL = 3
        	}


        	// Method's IDs
        	public enum MethodsID
		{
            		appendRelevation = 0,
            		readLine = 1,
            		showContent = 2,
            		NULL = 3
        	}


        	// Capacity of the history file expressed in lines
        	public const int HYSTORY_CAPACITY = 100;


        	// Service attribute for HistoryFile.cs and RelevationsFile.cs
        	public static int appendedLinesCounter = 0; // How many relevations have been appended so far


        	// Time interval for reading two subsequent relevations
        	public const int PAUSA_STANDARD = 10000;


        	// Index starting from which the date field begins in the relevation's string
        	public const int START_INDEX_DATE_FIELD = 5;


        	// Length of the date field expressed in chars
        	public const int DATE_FIELD_LENGTH = 10;


        	// Index starting from which the time field begins in the relevation's string
        	public const int START_INDEX_HOUR_FIELD = 16;


        	// Length of the time field expressed in chars
        	public const int TIME_FIELD_LENGTH = 8;


        	// Number of total radioactivity sensors installed
        	public const int RADIOACTIVITY_SENSORS = 5;


        	// Number of total temperature sensors installed (Second release)
        	public const int TEMPERATURE_SENSORS = 3;


        	// Radioactivity threshold value, below which no alarm is raised
        	public const int RADIOACTIVITY_THRESHOLD = 130;


        	// Unit of measur of the radioactivity values
        	public const String RADIOACTIVITY_UNITS = "CPM";


        	// Temperature threshold value, below which no alarm is raised
        	public const int TEMPERATURE_THRESHOLD = 35;


        	// Unit of measure of the temperature values
        	public const String TEMPERATURE_UNITS = "C";


        	// Minimum allowed radioactivity value
        	public const int MINIMUM_RADIOACTIVITY_VALUE = 1;


        	// Maximum allowed radioactivity value
        	public const int MAXIMUM_RADIOACTIVITY_VALUE = 1000;

        	// Minimum allowed temperature value
        	public const int MINIMUM_TEMPERATURE_VALUE = 1;


        	// Maximum allowed temperature value
        	public const int MAXIMUM_TEMPERATURE_VALUE = 100;


        	// Identifier of the radioactivity sensor type field in the file (Second release)
        	public const String RADIOACTIVITY_SENSOR_TYPE = "s_00";


        	// Identifier of the temperature sensor type field in the file (Second release)
         	public const String TEMPERATURE_SENSOR_TYPE = "s_01";


         	// Identifier of the room 1 field in the file (Second release)
         	public const String CODE_ROOM_1 = "R001";


         	// Identifier of the room 2 field in the file (Second release)
         	public const String CODE_ROOM_2 = "R002";



        	/// <summary>
        	///     Procedure for the preparation of relevations, journaling or history file.
        	/// </summary>
        	/// <param name="fileName">The name of the file to be configured</param>
        	/// <param name="access">The access mode to the file</param>
        	/// <param name="mode">The opening mode of the file</param>
        	public static void prepareFile(String fileName, FileAccess access, FileMode mode)
        	{
            		// Get the path of the file from the device file system
            		path = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase);

            		if((fileName == "storico.txt" || fileName == "storico_2.txt" || fileName == Configuration.RELEVATIONS_FILE_NAME) && access == FileAccess.Read)
			{
                		tempFileStream = new FileStream(path + @"\" + fileName, mode, access);
                		reader = new StreamReader(tempFileStream);
            		}
            		else
                		// Create a new stream
                		fileStream = new FileStream(path + @"\" + fileName, mode, access);   

            		if(access == FileAccess.Write)
                		writer = new StreamWriter(fileStream);
        	}


		/// <summary>
		///     Returns the path of a file
		/// </summary>
		/// <returns>The file path</returns>
		public static String getPath()
		{
			return this.path;
		}


        	/// <summary>
        	///     Returns a StreamReader
        	/// </summary>
        	/// <returns>The StreamReader.</returns>
        	public static StreamReader getReader()
		{
            		return this.reader;
        	}


        	/// <summary>
        	///     Returns a StreamWriter.
        	/// </summary>
        	/// <returns>The StreamReader.</returns>
        	public static StreamWriter getWriter()
        	{
        	    return this.writer;
        	}


        	/// <summary>
        	///     Returns a FileStream.
        	/// </summary>
        	/// <returns>The FileStream.</returns>
        	public static FileStream getFileStream()
		{
            		return this.fileStream;
        	}


        	/// <summary>
        	///     Returns a FileStream.
        	/// </summary>
        	/// <returns>The FileStream.</returns>
       		public static FileStream getTempFileStream()
        	{
            		return this.tempFileStream;
        	}

	}
}
