using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class RuleEngineDetailsHandler
    {
        RuleEngineDetailsDBAccess ruleEngine = null;
        public RuleEngineDetailsHandler()
        {
            ruleEngine = new RuleEngineDetailsDBAccess();
        }
        public bool AddNew(RuleEngineDetails objRule)
        {
            return ruleEngine.AddNew(objRule);
        }
        public bool UpdateorInsert(RuleEngineDetails objRule)
        {
            return ruleEngine.UpdateorInsert(objRule);
        }
        public List<RuleEngineDetails> GetRuleDetails()
        {
            return ruleEngine.GetRuleList();
        }
        public List<RuleEngineDetails> GetRuleDetailsByRuleMastID(long RuleMastID)
        {
            return ruleEngine.GetByRuleMastID(RuleMastID);
        }
    }
}
