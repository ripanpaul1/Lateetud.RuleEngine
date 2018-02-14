using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class vwRuleEngineDBAccess
    {
        public List<vwRuleEngine> GetRuleList()
        {
            List<vwRuleEngine> list = null;

            using (DataTable table = SqlDBHelper.ExecuteSelectCommand("proc_VwRuleEngine_GetAll", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    list = new List<vwRuleEngine>();

                    foreach (DataRow row in table.Rows)
                    {
                        vwRuleEngine _rule = new vwRuleEngine();

                        _rule.ID = Convert.ToInt32(row["ID"]);
                        _rule.RuleMastID = Convert.ToInt32(row["RuleMastID"]);
                        _rule.RuleDescID = Convert.ToString(row["RuleDescID"]);
                        _rule.FolderPath = Convert.ToString(row["FolderPath"]);
                        _rule.CreateDate = Convert.ToDateTime(row["CreateDate"]);
                        _rule.ModifiedDate = Convert.ToDateTime(row["ModifiedDate"]);
                        _rule.IsActive = Convert.ToBoolean(row["IsActive"]);
                       
                        _rule.RuleName = Convert.ToString(row["RuleName"]);
                        _rule.RuleMastName = Convert.ToString(row["RuleMastName"]);
                        

                        list.Add(_rule);
                    }
                }
            }

            return list;
        }
    }
}
