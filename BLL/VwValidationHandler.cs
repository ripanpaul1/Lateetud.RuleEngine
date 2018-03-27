using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class VwValidationHandler
    {
        VwValidationDBAccess vwvalidation = null;
        public VwValidationHandler()
        {
            vwvalidation = new VwValidationDBAccess();
        }
        public VwValidation ValidateOnRuleID(int ID)
        {
            return vwvalidation.GetValidationOnRuleID(ID);
        }
    }
}
