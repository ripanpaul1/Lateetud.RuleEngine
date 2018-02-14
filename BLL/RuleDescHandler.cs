using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class RuleDescHandler
    {
        RuleDescDBAccess ruleDetails = null;
        public RuleDescHandler()
        {
            ruleDetails = new RuleDescDBAccess();
        }
        public bool AddNew(RuleDesc objRule)
        {
            return ruleDetails.AddNew(objRule);
        }
        public bool Update(RuleDesc objRule)
        {
            return ruleDetails.Update(objRule);
        }
        public bool UpdateActiveInActiveRule(RuleDesc objRule)
        {
            return ruleDetails.UpdateActiveInActive(objRule);
        }
        public RuleDesc GetRuleDescDetailsByID(int ID)
        {
            return ruleDetails.GetRuleDescDetails(ID);
        }
        public List<RuleDesc> GetRuleDetailsByRuleMastID(int RuleMastID)
        {
            return ruleDetails.GetRuleDetailsByRuleMastID(RuleMastID);
        }
    }
}
