using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ServiceHistoryDBAccess
    {
        public bool AddNew(ServiceHistory _history)
        {

            SqlParameter[] parameters = new SqlParameter[]
            {

            new SqlParameter("@RunTime",_history.RunTime),
            new SqlParameter("@Comment",_history.Comment),
            new SqlParameter("@Status",_history.Status),
            new SqlParameter("@RunID",_history.RunID),

            new SqlParameter("@NoOfFile",_history.NoOfFile),
            
            };
            return SqlDBHelper.ExecuteNonQuery("proc_ServiceHistory_AddNew", CommandType.StoredProcedure, parameters);
        }
        public List<ServiceHistory> GetServiceHistoryList()
        {
            List<ServiceHistory> list = null;

            using (DataTable table = SqlDBHelper.ExecuteSelectCommand("proc_ServiceHistory_GetAll", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    list = new List<ServiceHistory>();

                    foreach (DataRow row in table.Rows)
                    {
                        ServiceHistory _history = new ServiceHistory();

                        _history.ID = Convert.ToInt64(row["ID"]);
                        _history.RunTime = Convert.ToDateTime(row["RunTime"]);
                        _history.Comment = Convert.ToString(row["Comment"]);
                        _history.Status = Convert.ToString(row["Status"]);
                        _history.RunID = Convert.ToInt32(row["RunID"]);
                        _history.NoOfFile = Convert.ToInt32(row["NoOfFile"]);

                        list.Add(_history);
                    }
                }
            }

            return list;
        }

        public List<ServiceHistory> GetServiceHistoryForLastNRecords()
        {
            List<ServiceHistory> list = null;

            using (DataTable table = SqlDBHelper.ExecuteSelectCommand("proc_ServiceHistory_GetLastNRecords", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    list = new List<ServiceHistory>();

                    foreach (DataRow row in table.Rows)
                    {
                        ServiceHistory _history = new ServiceHistory();

                        _history.ID = Convert.ToInt64(row["ID"]);
                        _history.RunTime = Convert.ToDateTime(row["RunTime"]);
                        _history.Comment = Convert.ToString(row["Comment"]);
                        _history.Status = Convert.ToString(row["Status"]);
                        _history.RunID = Convert.ToInt32(row["RunID"]);
                        _history.NoOfFile = Convert.ToInt32(row["NoOfFile"]);

                        list.Add(_history);
                    }
                }
            }

            return list;
        }

        public List<ServiceHistory> GetServiceHistoryStatusOfNRecords()
        {
            List<ServiceHistory> list = null;

            using (DataTable table = SqlDBHelper.ExecuteSelectCommand("proc_ServiceHistory_GetStatusOfNRecords", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    list = new List<ServiceHistory>();

                    foreach (DataRow row in table.Rows)
                    {
                        ServiceHistory _history = new ServiceHistory();

                        _history.ID = Convert.ToInt64(row["ID"]);
                        _history.RunTime = Convert.ToDateTime(row["RunTime"]);
                        _history.Comment = Convert.ToString(row["Comment"]);
                        _history.Status = Convert.ToString(row["Status"]);
                        _history.RunID = Convert.ToInt32(row["RunID"]);
                        _history.NoOfFile = Convert.ToInt32(row["NoOfFile"]);

                        list.Add(_history);
                    }
                }
            }

            return list;
        }
    }
}
