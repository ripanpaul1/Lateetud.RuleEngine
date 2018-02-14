using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class RuleMastDBAccess
    {
        public List<RuleMast> GetRules()
        {
            List<RuleMast> list = null;

            using (DataTable table = SqlDBHelper.ExecuteSelectCommand("proc_RuleMast_GetAll", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    list = new List<RuleMast>();

                    foreach (DataRow row in table.Rows)
                    {
                        RuleMast _rule = new RuleMast();

                        _rule.ID = Convert.ToInt32(row["ID"]);
                        _rule.RuleName = row["RuleName"].ToString();
                        _rule.IsActive = Convert.ToBoolean(row["IsActive"]);

                        list.Add(_rule);
                    }
                }
            }

            return list;
        }

        public bool AddNew(RuleMast _rule)
        {

            SqlParameter[] parameters = new SqlParameter[]
            {

            new SqlParameter("@RuleName",_rule.RuleName),
            new SqlParameter("@CreateDate",_rule.CreateDate),
            new SqlParameter("@ModifiedDate",_rule.ModifiedDate),
            new SqlParameter("@IsActive",_rule.IsActive),

            };
            return SqlDBHelper.ExecuteNonQuery("proc_RuleMast_AddNew", CommandType.StoredProcedure, parameters);
        }
        public bool Update(RuleMast _rule)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@ID", _rule.ID),
            new SqlParameter("@RuleName",_rule.RuleName),

            new SqlParameter("@ModifiedDate",_rule.ModifiedDate),
            new SqlParameter("@IsActive",_rule.IsActive),
            };

            return SqlDBHelper.ExecuteNonQuery("proc_RuleMast_Update", CommandType.StoredProcedure, parameters);
        }
        public RuleMast GetRuleMastDetails(int ID)
        {
            RuleMast _rule = null;

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@ID", ID)
            };

            using (DataTable table = SqlDBHelper.ExecuteParamerizedSelectCommand("proc_RuleMast_LoadByPK", CommandType.StoredProcedure, parameters))
            {
                //check if any record exist or not
                if (table.Rows.Count == 1)
                {
                    DataRow row = table.Rows[0];


                    _rule = new RuleMast();
                    _rule.ID = Convert.ToInt32(row["ID"]);
                    _rule.RuleName = row["RuleName"].ToString();
                    _rule.CreateDate = Convert.ToDateTime(row["CreateDate"]);
                    _rule.IsActive = Convert.ToBoolean(row["IsActive"]);
                   _rule.ModifiedDate= Convert.ToDateTime(row["ModifiedDate"]);
                }
            }

            return _rule;
        }

        
    }
}
