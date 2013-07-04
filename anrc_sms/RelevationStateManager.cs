// @Class-Name:    RelevationStateManager
// @Status:        COMPLETED
// @Last-Modified: 11/07/2011 20.08


using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;


namespace SMSMobile_R3
{
    class RelevationStateManager
    {
        private Relevation newRelevation;
	
        private String structureValidationResult;
        private String consistencyValidationResult;

	private static int[] radioactivityLevels = new int[Configuration.RADIOACTIVITY_SENSORS];
	private int maxRadioactivityLevel = 0;
	private static int radioactivityFaults = 0;
	private String radioactivityInterpretation;

	private static int[] temperatureLevels = new int[Configuration.TEMPERATURE_SENSORS];
	private int maxTemperatureLevel = 0;
	private static int temperatureFaults = 0;
	private String temperatureInterpretation;

        private String roomCode = null;
        private static String time = null;
        private static String date = null;

        private int maxRadioactivityLevel = 0;
        
	private static RelevationStateManager stateManager;


        public RelevationStateManager()
	{
		returnInstance();
	}

        
        // Singleton pattern
        public static RelevationStateManager returnInstance()
        {
		if (stateManager == null)
			stateManager = new RelevationStateManager();

		return stateManager;
        }


        public void SetRelevationAttributes(Relevation relevation)
        {
		this.newRelevation = relevation;

		this.structureValidationResult = ValidateStructure(newRelevation.getRelevationString());
		this.consistencyValidationResult = ValidateConsistency(structureValidationResult, radioactivityLevels, temperatureLevels);

		this.maxRadioactivityLevel = CalculateMaximumValue(radioactivityLevels);
		this.maxTemperatureLevel = CalculateMaximumValue(temperatureLevels);

		this.radioactivityInterpretation = setInterpretation(maxRadioactivityLevel, Configuration.RADIOACTIVITY_THRESHOLD, structureValidationResult);
		this.temperatureInterpretation = setInterpretation(maxTemperatureLevel, Configuration.TEMPERATURE_THRESHOLD, structureValidationResult);

		newRelevation.setRoomCode(roomCode);
		newRelevation.setDate(date);
		newRelevation.setTime(time);

		newRelevation.SetRadioactivityLevels(this.radioactivityLevels);
		newRelevation.setMaxRadioactivityLevel(this.maxRadioactivityLevel);
		newRelevation.setRadioactivityFaults(this.radioactivityFaults);
		newRelevation.setradioactivityInterpretation(this.radioactivityInterpretation);

		newRelevation.setTemperatureLevels(this.temperatureLevels);
		newRelevation.setMaxTemperatureLevel(this.maxTemperatureLevel);
		newRelevation.setTemperatureFaults(this.temperatureFaults);
		newRelevation.SetTemperatureInterpretation(this.temperatureInterpretation);
            
		newRelevation.setStructureValidation(this.structureValidationResult);
		newRelevation.setConsistencyValidation(this.consistencyValidationResult);
        }


        public enum StructureValidation
        {
		OK = 1,
		KO = -1
        }


        public enum ConsistencyValidation
        {
		FAULT = -1,
		NOFAULT = 1,
		UNKNOWN = 0
        }


