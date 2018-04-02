using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{

    public class VwRuleApplicationSummaryDBAccess
    {
        //public bool InsertAndUpdate(EditReport _rule)
        //{


        //    SqlParameter[] parameters = new SqlParameter[]
        //        {
        //    new SqlParameter("@RuleName",_rule.RuleName),
        //    new SqlParameter("@FieldValue",_rule.FieldValue),
        //    new SqlParameter("@RunID",_rule.RunID),
        //    new SqlParameter("@IsActive",_rule.IsActive),
        //    new SqlParameter("@ID",_rule.ID),
        //    new SqlParameter("@FileName",_rule.FileName),
        //    new SqlParameter("@EntryDate",_rule.EntryDate),
        //    new SqlParameter("@RuleDescID",_rule.RuleDescID),

        //        };
        //    return SqlDBHelper.ExecuteNonQuery("proc_Validate_InsertAndUpdate", CommandType.StoredProcedure, parameters);
        //}

        public VwRuleApplicationSummary LoadDetailsByID(int ID)
        {
            VwRuleApplicationSummary _loadreport = null;

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@ID", ID)
            };

            using (DataTable table = SqlDBHelper.ExecuteParamerizedSelectCommand("proc_VwRuleApplicationSummary_LoadByID", CommandType.StoredProcedure, parameters))
            {
                //check if any record exist or not
                if (table.Rows.Count >0)
                {
                    DataRow row = table.Rows[0];
                    _loadreport = new VwRuleApplicationSummary();
                    _loadreport.RuleName = Convert.ToString(row["RuleName"]);
                    _loadreport.FieldValue = Convert.ToString(row["FieldValue"]);
                    _loadreport.RunID = Convert.ToInt64(row["RunID"]);
                    _loadreport.IsSuccess = Convert.ToBoolean(row["IsSuccess"]);
                    _loadreport.ID = Convert.ToInt64(row["ID"]);
                    _loadreport.FileName = Convert.ToString(row["FileName"]);
                    _loadreport.EntryDate = Convert.ToDateTime(row["EntryDate"]);
                    _loadreport.RuleDescID = Convert.ToInt64(row["RuleDescID"]);
                }
            }

            return _loadreport;
        }

        public List<VwRuleApplicationSummary> RuleApplicationSummaryByRunID(long RunID)
        {
            List<VwRuleApplicationSummary> list = null;

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@RunID", RunID)
            };


            using (DataTable table = SqlDBHelper.ExecuteParamerizedSelectCommand("proc_VwRuleApplicationSummary_LoadByRunID", CommandType.StoredProcedure, parameters))
            {
                if (table.Rows.Count > 0)
                {
                    list = new List<VwRuleApplicationSummary>();

                    foreach (DataRow row in table.Rows)
                    {
                        VwRuleApplicationSummary _rule = new VwRuleApplicationSummary();
                        _rule.RunID = Convert.ToInt64(row["RunID"]);
                        _rule.FileName = Convert.ToString(row["FileName"]);
                        _rule.FieldValue = Convert.ToString(row["FieldValue"]);
                        _rule.EntryDate = Convert.ToDateTime(row["EntryDate"]);
                        _rule.IsSuccess = Convert.ToBoolean(row["IsSuccess"]);
                        _rule.ID= Convert.ToInt64(row["ID"]);
                        list.Add(_rule);
                    }
                }
            }

            return list;
        }
    }

}
