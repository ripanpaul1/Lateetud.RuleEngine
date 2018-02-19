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
    }
}
