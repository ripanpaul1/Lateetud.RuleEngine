using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class VwAPIRuleApplicationSummaryHandler
    {
        VwAPIRuleApplicationSummaryDBAccess ruleSummaryDB = null;
        public VwAPIRuleApplicationSummaryHandler()
        {
            ruleSummaryDB = new VwAPIRuleApplicationSummaryDBAccess();
        }
        public List<VwAPIRuleApplicationSummary> LoadByRunID(long RunID)
        {
            return ruleSummaryDB.vwAPIRuleApplicationSummaryLoadByRunID(RunID);
        }
        public DataTable GetResultByRunID(long RunID)
        {
            return ruleSummaryDB.GetResultByRunID(RunID);
        }
    }
}
