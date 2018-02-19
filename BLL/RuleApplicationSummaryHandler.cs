using DAL;
using System;
using System.Collections.Generic;
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
    }
}
