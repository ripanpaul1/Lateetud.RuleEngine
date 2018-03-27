﻿using System;
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
        public bool InsertAndUpdate(Validation _rule)
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
            return SqlDBHelper.ExecuteNonQuery("proc_Validate_InsertAndUpdate", CommandType.StoredProcedure, parameters);
        }

        public Validation GetValidationOnRuleID(int RuleID)
        {
            Validation _validation = null;

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@RuleDescID", RuleID)
            };

            using (DataTable table = SqlDBHelper.ExecuteParamerizedSelectCommand("proc_Validate_CheckRuleDescID", CommandType.StoredProcedure, parameters))
            {
                //check if any record exist or not
                if (table.Rows.Count == 1)
                {
                    DataRow row = table.Rows[0];
                    _validation = new Validation();
                    _validation.ID = Convert.ToInt64(row["ID"]);
                    _validation.RuleDescID = Convert.ToInt64(row["RuleDescID"]);
                    _validation.IsActive = Convert.ToBoolean(row["IsActive"]);
                    _validation.EntryDate = Convert.ToDateTime(row["EntryDate"]);
                    _validation.ModifiedDate = Convert.ToDateTime(row["ModifiedDate"]);
                    _validation.ExpressionContext = Convert.ToString(row["ExpressionContext"]);
                    _validation.ExpressionText = Convert.ToString(row["Expressiontext"]);
                }
            }

            return _validation;
        }
    }

}
