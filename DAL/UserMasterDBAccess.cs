using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class UserMasterDBAccess
    {
        public bool AddNew(UserMaster _user)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@UserName", _user.UserName),
            new SqlParameter("@Password", _user.Password),
            new SqlParameter("@IsActive", _user.IsActive),
            new SqlParameter("@FirstName", _user.FirstName),
            new SqlParameter("@LastName", _user.LastName),
            new SqlParameter("@IsAdmin", _user.IsAdmin),
            new SqlParameter("@LoginDatetime", _user.LoginDatetime),
            new SqlParameter("@ModifiedDate", _user.ModifiedDate),
            
            new SqlParameter("@LastLoginDatetime", _user.LastLoginDatetime),
            new SqlParameter("@CreatedDate", _user.CreatedDate),
            new SqlParameter("@EmailId", _user.EmailId),
            };

            return SqlDBHelper.ExecuteNonQuery("proc_UserMaster_AddNew", CommandType.StoredProcedure, parameters);
        }
        public bool Update(UserMaster _user)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@ID", _user.ID),
            new SqlParameter("@UserName", _user.UserName),
            new SqlParameter("@Password", _user.Password),
            new SqlParameter("@IsActive", _user.IsActive),
            new SqlParameter("@FirstName", _user.FirstName),
            new SqlParameter("@LastName", _user.LastName),
            new SqlParameter("@IsAdmin", _user.IsAdmin),
            new SqlParameter("@LoginDatetime", _user.LoginDatetime),
            new SqlParameter("@ModifiedDate", _user.ModifiedDate),
            
            new SqlParameter("@LastLoginDatetime", _user.LastLoginDatetime),
            new SqlParameter("@CreatedDate", _user.CreatedDate),
            new SqlParameter("@EmailId", _user.EmailId),
            };

            return SqlDBHelper.ExecuteNonQuery("proc_UserMaster_Update", CommandType.StoredProcedure, parameters);
        }
        public bool UpdateActiveInActive(UserMaster _user)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@ID", _user.ID),
            new SqlParameter("@IsActive", _user.IsActive),

            };

            return SqlDBHelper.ExecuteNonQuery("proc_UserMaster_UpdateActiveInactive", CommandType.StoredProcedure, parameters);
        }
        public bool Delete(int id)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@ID", id)
            };

            return SqlDBHelper.ExecuteNonQuery("proc_UserMaster_Delete", CommandType.StoredProcedure, parameters);
        }

        public UserMaster GetUserDetails(int ID)
        {
            UserMaster _user = null;

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@ID", ID)
            };
           
            using (DataTable table = SqlDBHelper.ExecuteParamerizedSelectCommand("proc_UserMaster_LoadByPK", CommandType.StoredProcedure, parameters))
            {
                //check if any record exist or not
                if (table.Rows.Count == 1)
                {
                    DataRow row = table.Rows[0];

                   
                    _user = new UserMaster();
                    _user.ID = Convert.ToInt32(row["ID"]);
                    _user.UserName = row["UserName"].ToString();
                    _user.Password = row["Password"].ToString();
                    _user.IsActive = Convert.ToBoolean(row["IsActive"]);
                    _user.FirstName = row["FirstName"].ToString();
                    _user.LastName = row["LastName"].ToString();
                    _user.IsAdmin = Convert.ToBoolean(row["IsAdmin"]);
                    _user.EmailId = row["EmailId"].ToString();
                    _user.CreatedDate = Convert.ToDateTime(row["CreatedDate"]);
                    _user.ModifiedDate = Convert.ToDateTime(row["ModifiedDate"]);
                    _user.LastLoginDatetime = Convert.ToDateTime(row["LastLoginDatetime"]);
                    _user.LoginDatetime = Convert.ToDateTime(row["LoginDatetime"]);
                   

                }
            }

            return _user;
        }
        public UserMaster GetUserByUserName(string userName)
        {
            UserMaster _user = null;

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@UserName", userName)
            };

            using (DataTable table = SqlDBHelper.ExecuteParamerizedSelectCommand("proc_UserMaster_LoadByUserName", CommandType.StoredProcedure, parameters))
            {
                //check if any record exist or not
                if (table.Rows.Count == 1)
                {
                    DataRow row = table.Rows[0];


                    _user = new UserMaster();
                    _user.ID = Convert.ToInt32(row["ID"]);
                    _user.UserName = row["UserName"].ToString();
                    _user.Password = row["Password"].ToString();
                    _user.IsActive = Convert.ToBoolean(row["IsActive"]);
                    _user.FirstName = row["FirstName"].ToString();
                    _user.LastName = row["LastName"].ToString();
                    _user.IsAdmin = Convert.ToBoolean(row["IsAdmin"]);
                    _user.EmailId = row["EmailId"].ToString();
                    _user.CreatedDate = Convert.ToDateTime(row["CreatedDate"]);
                    _user.ModifiedDate = Convert.ToDateTime(row["ModifiedDate"]);
                    _user.LastLoginDatetime = Convert.ToDateTime(row["LastLoginDatetime"]);
                    _user.LoginDatetime = Convert.ToDateTime(row["LoginDatetime"]);
                  

                }
            }

            return _user;
        }
        public List<UserMaster> GetUserList()
        {
            List<UserMaster> list = null;
                        
            using (DataTable table = SqlDBHelper.ExecuteSelectCommand("proc_UserMaster_GetAll", CommandType.StoredProcedure))
            {               
                if (table.Rows.Count > 0)
                {                   
                    list = new List<UserMaster>();
                                       
                    foreach (DataRow row in table.Rows)
                    {
                        UserMaster _user = new UserMaster();
                        
                        _user.ID = Convert.ToInt32(row["ID"]);
                        _user.UserName = row["UserName"].ToString();
                        _user.Password = row["Password"].ToString();
                        _user.IsActive = Convert.ToBoolean(row["IsActive"]);
                        _user.FirstName = row["FirstName"].ToString();
                        _user.LastName = row["LastName"].ToString();
                        _user.IsAdmin = Convert.ToBoolean(row["IsAdmin"]);
                        _user.EmailId = row["EmailId"].ToString();
                        _user.CreatedDate =Convert.ToDateTime(row["CreatedDate"]);
                        _user.ModifiedDate = Convert.ToDateTime(row["ModifiedDate"]);
                        _user.LastLoginDatetime = Convert.ToDateTime(row["LastLoginDatetime"]);
                        _user.LoginDatetime = Convert.ToDateTime(row["LoginDatetime"]);
                        
                        list.Add(_user);
                    }
                }
            }

            return list;
        }
    }
}
