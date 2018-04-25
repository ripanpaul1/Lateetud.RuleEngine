using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Configuration
    {
        public long ID { get; set; }
        public string ConfigurationKey { get; set; }
        public string ConfigurationValue { get; set; }
        public string ConfigurationType { get; set; }
        public DateTime EntryDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string Comment { get; set; }
        public bool IsActive { get; set; }
    }
}
