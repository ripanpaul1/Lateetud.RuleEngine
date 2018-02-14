using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class RuleMastHandler
    {
        RuleMastDBAccess ruleMastDB = null;
        public RuleMastHandler()
        {
            ruleMastDB = new RuleMastDBAccess();
        }
        public List<RuleMast> GetRuleMastDetails()
        {
            return ruleMastDB.GetRules();
        }
        public bool AddNew(RuleMast objRule)
        {
            return ruleMastDB.AddNew(objRule);
        }
        public bool Update(RuleMast objRule)
        {
            return ruleMastDB.Update(objRule);
        }
        public RuleMast GetRuleMastDetailsByID(int ID)
        {
            return ruleMastDB.GetRuleMastDetails(ID);
        }
    }
}
