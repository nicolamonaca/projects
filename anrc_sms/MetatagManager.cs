// @Class-Name:    MetatagManager
// @Status:        COMPLETED
// @Last-Modified: 10/07/2011 20.08


using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;


namespace SMSMobile_R3
{
    class MetatagManager
    {
        private Rilevazione newRelevation;
        private static MetatagManager metatagManager;
        private static HistoryManager historyManager;
        private Metatag newMetatag = null;


	public MetatagManager() { returnInstance(); }


        // Singleton pattern
        public static MetatagManager returnInstance()
        {
            if (metatagManager == null)
            {
                metatagManager = new MetatagManager();
            }

            return metatagManager;
        }


        public void SetMetatagAttributes(Relevation relevation
        {

            newMetatag = createMetatag();
            newRelevation = relevation;

            newMetatag.setRoomCode(relevation.getRoomCode());

            newMetatag.setTime(relevation.getTime());
            newMetatag.setDate(relevation.getDate());

            newMetatag.setMaximumRadioactivityValue(relevation.getMaximumRadioactivityValue());
            newMetatag.setTotalFaultsInRadioactivityLevels(relevation.getTotalFaultsInRadioactivityLevels());
            newMetatag.setRadioactivityInterpretation(relevation.getRadioactivityInterpretation());

            newMetatag.setMaximumTemperatureValue(relevation.getMaximumTemperatureValue());
            newMetatag.setTotalFaultsInTemperatureLevels(relevation.getTotalFaultsInTemperatureLevels());
            newMetatag.setTemperatureInterpretation(relevation.getTemperatureInterpretation());

            this.sendMetatagToHistoryManager(newMetatag);
        }


        private Metatag createMetatag()	
	{
            Metatag newMetatag = new Metatag();

            return newMetatag;
        }


        private void sendMetatagToHistoryManager(Metatag newMetatag)
	{
            historyManager = new HistoryManager();
            historyManager.sendAppendMetatagRequest(newMetatag);
        }


        public Metatag showMetatag()
	{
            return newMetatag;
        }
        
    }
}