        public enum StateInterpretation
        {
		ALERT = -1,
		NOALERT = 1,
		UNKNOWN = 0
        }

      
        /// <summary>
        ///    Checks that the relevation structure conforms to the requirements.
        ///    In caso posisitivo return OK altrimenti return KO.
        /// </summary>
        /// <param name="relevation">The string of the relevation</param>
	private String validateStructure(String relevation)
	{
		String responseOfDateAndTimeValidation;
            	String responseOfRadioactivityLevelsValidation;
            	String responseOfTemperatureLevelsValidation;
            	
            	String tempRelevation;

            	String[] relevationFields = new String[12];
            	String[] radioactivityLevels = CheckField(fieldRelevation, 4, Configuration.RADIOACTIVITY_SENSORS);
            	String[] temperatureLevels = CheckField(fieldRelevation, 10, Configuration.TEMPERATURE_SENSORS);

		StructureValidation validationResponse = StructureValidation.KO;

            	tempRelevation = relevation.Replace("~", "");
            	relevationFields = tempRelevation.Split('#');


   	        responseOfRadioactivityLevelsValidation = validateValues(radioactivityLevels);
            	responseOfTemperatureLevelsValidation = validateValues(temperatureLevels);

		try
		{
			if(fieldRelevation[0] == Configuration.CODE_ROOM_1 || fieldRelevation[0] == Configuration.CODE_ROOM_2)
			{
				roomCode = relevationFields[0];

                		if(tempRelevation.Substring(7, 1) == "/" && tempRelevation.Substring(10, 1) == "/" && tempRelevation.Substring(15, 1) == " ")
                		{
                 			responseOfDateAndTimeValidation = validateDate(tempRelevation.Substring(Configuration.START_INDEX_DATE_FIELD, Configuration.DATE_FIELD_LENGTH));
                    		
					if(responseOfDateAndTimeValidation == "OK")
                    			{
                        			if(tempRelevation.Substring(18, 1) == ":" && tempRelevation.Substring(21, 1) == ":" && tempRelevation.Substring(24, 1) == "#")
                        			{
                            				responseOfDateAndTimeValidation = validateTime(tempRelevation.Substring(Configuration.START_INDEX_HOUR_FIELD, Configuration.TIME_FIELD_LENGTH));
                       
							if(responseOfDateAndTimeValidation == "OK")
                            				{
                                				if(relevationFields[3] == Configuration.RADIOACTIVITY_SENSOR_TYPE)
                                				{
                                    					if(relevationFields[9] == Configuration.TEMPERATURE_SENSOR_TYPE)
                                    					{
                                        					if(relevationFields[2] == "2")
                                        					{
                                            						if(responseOfTemperatureLevelsValidation == "OK" && responseOfRadioactivityLevelsValidation == "OK")
                                            						{
												validationResponse = StructureValidation.OK;	
	         	                                   				}
                 	                           					else { validationResponse = StructureValidation.KO }
                 		                       				}
                        	                				else { validationResponse = StructureValidation.KO }
                        	            				}
                        	            				else { validationResponse = StructureValidation.KO }
                        	        			}
                        	        			else { validationResponse = StructureValidation.KO }
                        	    			}
                        	    			else { validationResponse = StructureValidation.KO }
                        			}
                        			else { validationResponse = StructureValidation.KO }
                    			}
                    			else { validationResponse = StructureValidation.KO }
                		}
                		else { validationResponse = StructureValidation.KO }
                	}
                	else { validationResponse = StructureValidation.KO; }
		}
		catch(ArgumentOutOfRangeException e)
		{
			System.Diagnostics.Debug.WriteLine("Relevation is not valid.");
		}  

		return validationResponse.ToString();
	}

        
        /// <summary>
        ///     Checks that the relevated values are in the interval [1, 1000], in which case NOFAULT is returned, otherwise FAULT is returned.
        ///     If 'structureValidationResult' is KO, the UNKNOWN is returned.
        /// </summary>
        /// <param name="structureValidationResult">The result of the structure validation</param>
        /// <param name="radioValues">The array of radioactivity values</param>
        /// <param name="temperatureValues">The array of temperature values</param>
        private String validateConsistency(String structureValidationResult, int[] radioValues, int[] temperatureValues)
        {
		radioactivityFaults = 0;
		temperatureFaults = 0;

		ConsistencyValidation validationResponse = ConsistencyValidation.NOFAULT;

		if(this.structureValidationResult == StructureValidation.KO.ToString())
			validationResponse = ConsistencyValidation.UNKNOWN;
		else
		{
                	for (int i = 0; i < radioValues.Length; i++ )
                	{
                    		if (radioValues[i] < Configuration.MINIMUM_RADIOACTIVITY_VALUE || radioValues[i] > Configuration.MAXIMUM_RADIOACTIVITY_VALUE)
                    		{
                        		this.radioactivityFaults++;
                        		validationResponse = ConsistencyValidation.FAULT;
                    		}
                	}
                
                	for (int i = 0; i < temperatureValues.Length; i++)
                	{
                    		if (temperatureValues[i] < Configuration.MINIMUM_TEMPERATURE_VALUE || temperatureValues[i] > Configuration.MAXIMUM_TEMPERATURE_VALUE) 
                    		{
                        		this.temperatureFaults++;
                        		validationResponse = ConsistencyValidation.FAULT;
                    		}
                	}
            	}

            return validationResponse.ToString();
        }

        
        /// <summary>
        ///     Decides whether the relevation is in the ALERT, NOALERT or UNKNOWN state.
        /// </summary>
        /// <param name="valMax">The maximum relevated value</param>
        /// <param name="threshold">The threshold</param>
        /// <param name="structureValidationResult">The result of the structure validation</param>
        private String setInterpretation(int valMax, int threshold, String structureValidationResult)
        {   
		InterpretationState validationResponse = InterpretationState.NOALERT;

            	if (structureValidationResult == StructureValidation.KO.ToString())
                	validationResponse = InterpretationState.UNKNOWN;
            	else
            	{
                	if (threshold == Configuration.RADIOACTIVITY_THRESHOLD)
			{
                    		if (valMax > threshold)
                      			validationResponse = InterpretationState.ALERT;
			}

                	else if (threshold == Configuration.TEMPERATURE_THRESHOLD)
			{
                    		if (valMax > threshold)
                        		validationResponse = InterpretationState.ALERT;
			}
            	}

            	return validationResponse.ToString();
        }


