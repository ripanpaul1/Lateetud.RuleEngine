using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class APIRuleApplicationSummaryHandler
    {
        APIRuleApplicationSummaryDBAccess ruleSummaryDB = null;
        public APIRuleApplicationSummaryHandler()
        {
            ruleSummaryDB = new APIRuleApplicationSummaryDBAccess();
        }
        public bool AddNew(APIRuleApplicationSummary objRuleSummary)
        {
            return ruleSummaryDB.AddNew(objRuleSummary);
        }
        public APIRuleApplicationSummary GetRunID()
        {
            return ruleSummaryDB.GetRunID();
        }
    }
}
