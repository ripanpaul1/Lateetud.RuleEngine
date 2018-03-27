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
        ValidationDBAceess validation = null;
        public ValidationHandler()
        {
            validation = new ValidationDBAceess();
        }
        //public bool AddNew(Validation objRule)
        //{
        //    return validation.AddNew(objRule);
        //}
        public Validation GetRuleDescDetailsByID(int ID)
        {
            return validation.GetValidationOnRuleID(ID);
        }
        public bool InsertAndUpdate(Validation objRule)
        {
            return validation.InsertAndUpdate(objRule);
        }
    }
}
