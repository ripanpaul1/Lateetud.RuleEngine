using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ConfigurationDBAccess
    {
        public List<Configuration> GetConfiguration()
        {
            List<Configuration> list = null;

            using (DataTable table = SqlDBHelper.ExecuteSelectCommand("proc_Configuration_GetAll", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    list = new List<Configuration>();

                    foreach (DataRow row in table.Rows)
                    {
                        Configuration _config = new Configuration();
                        
                        _config.ID = Convert.ToInt32(row["ID"]);
                        _config.ConfigurationKey = row["ConfigurationKey"].ToString();
                        _config.ConfigurationType = row["ConfigurationType"].ToString();
                        _config.ConfigurationValue = row["ConfigurationValue"].ToString();
                        
                        _config.EntryDate = Convert.ToDateTime(row["EntryDate"]);
                        _config.ModifiedDate =Convert.ToDateTime(row["ModifiedDate"]);
                        _config.IsActive = Convert.ToBoolean(row["IsActive"]);
                        _config.Comment = row["Comment"].ToString();

                        list.Add(_config);
                    }
                }
            }

            return list;
        }
    }
}