        /// <summary>
        ///     Finds the maximum value in the relevation
        /// </summary>
        /// <param name="values">The array of the relevated values</param>
        private int calculateMaximumValue(int[] values)
        {
		int[] sensorValues = values;
            	int valMax = 0;
            	int minimumRangeValue = 0;
            	int maximumRangeValue = 0;

            	if (sensorValues.Length == Configuration.RADIOACTIVITY_SENSORS)
            	{
                	minimumRangeValue = Configuration.MINIMUM_RADIOACTIVITY_VALUE;
                	maximumRangeValue = Configuration.MAXIMUM_RADIOACTIVITY_VALUE;
            	}
            	else if (sensorValues.Length == Configuration.TEMPERATURE_SENSORS)
            	{
                	minimumRangeValue = Configuration.MINIMUM_TEMPERATURE_VALUE;
                	maximumRangeValue = Configuration.MAXIMUM_TEMPERATURE_VALUE;
            	}

            	for (int i = 0; i < sensorValues.Length; i++)
                	if (sensorValues[i] >= minimumRangeValue && sensorValues[i] <= maximumRangeValue)
                    		if (sensorValues[i] > valmax)
                        		valMax = sensorValues[i];
            
            	return valMax;
        }


        /// <summary>
        ///    Checks that the time is structurally OK
        /// </summary>
        /// <param name="time">The time to check</param>
        private  String validateTime(String time)
	{
		this.time = time;
		String response = "OK";

		int hour;
		int minutes;
		int seconds;

		try
            	{	
                	hour = Int32.Parse(time.Substring(0, 2));
                	minutes = Int32.Parse(time.Substring(3, 2));
                	seconds = Int32.Parse(time.Substring(6, 2));

                	if (hour < 0 || hour > 23 || minutes < 0 || minutes > 59 || seconds < 0 || seconds > 59)
                    		response = "KO";

            	}
		catch(InvalidCastException e)
		{
	                return "KO";
            	}

		return response;
	}


        /// <summary>
        ///    Checks that the date is structurally OK.
        /// </summary>
        /// <param name="date">The date to check</param>
        private String validateDate(String date)
        {
        	this.date = date;
        	String response = "OK";

		try
        	{
                	int day = Int32.Parse(this.date.Substring(0, 2));
                	int month = Int32.Parse(this.date.Substring(3, 2));
                	int year = Int32.Parse(this.date.Substring(6, 4));

                	if (day < 1 || day > 31 || month < 1 || month > 12 || year != 2011)
                		response = "KO";

		}
		catch(InvalidCastException e)
		{
                	return "KO";
            	}

		return response;
	}



        /// <summary>
        ///    Checks that the relevated values are exactly 10, each being an integer.
        /// </summary>
        /// <param name="values">The string of the relevated values</param>
        private String validateValues(String[] values)
        {
		String response = "OK";

		if (values.Length == Configuration.RADIOACTIVITY_SENSORS)
		{
			for (int i = 0; i < values.Length; i++)
			{
				if ((isInteger(values[i])) == false)
                        		response = "KO";
                    		else
   		                	radioactivityLevels[i] = Int32.Parse(values[i]);
               	 	}
            	}
            	else if (values.Length == Configuration.TEMPERATURE_SENSORS)
            	{
                	for (int i = 0; i < values.Length; i++)ù
			{
                    		if ((isInteger(values[i])) == false)
                        		response = "KO";
				else
                			temperatureLevels[i] = Int32.Parse(values[i]);
			}
		}

            	return response;
	}


	private static bool isInteger(String value)
	{
        	if (value == null)
                	return false;

            	try
            	{
                	Convert.ToInt32(value);
                	
			return true;

            	}
		catch(InvalidCastException e)
		{
                	return false;
            	}
            	catch (FormatException e)
            	{
             		System.Diagnostics.Debug.WriteLine("An error occourred while attempting to convert a value.");
                
			return false;
            	}
        }


        private static String[] checkField(String[] fields, int startIndex, int lenght)
	{
		String[] vectorResponse = new String[lenght];
		int vectorResponseIndex = 0;

		// If the relevation is empty
		if (fields.Length == 1)
                	return vectorResponse;
            
		for(int i = startIndex; i <= ((lenght + startIndex) - 1); i++)
		{
			try
			{
				vectorResponse[vectorResponseIndex] = fields[i];
				vectorResponseIndex++;
			}
			catch (IndexOutOfRangeException e)
               		{
                 		System.Diagnostics.Debug.WriteLine("\nA relevation containing less values than expected was received."); 
                	}
            	}

            return vectorResponse;
        }
    }
}
