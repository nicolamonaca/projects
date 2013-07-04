// @Class-Name:    JournalingManager
// @Status:        COMPLETED
// @Last-Modified: 10/07/2011 20.08


using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;


namespace SMSMobile_R3
{
	class JournalingManager
	{
		private Configuration.ClassesID myClassID = (Configuration.ClassesID) 1;
        	private static DataSourceManager fileManager = null;
        	private static JournalingManager journalingManager = null;


        	public Gestore_Journaling() { returnInstance(); }


        	// Singleton pattern
        	private static JournalingManager returnInstance()
        	{
            		if (this.journalingManager == null)
                		this.journalingManager = new JournalingManager();

            		return this.journalingManager;
        	}


		public void sendRelevationAppendRequest(Relevation relevation)
		{
			fileManager = new DataSourceManager();

			String journalingString = prepareString(relevation);
			String requestResponse = fileManager.sendRequest(myClassID, Configuration.MethodsID.AppendRelevation, journalingString);
        	}


        	private String prepareString(Relevation newRelevation)
		{
			String relevation = newRelevation.getRelevationString().Replace("~", "");

			relevation += "|" + newRelevation.getStructureValidation() + "|" +
                               	            newRelevation.getConsistencyValidation() + "|" +
                                            newRelevation.getMaxRadioactivityLevel() + "|" +
                                            newRelevation.getRadioactivityInterpretation() + "|" +
                                            newRelevation.getStructureValidation() + "|" +
                                            newRelevation.getConsistencyValidation() + "|" +
                                            newRelevation.getMaxTemperatureLevel() + "|" +
                                            newRelevation.getTemperatureInterpretation()+ "|";
  
            		return relevation;
        	}
	}
}
