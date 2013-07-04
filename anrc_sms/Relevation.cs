// @Class-Name:    Relevation
// @Status:        COMPLETED
// @Last-Modified: 10/07/2011 20.08


using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;


namespace SMSMobile_R3
{
    public class Relevation
    {
        public String roomCode;

        private String time = null;
        private String date = null;

        private int[] temperatureLevels = new int[Configuration.TEMPERATURE_SENSORS];
        private int maxTemperatureLevel;
        private int temperatureFaults;
        private String temperatureInterpretation;

        private int[] radioactivityLevels = new int[Configuration.RADIOACTIVITY_SENSORS];
        private int maxRadioactivityLevel;
        private int radioactivityFaults;
        private String radioactivityInterpretation;

        private String structureValidation;
        private String consistencyValidation;
        private String relevationString;


        public Relevation(String relevation)
        {
            this.relevationString = relevation;
        }

        
        public String getRelevationString()
	{
		return this.relevationString;
	}


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
		this.date = date;
	}


        public String getTime()
	{
		return this.time;
	}


        public void setTime(String time)
	{
		this.time = time;
	}


        public String getConsistencyValidation()
	{
		return this.consistencyValidation;
	}


        public void setConsistencyValidation(String validation)
	{
		this.consistencyValidation = validation;
	}


        public String getStructureValidation()
	{
		return this.structureValidation;
	}


        public void setStructureValidation(String validation)
	{
		this.structureValidation = validation;
	}


        //
	// Radioactivity attributes setters & getters
	// 
        public int getMaxRadioactivityLevel()
	{
		return this.maxRadioactivityLevel;
	}


        public void setMaxRadioactivityLevel(int value)
	{
		this.maxRadioactivityLevel = value;
	}
        

        public int[] getRadioactivityLevels()
	{
		return this.radioactivityLevels;
	}


        public void setRadioactivityLevels(int[] levels)
	{
		this.radioactivityLevels = levels;
	}


        public int getRadioactivityFaults()
	{
		return this.radioactivityFaults;
	}


        public void setRadioactivityFaults(int faults)
	{
		this.radioactivityFaults = faults;
	}


        public String getRadioactivityInterpretation()
	{
		return this.radioactivityInterpretation;
	}


        public void setRadioactivityInterpretation(String interpretation)
	{
		this.radioactivityInterpretation = interpretation;
	}


        //
	// Temperature attributes setters & getters
	// 
        public int getMaxTemperatureLevel()
	{
		return this.maxTemperatureLevel;
	}


        public void setMaxTemperatureLevel(int value)
	{
		this.maxTemperatureLevel = value;
	}
        

        public int[] getTemperatureLevels()
	{
		return this.temperatureLevels;
	}


        public void setTemperatureLevels(int[] levels)
	{
		this.temperatureLevels = levels;
	}


        public int getTemperatureFaults()
	{
		return this.temperatureFaults;
	}


        public void setTemperatureFaults(int faults)
	{
		this.temperatureFaults = faults;
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