using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ServiceHistory
    {
        public long ID { get; set; }
        public DateTime RunTime { get; set; }
        public string Comment { get; set; }
        public string Status { get; set; }
        public long RunID { get; set; }
        public int NoOfFile { get; set; }
    }
}
