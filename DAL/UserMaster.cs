using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class UserMaster
    {
       
        public int ID { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string EmailId { get; set; }
        public DateTime LoginDatetime { get; set; }
        public DateTime LastLoginDatetime { get; set; }
        
        public bool IsAdmin { get; set; }
    }
}
