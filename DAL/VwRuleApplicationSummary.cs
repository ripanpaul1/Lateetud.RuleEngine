using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class VwRuleApplicationSummary
    {
        public string RuleName { get; set; }
        public string FieldValue { get; set; }
        public long RunID { get; set; }
        public bool IsSuccess { get; set; }
        public long ID { get; set; }
        public string FileName { get; set; }
        public DateTime EntryDate { get; set; }
        public long RuleDescID { get; set; }

    }
}

