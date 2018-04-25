using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    public class VwAPIRuleApplicationSummaryDBAccess
    {

        public List<VwAPIRuleApplicationSummary> vwAPIRuleApplicationSummaryLoadByRunID(long RunID)
        {
            List<VwAPIRuleApplicationSummary> list = null;

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@RunID", RunID)
            };


            using (DataTable table = SqlDBHelper.ExecuteParamerizedSelectCommand("proc_vwAPIRuleApplicationSummary_GetResultByRunID", CommandType.StoredProcedure, parameters))
            {
                if (table.Rows.Count > 0)
                {
                    list = new List<VwAPIRuleApplicationSummary>();

                    foreach (DataRow row in table.Rows)
                    {
                        VwAPIRuleApplicationSummary _rule = new VwAPIRuleApplicationSummary();

                        _rule.FileName = Convert.ToString(row["RuleName"]);
                        _rule.FieldValue = Convert.ToString(row["FieldValue"]);

                        list.Add(_rule);
                    }
                }
            }

            return list;
        }

        public DataTable GetResultByRunID(long RunID)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@RunID", RunID)
            };
            DataTable table = SqlDBHelper.ExecuteParamerizedSelectCommand("proc_vwAPIRuleApplicationSummary_GetResultByRunID", CommandType.StoredProcedure, parameters);

            return table;
        }

        public List<VwAPIRuleApplicationSummary> LoadByRunIDAPI(long RunID)
        {
            List<VwAPIRuleApplicationSummary> list = null;

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@RunID", RunID)
            };


            using (DataTable table = SqlDBHelper.ExecuteParamerizedSelectCommand("proc_VwAPIRuleApplicationSummary_LoadByRunID", CommandType.StoredProcedure, parameters))
            {
                if (table.Rows.Count > 0)
                {
                    list = new List<VwAPIRuleApplicationSummary>();

                    foreach (DataRow row in table.Rows)
                    {
                        VwAPIRuleApplicationSummary _rule = new VwAPIRuleApplicationSummary();
                        _rule.RunID = Convert.ToInt64(row["RunID"]);
                        _rule.FileName = Convert.ToString(row["FileName"]);
                        _rule.FieldValue = Convert.ToString(row["FieldValue"]);
                        _rule.EntryDate = Convert.ToDateTime(row["EntryDate"]);
                        _rule.IsSuccess = Convert.ToBoolean(row["IsSuccess"]);
                        _rule.ID = Convert.ToInt64(row["ID"]);
                        list.Add(_rule);
                    }
                }
            }

            return list;
        }

        public VwAPIRuleApplicationSummary LoadApiDetailsByID(int ID)
        {
            VwAPIRuleApplicationSummary _loadreport = null;

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@ID", ID)
            };

            using (DataTable table = SqlDBHelper.ExecuteParamerizedSelectCommand("proc_VwAPIRuleApplicationSummary_LoadApiDetailsByID", CommandType.StoredProcedure, parameters))
            {
                //check if any record exist or not
                if (table.Rows.Count > 0)
                {
                    DataRow row = table.Rows[0];
                    _loadreport = new VwAPIRuleApplicationSummary();
                    _loadreport.RuleName = Convert.ToString(row["RuleName"]);
                    _loadreport.FieldValue = Convert.ToString(row["FieldValue"]);
                    //_loadreport.RunID = Convert.ToInt64(row["RunID"]);
                    //_loadreport.IsSuccess = Convert.ToBoolean(row["IsSuccess"]);
                    _loadreport.ID = Convert.ToInt64(row["ID"]);
                    _loadreport.FileName = Convert.ToString(row["FileName"]);
                    //_loadreport.EntryDate = Convert.ToDateTime(row["EntryDate"]);
                    //_loadreport.RuleDescID = Convert.ToInt64(row["RuleDescID"]);
                }
            }

            return _loadreport;
        }

        public bool UpdateFieldAPI(VwAPIRuleApplicationSummary _ruleDetails)
        {

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@ID",_ruleDetails.ID),
            new SqlParameter("@FieldValue",_ruleDetails.FieldValue),
            };
            return SqlDBHelper.ExecuteNonQuery("proc_VwAPIRuleApplicationSummary_UpdateFieldValue", CommandType.StoredProcedure, parameters);
        }
    }
}
