// @Class-Name:    AbstractDataSource
// @Status:        COMPLETED
// @Last-Modified: 07/07/2011 20.08


using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;
using System.Diagnostics;
using System.Reflection;


namespace SMSMobile_R3
{
	abstract class AbstractDataSource
	{
        	abstract public String appendRelevation(String relevation);

        	abstract public String ReadLine();
    
        	abstract public String ShowContent();
    }
}
