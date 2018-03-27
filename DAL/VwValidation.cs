﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class VwValidation
    {
        public long ID { get; set; }
        public long RuleDescID { get; set; }
        public bool IsActive { get; set; }
        public DateTime EntryDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string ExpressionContext { get; set; }
        public string ExpressionText { get; set; }
        public long RuleMastID { get; set; }
        public string RuleName { get; set; }
    }
}
