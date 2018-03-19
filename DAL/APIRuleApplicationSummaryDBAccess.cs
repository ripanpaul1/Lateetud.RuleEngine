﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class APIRuleApplicationSummaryDBAccess
    {
        public bool AddNew(APIRuleApplicationSummary _ruleSummary)
        {

            SqlParameter[] parameters = new SqlParameter[]
            {

           new SqlParameter("@RunID",_ruleSummary.RunID),
           new SqlParameter("@FileName",_ruleSummary.FileName),
           new SqlParameter("@RuleDescID",_ruleSummary.RuleDescID),
           new SqlParameter("@FieldValue",_ruleSummary.FieldValue),

           new SqlParameter("@EntryDate",_ruleSummary.EntryDate),
           new SqlParameter("@IsSuccess",_ruleSummary.IsSuccess),

            };
            return SqlDBHelper.ExecuteNonQuery("proc_APIRuleApplicationSummary_AddNew", CommandType.StoredProcedure, parameters);
        }

        public APIRuleApplicationSummary GetRunID()
        {
            APIRuleApplicationSummary _ruleSummary = null;

            using (DataTable table = SqlDBHelper.ExecuteSelectCommand("proc_APIRuleApplicationSummary_GetRunID", CommandType.StoredProcedure))
            {
                //check if any record exist or not
                if (table.Rows.Count == 1)
                {
                    DataRow row = table.Rows[0];

                    _ruleSummary = new APIRuleApplicationSummary();
                    _ruleSummary.RunID = Convert.ToInt32(row["RunID"]);

                }
            }

            return _ruleSummary;
        }

        
    }
}
