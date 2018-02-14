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
    }
}
