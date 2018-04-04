using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class RuleApplicationSummaryDBAccess
    {
        public bool AddNew(RuleApplicationSummary _ruleSummary)
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
            return SqlDBHelper.ExecuteNonQuery("proc_RuleApplicationSummary_AddNew", CommandType.StoredProcedure, parameters);
        }

        public RuleApplicationSummary GetRunID()
        {
            RuleApplicationSummary _ruleSummary = null;

            using (DataTable table = SqlDBHelper.ExecuteSelectCommand("proc_RuleApplicationSummary_GetRunID", CommandType.StoredProcedure))
            {
                //check if any record exist or not
                if (table.Rows.Count == 1)
                {
                    DataRow row = table.Rows[0];

                    _ruleSummary = new RuleApplicationSummary();
                    _ruleSummary.RunID = Convert.ToInt32(row["RunID"]);

                }
            }

            return _ruleSummary;
        }

        public List<RuleApplicationSummary> RuleApplicationSummary_LoadByRunID(long RunID)
        {
            List<RuleApplicationSummary> list = null;

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@RunID", RunID)
            };


            using (DataTable table = SqlDBHelper.ExecuteParamerizedSelectCommand("proc_RuleApplicationSummary_LoadByRunID", CommandType.StoredProcedure, parameters))
            {
                if (table.Rows.Count > 0)
                {
                    list = new List<RuleApplicationSummary>();

                    foreach (DataRow row in table.Rows)
                    {
                        RuleApplicationSummary _rule = new RuleApplicationSummary();


                        _rule.RunID = Convert.ToInt32(row["RunID"]);

                        _rule.FileName = Convert.ToString(row["FileName"]);
                        _rule.FieldValue = Convert.ToString(row["FieldValue"]);
                        _rule.EntryDate = Convert.ToDateTime(row["EntryDate"]);
                        _rule.IsSuccess = Convert.ToBoolean(row["IsSuccess"]);


                        list.Add(_rule);
                    }
                }
            }

            return list;
        }

        public DataTable GetDateWiseData()
        {
            DataTable table = SqlDBHelper.ExecuteSelectCommand("proc_RuleApplicationSummary_GetDateWiseData", CommandType.StoredProcedure);

            return table;

        }
        public DataTable GetDateWiseSuccessFailure(DateTime RunDate)
        {
            SqlParameter[] parameters = new SqlParameter[]
           {
            new SqlParameter("@RunDate", RunDate)
           };


            DataTable table = SqlDBHelper.ExecuteParamerizedSelectCommand("proc_RuleApplicationSummary_GetDateWiseSuccessFailure", CommandType.StoredProcedure, parameters);


            return table;

        }

        public bool UpdateField(RuleApplicationSummary _ruleDetails)
        {

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@ID",_ruleDetails.ID),      
            new SqlParameter("@FieldValue",_ruleDetails.FieldValue),
            };
            return SqlDBHelper.ExecuteNonQuery("proc_RuleApplicationSummary_UpdateFieldValue", CommandType.StoredProcedure, parameters);
        }
    }
    

}
