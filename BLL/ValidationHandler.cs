using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class ValidationHandler
    {
        ValidationDBAceess ruleDetails = null;
        public ValidationHandler()
        {
            ruleDetails = new ValidationDBAceess();
        }
        public bool Validate(Validation objRule)
        {
            return ruleDetails.AddNew(objRule);
        }
    }
}
