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
        public List<Configuration> GetConfigurationDetails()
        {
            return configurationDB.GetConfiguration();
        }
        public bool Update(Configuration config)
        {
            return configurationDB.Update(config);
        }
    }
}
