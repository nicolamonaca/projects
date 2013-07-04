// @Class-Name:    Dispatcher
// @Status:        COMPLETED
// @Last-Modified: 10/07/2011 20.08


using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;


namespace SMSMobile_R3
{
	class Dispatcher
	{
	        private static Dispatcher dispatcher = null;
        	private static RelevationStateManager newRelevationManager = null;
        	private static MetatagManager newMetatagManager = null;
        	private static JournalingManager newJournalingManager = null;

		
		public Dispatcher() { returnInstance(); }

        
		// Singleton pattern
        	private static Dispatcher returnInstance()
        	{
            		if(dispatcher == null)
                		dispatcher = new Dispatcher();

            		return dispatcher; 
        	}

       
        	public void dispatchRelevation(Relevation relevation)
		{
            		this.sendRelevationToStateManager(relevation); // Send to RelevationStateManager
            
			if (relevation.getStructureValidation() == "OK")
                		this.sendRelevationToMetatagManager(relevation);  // Send to MetatagManager
       
                	this.sendRelevationToJournalingManager(relevation); // Send to JournalingManager
        	}


        	private void sendRelevationToStateManager(Relevation relevation)
		{
			newRelevationManager = new RelevationStateManager();
            		newRelevationManager.setRelevationAttributes(relevation);
        	}


        	private void sendRelevationToMetatagManager(Relevation relevation)
		{
            		newMetatagManager = new MetatagManager();
            		newMetatagManager.setMetatagAttributes(relevation);
        	}


        	private void sendRelevationToJournalingManager(Relevation relevation)
        	{
            		newJournalingManager = new JournalingRelevation();
            		newJournalingManager.sendRelevationAppendRequest(relevationilevazione);
        	}
    	}
}
