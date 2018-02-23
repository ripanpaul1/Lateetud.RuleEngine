using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
        public bool Update(Configuration _config)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@ID", _config.ID),
            new SqlParameter("@ConfigurationValue",_config.ConfigurationValue),
            new SqlParameter("@ModifiedDate",_config.ModifiedDate),
            };

            return SqlDBHelper.ExecuteNonQuery("proc_Configuration_Update", CommandType.StoredProcedure, parameters);
        }
        public Configuration GetConfigValue(string configKey)
        {
            Configuration _config = null;

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@ConfigurationKey", configKey)
            };

            using (DataTable table = SqlDBHelper.ExecuteParamerizedSelectCommand("proc_Configuration_LoadByKey", CommandType.StoredProcedure, parameters))
            {
                //check if any record exist or not
                if (table.Rows.Count == 1)
                {
                    DataRow row = table.Rows[0];


                    _config = new Configuration();
                    _config.ID = Convert.ToInt32(row["ID"]);

                    _config.ConfigurationKey = row["ConfigurationKey"].ToString();
                    _config.ConfigurationValue = row["ConfigurationValue"].ToString();
                    _config.ConfigurationType = row["ConfigurationType"].ToString();
                    _config.IsActive = Convert.ToBoolean(row["IsActive"]);
                    
                    _config.Comment =Convert.ToString(row["Comment"]);
                    _config.EntryDate = Convert.ToDateTime(row["EntryDate"]);
                    _config.ModifiedDate = Convert.ToDateTime(row["ModifiedDate"]);
                   


                }
            }

            return _config;
        }
    }
}
