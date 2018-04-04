using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class RuleApplicationSummaryHandler
    {
        RuleApplicationSummaryDBAccess ruleSummaryDB = null;
        public RuleApplicationSummaryHandler()
        {
            ruleSummaryDB = new RuleApplicationSummaryDBAccess();
        }
        public bool AddNew(RuleApplicationSummary objRuleSummary)
        {
            return ruleSummaryDB.AddNew(objRuleSummary);
        }
        public RuleApplicationSummary GetRunID()
        {
            return ruleSummaryDB.GetRunID();
        }
        public List<RuleApplicationSummary> LoadByRunID(long RunID)
        {
            return ruleSummaryDB.RuleApplicationSummary_LoadByRunID(RunID);
        }
        public DataTable GetDateWiseData()
        {
            return ruleSummaryDB.GetDateWiseData();
        }
        public DataTable GetDateWiseSuccessFailure(DateTime RunDate)
        {
            return ruleSummaryDB.GetDateWiseSuccessFailure(RunDate);
        }
        public bool UpdateFieldValue(RuleApplicationSummary objRuleSummary)
        {
            return ruleSummaryDB.UpdateField(objRuleSummary);
        }
    }
}
