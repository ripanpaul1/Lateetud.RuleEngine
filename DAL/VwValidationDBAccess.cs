using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class VwValidationDBAccess
    {
        public VwValidation GetValidationOnRuleID(int RuleID)
        {
            VwValidation _validation = null;

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@RuleDescID", RuleID)
            };

            using (DataTable table = SqlDBHelper.ExecuteParamerizedSelectCommand("proc_Vw_Validate_CheckRuleDescID", CommandType.StoredProcedure, parameters))
            {
                //check if any record exist or not
                if (table.Rows.Count == 1)
                {
                    DataRow row = table.Rows[0];
                    _validation = new VwValidation();
                    _validation.ID = Convert.ToInt64(row["ID"]);
                    _validation.RuleDescID = Convert.ToInt64(row["RuleDescID"]);
                    _validation.IsActive = Convert.ToBoolean(row["IsActive"]);
                    _validation.EntryDate = Convert.ToDateTime(row["EntryDate"]);
                    _validation.ModifiedDate = Convert.ToDateTime(row["ModifiedDate"]);
                    _validation.ExpressionContext = Convert.ToString(row["ExpressionContext"]);
                    _validation.ExpressionText = Convert.ToString(row["Expressiontext"]);
                    _validation.RuleMastID = Convert.ToInt64(row["RuleMastID"]);
                    _validation.RuleName = Convert.ToString(row["RuleName"]);
                }
            }

            return _validation;
        }
    }
}
