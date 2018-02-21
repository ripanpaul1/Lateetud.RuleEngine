using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ConfigurationHandler
    {
        ConfigurationDBAccess configurationDB = null;
        public ConfigurationHandler()
        {
            configurationDB = new ConfigurationDBAccess();
        }
        public List<Configuration> GetRuleMastDetails()
        {
            return configurationDB.GetConfiguration();
        }
    }
}
