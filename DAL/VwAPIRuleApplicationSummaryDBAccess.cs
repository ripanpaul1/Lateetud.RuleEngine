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
    }
}
