// @Class-Name:    Metatag
// @Status:        COMPLETED
// @Last-Modified: 11/07/2011  12:41


using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;


namespace SMSMobile_R3
{
    class Metatag
    {
        // Third release
        private String roomCode;

        // Second release
        private String temperatureUnits = Configuration.TEMPERATURE_UNITS;
        private int maximumTemperatureValue;
        private String temperatureSensorType = Configuration.TEMPERATURE_SENSOR_TYPE;
        private int totalFaultsInTemperatureLevels;
        private String temperatureInterpretation = null;

        // First release
        private String radioactivityUnits = Configuration.RADIOACTIVITY_UNITS;
        private int maximumRadioactivityValue;
        private String radioactivitySensorType = Configuration.RADIOACTIVITY_SENSOR_TYPE;
        private int totalFaultsInRadioactivityLevels;
        private String radioactivityInterpretation = null;

        private String time;
        private String date;
        

        public Metatag() { }


        public String getRoomCode()
	{
		return this.roomCode;
	}


        public void setRoomCode(String code)
	{
		this.roomCode = code;
	}


        public String getDate()
	{
		return this.date;
	}


        public void setDate(String date)
	{
		date = date;
	}


        public String getTime()
	{
		return this.time;
	}


        public void setTime(String time)
	{
		this.time = time;
	}


	//
        // Radioactivity attributes setters & getters
	//
        public int getTotalFaultsInRadioactivityLevels()
	{
		return this.totalFaultsInRadioactivityLevels;
	}


        public void setTotalFaultsInRadioactivityLevels(int faults)
	{
		this.totalFaultsInRadioactivityLevels = faults;
	}


        public int getMaximumRadioactivityValue()
	{
		return this.maximumRadioactivityValue;
	}


        public void setMaximumRadioactivityValue(int value)
	{
		this.maximumRadioactivityValue = value;
	}


        public String getRadioactivityUnits()
	{
		return this.radioactivityUnits;
	}


        public String getRadioactivitySensorType()
	{
		return this.radioactivitySensorType;
	}


        public String getRadioactivityInterpretation()
	{
		return this.radioactivityInterpretation;
	}


        public void setRadioactivityInterpretation(String value)
	{
		this.radioactivityInterpretation = value;
	}
       


	//
        // Temperature attributes setters & getters
	//
        public int getTotalFaultsInTemperatureLevels()
	{
		return this.totalFaultsInTemperatureLevels;
	}


        public void setTotalFaultsInTemperatureLevels(int faults)
	{
		this.totalFaultsInTemperatureLevels = faults;
	}


        public int getMaximumTemperatureValue()
	{
		return this.maximumTemperatureValue;
	}


        public void setMaximumTemperatureValue(int value)
	{
		this.maximumTemperatureValue = value;
	}
	

        public String getTemperatureUnits()
	{
		return temperatureUnits;
	}


        public String getTemperatureSensorType()
	{
		return this.temperatureSensorType;
	}


        public String getTemperatureInterpretation()
	{
		return this.temperatureInterpretation;
	}


        public void setTemperatureInterpretation(String interpretation)
	{
		this.temperatureInterpretation = interpretation;
	}
    }
}
