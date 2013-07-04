// @Class-Name: DataSourceManager
// @Status: COMPLETED
// @Last-Modified: 07/07/2011 20.08


using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;
using System.Diagnostics;
using System.Reflection;


namespace SMSMobile_R3
{
	class Gestore_DataSource
	{
        	// Array of methods accessibility (Methods Accessibility - MA) for each Manager (WSN, JournalingManager, HistoryManager)
        	private Dictionary<Configuration.MethodsID, Boolean> WSN_MA;
        	private Dictionary<Configuration.MethodsID, Boolean> journalingManager_MA;
        	private Dictionary<Configuration.MethodsID, Boolean> historyManager_MA;

		private static DataSourceManager fileManager;

		private static Abstract_DataSource relevationFile = null;
        	private static Abstract_DataSource historyFile = null;
        	private static Abstract_DataSource journalingFile = null;


		public DataSourceManager() { returnInstance(); }


        	// Singleton pattern
        	public static DataSourceManager returnInstance()
		{
            		if (fileManager == null)
                		fileManager = new DataSourceManager();

            		return fileManager;
        	}

	
        	/// <summary>
        	/// Sets access permissions to the methods for each manager invoking I/O operations on files: WSN, JournalingManager, HistoryManager.
		/// The first position in each array is reserved to the method <pre>readLine()</pre>,
        	/// the second position to the method <pre>AppendRelevation()</pre> and the third to the method <pre>showContent()</pre>.
        	///
        	/// ESEMPIO: WSN can only read from Relevations file, so its permissions are: true, false, false.
        	/// </summary>
        	public DataSourceManager()
        	{
            		WSN_MA = new Dictionary<Configuration.MethodsID, Boolean>();
            		journalingManager_MA = new Dictionary<Configuration.MethodsID, Boolean>();
            		historyManager_MA = new Dictionary<Configuration.MethodsID, Boolean>();

            		try
            		{
                		// Permissions on RELEVATIONS array ("MA" = "Methods Accessibility")
				WSN_MA.Add(Configuration.MethodsID.readLine, true);
                		WSN_MA.Add(Configuration.MethodsID.appendRelevation, false);
                		WSN_MA.Add(Configuration.MethodsID.showContent, false);

                		// Permissions on JOURNALING array ("MA" = "Methods Accessibility")
				journalingManager_MA.Add(Configuration.MethodsID.readLine, false);
                		journalingManager_MA.Add(Configuration.MethodsID.appendRelevation, true);
                		journalingManager_MA.Add(Configuration.MethodsID.showContent, false);

                		// Permissions on HISTORY array ("MA" = "Methods Accessibility")
				historyManager_MA.Add(Configuration.MethodsID.readLine, false);
                		historyManager_MA.Add(Configuration.MethodsID.appendRelevation, true);
                		historyManager_MA.Add(Configuration.MethodsID.showContent, true);
            		}
            		catch (NullReferenceException e)
            		{
                		System.Diagnostics.Debug.WriteLine("NullReferenceException in GestoreFile.GestoreFile()");
            		}
        	}


        	private String executeRequest(AbstractDataSource fileClassInstance, Configuration.MethodsID methodName, String relevation)
        	{
            		AbstractDataSource newFileClassInstance = fileClassInstance;
            		String response = null;

            		switch(methodName)
            		{
				case Configuration.MethodsID.readLine: response = newFileClassInstance.readLine(); break;
                		case Configuration.MethodsID.appendRelevation: response = newFileClassInstance.appendRelevation(relevation); break;
                		case Configuration.MethodsID.showContent: response = newFileClassInstance.showContent(); break;
                		default: break;
            		}

            		return response;
        	}


