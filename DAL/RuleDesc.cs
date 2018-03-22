using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class RuleDesc
    {
        public long ID { get; set; }
        public long RuleMastID { get; set; }
        public string RuleName { get; set; }
        public string SplitAs { get; set; }
        public string Dictionary { get; set; }
        public string OriginalDocumentName { get; set; }
        public string ConvertedDocumentName { get; set; }
        public DateTime EntryDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        public bool IsActive { get; set; }
        public int NeighbourhoodCount { get; set; }
        public string Expression1 { get; set; }
        public string Expression2 { get; set; }
        public string ContextWord { get; set; }
        public string Operator { get; set; }
        public string FieldName { get; set; }
        public string FieldValue { get; set; }
        public string UploadedFile { get; set; }

        public bool IsIgnoreKeyword { get; set; }
        public string FieldPosition { get; set; }
        public bool IsCheckSynonyms { get; set; }
        public string Synonyms { get; set; }
        public string AllSynonyms { get; set; }
        public string ExpressionContext { get; set; }

        public string DocType { get; set; }
        

    }
}
