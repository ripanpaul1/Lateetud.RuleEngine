using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class VwRuleDescHandler
    {
        VwRuleDescDBAccess vwRuleDB = null;
        public VwRuleDescHandler()
        {
            vwRuleDB = new VwRuleDescDBAccess();
        }
        public List<VwRuleDesc> GetRuleDetails()
        {
            return vwRuleDB.GetRuleList();
        }
    }
}