        	/// <summary>
        	/// 	Creates an instance of a subclass of AbstractDataSource based on the passed class ID
        	/// </summary>
        	/// <param name="classID">The ID of the requesting class</param>
        	/// <returns>An instance of a subclass of AbstractDataSource</returns>
        	private AbstractDataSource createClassInstanceFromClassID(Configuration.ClassesID classID)
        	{
            		AbstractDataSource classInstance = null;
           
            		switch(classID)
            		{
                		case Configuration.ClassesID.WSN: if(this.relevationFile == null)
								  { 
                                                      			this.relevationFile = new RelevationFile(); 
                                                      			classInstance = this.relevationFile; 
                                                  		  }
								  else
									classInstance = this.relevationFile;
								
								  break;

                		case Configuration.ClassesID.JournalingManager: if(this.journalingFile == null)
										{
                                                                    			this.journalingFile = new JournalingFile();
                                                                    			classInstance = this.journalingFile;
                                                                		}
										else
											classInstance = this.journalingFile;
				
										break;

                		case Configuration.ClassesID.HistoryManager: if(this.historyFile == null)
									     {
										      this.historyFile = new HistoryFile();
                                                                     		      classInstance = this.historyFile;
                                                             		     }
							     		     else
								     		      classInstance = this.historyFile;

							     		     break;

                		default: break;
            		}

            		return classInstance;
        	}


        	/// <summary>
        	/// 	Checks the accessibility of a method by a requesting class
        	/// </summary>
        	/// <param name="requestingClass">The ID of the class requesting the service</param>
        	/// <param name="request">The ID of the requested service</param>
        	/// <returns>True if the method is accessible from the requesting class, false otherwise</returns>
        	private Boolean checkAccessibility(Configuration.ClassesID requestingClass, Configuration.MethodsID request)
        	{
            		Boolean accessibility = false;

            		switch (requestingClass)
            		{
                		case Configuration.ClassesID.WSN: if(WSN_MA.ContainsKey(request)) { accessibility = WSN_MA[request]; } break;
                		case Configuration.ClassesID.JournalingManager: if(journalingManager_MA.ContainsKey(request)) { accessibility = journalingManager_MA[request]; } break;
                		case Configuration.ClassesID.HistoryManager: if(historyManager_MA.ContainsKey(request)) { accessibility = historyManager_MA[request]; } break;
                		default: break;
            		}

            		return accessibility;
        	}


        	/// <summary>
        	///	Each manager (WSN, JournalingManager, HistoryManager) invokes the method sendRequest() to perform an I/O operation on a file
        	/// 	passing its own class ID, the ID of the desired method and, optionally the string of the relevation to be appended.
        	/// 	sendRequest() first performs a check to verify that the requesting class is allowed to perform the requested method;
        	/// 	if true, it creates an instance of a subclass of AbstractDataSource (RelevationFile, JournalingFile or HistoryFile), based on the provided class ID
        	/// 	Eventually, it invokes the method executeRequest(), passing the just created instance, the ID of the requested method and the relevation string, if applicable.
        	/// </summary>
        	/// <param name="classID">The ID of the class requesting the operation</param>
        	/// <param name="methodID">The ID of the requested operation.</param>
        	/// <param name="relevation">The string of the relevation if the requested operation corresponds to appendRelevation</param>
        	public String sendRequest(Configuration.ClassesID classID, Configuration.MethodsID methodID, String relevation)
        	{
            		AbstractDataSource classInstance = null;
            		Configuration.MethodsID methodName = methodID;
            		String response = null;

            		Boolean accessibility = checkAccessibility(classID, methodID); // Checks the accessibility of the request by the requesting class

			// If the operation is not accessible to the requesting class
            		if(!accessibility)
				throw new System.InvalidOperationException("Cannot invoke this method:" + methodID.ToString() + "Operation not available.");
           			
                	// Creates an instance of RelevationFile, JournalingFile or HistoryFile, depending od the provided class ID
                	classInstance = createClassInstanceFromClassID(classID);

                	// Executes the requested operation
                	response = executeRequest(classInstance, methodName, relevation);
                	
			return response;
		}
   	}
}