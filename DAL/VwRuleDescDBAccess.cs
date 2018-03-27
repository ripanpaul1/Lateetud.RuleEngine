using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class VwRuleDescDBAccess
    {
        public List<VwRuleDesc> GetRuleList()
        {
            List<VwRuleDesc> list = null;

            using (DataTable table = SqlDBHelper.ExecuteSelectCommand("proc_VwRuleDesc_GetAll", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    list = new List<VwRuleDesc>();

                    foreach (DataRow row in table.Rows)
                    {
                        VwRuleDesc _rule = new VwRuleDesc();

                        _rule.ID = Convert.ToInt32(row["ID"]);
                        _rule.RuleMastID= Convert.ToInt32(row["RuleMastID"]);
                        _rule.RuleDescName = Convert.ToString(row["RuleDescName"]);
                        _rule.SplitAs = Convert.ToString(row["SplitAs"]);
                        _rule.Dictionary = Convert.ToString(row["Dictionary"]);
                        _rule.OriginalDocumentName = Convert.ToString(row["OriginalDocumentName"]);
                        _rule.ConvertedDocumentName = Convert.ToString(row["ConvertedDocumentName"]);
                        _rule.EntryDate = Convert.ToDateTime(row["EntryDate"]);
                        _rule.ModifiedDate = Convert.ToDateTime(row["ModifiedDate"]);
                        _rule.IsActive = Convert.ToBoolean(row["IsActive"]);
                        _rule.NeighbourhoodCount = Convert.ToInt32(row["NeighbourhoodCount"]);
                        _rule.Expression1 = Convert.ToString(row["Expression1"]);
                        _rule.Expression2 = Convert.ToString(row["Expression2"]);
                        _rule.ContextWord = Convert.ToString(row["ContextWord"]);
                        _rule.Operator = Convert.ToString(row["Operator"]);
                        _rule.RuleName = Convert.ToString(row["RuleName"]);
                        _rule.IsActiveRuleMast = Convert.ToBoolean(row["IsActiveRuleMast"]);
                        _rule.FieldName = Convert.ToString(row["FieldName"]);
                        _rule.FieldValue = Convert.ToString(row["FieldValue"]);
                        _rule.UploadedFile = Convert.ToString(row["UploadedFile"]);

                        _rule.IsIgnoreKeyword = Convert.ToBoolean(row["IsIgnoreKeyword"]);
                        _rule.FieldPosition = Convert.ToString(row["FieldPosition"]);
                        _rule.IsCheckSynonyms = Convert.ToBoolean(row["IsCheckSynonyms"]);
                        _rule.Synonyms = Convert.ToString(row["Synonyms"]);
                        _rule.ExpressionContext = Convert.ToString(row["ExpressionContext"]);


                        _rule.IsActiveValidation = Convert.ToBoolean(row["IsActiveValidation"]);
                        _rule.IsValidated = Convert.ToBoolean(row["IsValidated"]);
                        list.Add(_rule);
                    }
                }
            }

            return list;
        }
        public VwRuleDesc GetRuleByRuleName(string ruleName)
        {
            VwRuleDesc _rule = null;

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@RuleName", ruleName)
            };

            using (DataTable table = SqlDBHelper.ExecuteParamerizedSelectCommand("proc_VwRuleDesc_LoadByUserName", CommandType.StoredProcedure, parameters))
            {
                //check if any record exist or not
                if (table.Rows.Count == 1)
                {
                    DataRow row = table.Rows[0];
                    
                    _rule = new VwRuleDesc();
                    _rule.ID = Convert.ToInt32(row["ID"]);
                    _rule.RuleMastID = Convert.ToInt32(row["RuleMastID"]);
                    _rule.RuleDescName = Convert.ToString(row["RuleSet"]);
                    _rule.SplitAs = Convert.ToString(row["SplitAs"]);
                    _rule.Dictionary = Convert.ToString(row["Dictionary"]);
                    _rule.OriginalDocumentName = Convert.ToString(row["OriginalDocumentName"]);
                    _rule.ConvertedDocumentName = Convert.ToString(row["ConvertedDocumentName"]);
                    _rule.EntryDate = Convert.ToDateTime(row["EntryDate"]);
                    _rule.ModifiedDate = Convert.ToDateTime(row["ModifiedDate"]);
                    _rule.IsActive = Convert.ToBoolean(row["IsActive"]);
                    _rule.NeighbourhoodCount = Convert.ToInt32(row["NeighbourhoodCount"]);
                    _rule.Expression1 = Convert.ToString(row["Expression1"]);
                    _rule.Expression2 = Convert.ToString(row["Expression2"]);
                    _rule.ContextWord = Convert.ToString(row["ContextWord"]);
                    _rule.Operator = Convert.ToString(row["Operator"]);
                    _rule.RuleName = Convert.ToString(row["RuleName"]);
                    _rule.IsActiveRuleMast = Convert.ToBoolean(row["IsActiveRuleMast"]);

                    _rule.IsIgnoreKeyword = Convert.ToBoolean(row["IsIgnoreKeyword"]);
                    _rule.FieldPosition = Convert.ToString(row["FieldPosition"]);
                    _rule.IsCheckSynonyms = Convert.ToBoolean(row["IsCheckSynonyms"]);
                    _rule.Synonyms = Convert.ToString(row["Synonyms"]);
                    _rule.ExpressionContext = Convert.ToString(row["ExpressionContext"]);

                }
            }

            return _rule;
        }
    }
}
