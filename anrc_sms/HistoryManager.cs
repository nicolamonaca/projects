// @Class-Name:    HistoryManager
// @Status:        COMPLETED
// @Last-Modified: 10/07/2011 20.08


using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;


namespace SMSMobile_R3
{
	class HistoryManager
    	{
        	private Configuration.ClassesID myClassID = (Configuration.ClassesID) 2;
        	private DataSourceManager fileManager = null;
        	private static Gestore_Storico historyManager = null;


		public Gestore_Storico() { returnInstance(); }


 	        // Singleton pattern
        	private static HistoryManager returnInstance()
        	{
            		if(this.historyManager == null)
            		{
                		this.historyManager = new HistoryManager();
            		}

            		return this.historyManager;
        	}


        	public void sendAppendMetatagRequest(Metatag newMetatag)
		{
           		String radioactivityMetatagString = this.PrepareMetatagString(newMetatag, Configuration.RADIOACTIVITY_SENSOR_TYPE);
            		String temperatureMetatagString = this.PrepareMetatagString(newMetatag, Configuration.TEMPERATURE_SENSOR_TYPE);

            		fileManager = new DataSourceManager();

            		String response1 = fileManager.sendRequest(myClassID, Configuration.MethodsID.appendRelevation, radioactivityMetatagString);
            		String response2 = fileManager.sendRequest(myClassID, Configuration.MethodsID.appendRelevation, temperatureMetatagString);
        	}


	        private String prepareMetatagString(Metatag tempMetatag, String sensorTypeFlag)
		{
            		String metatag = null;
            
			if(sensorTypeFlag == Configuration.RADIOACTIVITY_SENSOR_TYPE)
            		{
                		metatag = tempMetatag.getRoomCode() + "," + tempMetatag.getDate() + " " + tempMetatag.getTime()
                             	+ "," + tempMetatag.getRadioactivitySensorType()
                             	+ "," + tempMetatag.getMaximumRadioactivityValue()
                             	+ "," + tempMetatag.getRadioactivityUnits()
                             	+ "," + tempMetatag.getTotalFaultsInRadioactivityLevels();
            		}
            		else if (sensorTypeFlag == Configuration.TEMPERATURE_SENSOR_TYPE)
			{
                		metatag = tempMetatag.getRoomCode() + "," + tempMetatag.getDate() + " " + tempMetatag.getTime()
                                + "," + tempMetatag.getTemperatureSensorType()
                                + "," + tempMetatag.getMaximumTemperatureValue()
                                + "," + tempMetatag.getTemperatureUnits()
                                + "," + tempMetatag.getTotalFaultsInTemperatureLevels();
            		}
            
			return metatag;
        
        	}


		public String SendViewHistoryRequest()
		{
			fileManager = new DataSourceManager();
            
			String history = fileManager.sendRequest(myClassID, Configuration.MethodsID.ShowContent, "");
            
			return history;
		}
 	}
}