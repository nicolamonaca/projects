// @Class-Name:    WSN
// @Status:        COMPLETED
// @Last-Modified: 11/07/2011 20.00


using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;
using System.IO;


namespace SMSMobile_R3
{
	public class WSN
	{
		private Configuration.ClassesID myClassID = (Configuration.ClassesID) 0;
        	private DataSourceManager fileManager = null;
        	private RelevationsDispatcher dispatcher = null;
        	private String requestResponse = null;
        	private static WSN SMS_WSN;


        	public WSN() { returnInstance(); }


        	// Singleton pattern
        	private static WSN returnInstance()
        	{
            		if (SMS_WSN == null)
                		SMS_WSN = new WSN();

            		return SMS_WSN;
        	}


        	public String getRelevationString()
		{
           		return requestResponse;
        	}


        	private Relevation createRelevation(String relevation)
		{
            		Relevation newRelevation = new Relevation(relevation);

            		return newRelevation;
        	}


        	public void start()
		{
           		fileManager = new DataSourceManager();

            		requestResponse = fileManager.SendRequest(myClassID, Configuration.MethodsID.readLine, "");

            		if (requestResponse != null)
            		{
                		Relevation newRelevation = this.createRelevation(requestResponse);
                		dispatcher = new RelevationsDispatcher();
                		dispatcher.dispatchRelevation(newRelevation);
            		}
        	}
    	}
}