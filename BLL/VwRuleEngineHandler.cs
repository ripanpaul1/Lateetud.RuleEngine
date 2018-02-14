using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class VwRuleEngineHandler
    {
        vwRuleEngineDBAccess vwRuleDB = null;
        public VwRuleEngineHandler()
        {
            vwRuleDB = new vwRuleEngineDBAccess();
        }
        public List<vwRuleEngine> GetRuleDetails()
        {
            return vwRuleDB.GetRuleList();
        }
    }
}
