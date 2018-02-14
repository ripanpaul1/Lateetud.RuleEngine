using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class vwRuleEngine
    {
        public long ID { get; set; }
        public long RuleMastID { get; set; }
        public string RuleDescID { get; set; }
        public string FolderPath { get; set; }
        public long UserID { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        public bool IsActive { get; set; }
        public string RuleName { get; set; }
        public string RuleMastName { get; set; }
        public string UserName { get; set; }
    }
}
