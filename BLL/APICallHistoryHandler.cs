using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class APICallHistoryHandler
    {
        APICallHistoryDBAccess apiHistoryDB = null;
        public APICallHistoryHandler()
        {
            apiHistoryDB = new APICallHistoryDBAccess();
        }
        public bool AddNew(APICallHistory objApiHistory)
        {
            return apiHistoryDB.AddNew(objApiHistory);
        }
        public List<APICallHistory> GetAllApiHistory()
        {
            return apiHistoryDB.GetAPIHistoryList();
        }
    }
}
