using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class VwRuleApplicationSummaryHandler
    {
        VwRuleApplicationSummaryDBAccess ruleSummaryDB = null;
        public VwRuleApplicationSummaryHandler()
        {
            ruleSummaryDB = new VwRuleApplicationSummaryDBAccess();
        }

        public VwRuleApplicationSummary LoadByID(int ID)
        {
            return ruleSummaryDB.LoadDetailsByID(ID);
        }
        public List<VwRuleApplicationSummary> LoadByRunID(long RunID)
        {
            return ruleSummaryDB.RuleApplicationSummaryByRunID(RunID);
        }
        
    }
}
