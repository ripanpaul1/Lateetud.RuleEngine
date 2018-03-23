using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{

        public class ValidationDBAceess
        {
            public bool AddNew(Validation _rule)
            {

                SqlParameter[] parameters = new SqlParameter[]
                {
            new SqlParameter("@RuleDescID",_rule.RuleDescID),
            new SqlParameter("@IsActive",_rule.IsActive),
            new SqlParameter("@EntryDate",_rule.EntryDate),
            new SqlParameter("@ModifiedDate",_rule.ModifiedDate),
            new SqlParameter("@ExpressionContext",_rule.ExpressionContext),
            new SqlParameter("@ExpressionText",_rule.ExpressionText),
       
                };
                return SqlDBHelper.ExecuteNonQuery("proc_Validate_AddNew", CommandType.StoredProcedure, parameters);
            }
        }

}
