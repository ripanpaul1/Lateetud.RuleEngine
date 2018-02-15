using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class RuleEngineDetailsDBAccess
    {
        
        public bool AddNew(RuleEngineDetails _rule)
        {

            SqlParameter[] parameters = new SqlParameter[]
            {
            
            new SqlParameter("@RuleMastID",_rule.RuleMastID),
            new SqlParameter("@RuleDescID",_rule.RuleDescID),
            new SqlParameter("@FolderPath",_rule.FolderPath),
            new SqlParameter("@UserID",_rule.UserID),

            new SqlParameter("@CreateDate",_rule.CreateDate),
            new SqlParameter("@ModifiedDate",_rule.ModifiedDate),
            new SqlParameter("@IsActive",_rule.IsActive),

            };
            return SqlDBHelper.ExecuteNonQuery("proc_RuleEngineDetails_AddNew", CommandType.StoredProcedure, parameters);
        }
        public bool UpdateorInsert(RuleEngineDetails _rule)
        {

            SqlParameter[] parameters = new SqlParameter[]
            {

            new SqlParameter("@RuleMastID",_rule.RuleMastID),
            new SqlParameter("@RuleDescID",_rule.RuleDescID),
            new SqlParameter("@FolderPath",_rule.FolderPath),
            new SqlParameter("@UserID",_rule.UserID),

            new SqlParameter("@CreateDate",_rule.CreateDate),
            new SqlParameter("@ModifiedDate",_rule.ModifiedDate),
            new SqlParameter("@IsActive",_rule.IsActive),

            };
            return SqlDBHelper.ExecuteNonQuery("proc_RuleEngineDetails_InsertAndUpdate", CommandType.StoredProcedure, parameters);
        }
        public List<RuleEngineDetails> GetRuleList()
        {
            List<RuleEngineDetails> list = null;

            using (DataTable table = SqlDBHelper.ExecuteSelectCommand("proc_RuleEngineDetails_GetAll", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    list = new List<RuleEngineDetails>();

                    foreach (DataRow row in table.Rows)
                    {
                        RuleEngineDetails _rule = new RuleEngineDetails();

                        _rule.RuleMastID = Convert.ToInt32(row["RuleMastID"]);
                       
                        _rule.FolderPath = Convert.ToString(row["FolderPath"]);
                        _rule.CreateDate = Convert.ToDateTime(row["CreateDate"]);
                        _rule.ModifiedDate = Convert.ToDateTime(row["ModifiedDate"]);
                        _rule.IsActive = Convert.ToBoolean(row["IsActive"]);
                        
                        list.Add(_rule);
                    }
                }
            }

            return list;
        }
    }
}
