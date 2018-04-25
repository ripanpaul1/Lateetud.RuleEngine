using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class APICallHistoryDBAccess
    {
        public bool AddNew(APICallHistory _history)
        {

            SqlParameter[] parameters = new SqlParameter[]
            {

            new SqlParameter("@RunTime",_history.RunTime),
            new SqlParameter("@Comment",_history.Comment),
            new SqlParameter("@Status",_history.Status),
            new SqlParameter("@RunID",_history.RunID),


            };
            return SqlDBHelper.ExecuteNonQuery("proc_APICallHistory_AddNew", CommandType.StoredProcedure, parameters);
        }
        public List<APICallHistory> GetAPIHistoryList()
        {
            List<APICallHistory> list = null;

            using (DataTable table = SqlDBHelper.ExecuteSelectCommand("proc_APICallHistory_GetAll", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    list = new List<APICallHistory>();

                    foreach (DataRow row in table.Rows)
                    {
                        APICallHistory _history = new APICallHistory();

                        _history.ID = Convert.ToInt64(row["ID"]);
                        _history.RunTime = Convert.ToDateTime(row["RunTime"]);
                        _history.Comment = Convert.ToString(row["Comment"]);
                        _history.Status = Convert.ToString(row["Status"]);
                        _history.RunID = Convert.ToInt32(row["RunID"]);
                        
                        list.Add(_history);
                    }
                }
            }

            return list;
        }
    }
}
