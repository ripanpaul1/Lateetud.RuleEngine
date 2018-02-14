using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL;

namespace BLL
{
    public class UserMasterHandler
    {
        UserMasterDBAccess userMasterDB = null;
        public UserMasterHandler()
        {
            userMasterDB = new UserMasterDBAccess();
        }

        public List<UserMaster> GetUserListDetails()
        {
            return userMasterDB.GetUserList();
        }

        public bool UpdateUser(UserMaster objUser)
        {
            return userMasterDB.Update(objUser);
        }


        public UserMaster GetUserDetails(int ID)
        {
            return userMasterDB.GetUserDetails(ID);
        }

        public bool DeleteUser(int ID)
        {
            return userMasterDB.Delete(ID);
        }


        public bool AddNewUser(UserMaster objUser)
        {
            return userMasterDB.AddNew(objUser);
        }

        public UserMaster GetUserByUserName(string userName)
        {
            return userMasterDB.GetUserByUserName(userName);
        }

        public bool UpdateActiveInActiveUser(UserMaster objUser)
        {
            return userMasterDB.UpdateActiveInActive(objUser);
        }
    }
}