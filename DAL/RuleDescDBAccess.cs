using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class RuleDescDBAccess
    {
        public bool AddNew(RuleDesc _rule)
        {

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@RuleMastID",_rule.RuleMastID),
            new SqlParameter("@RuleName",_rule.RuleName),
            new SqlParameter("@SplitAs",_rule.SplitAs),
            new SqlParameter("@Dictionary",_rule.Dictionary),
            new SqlParameter("@OriginalDocumentName",_rule.OriginalDocumentName),
            new SqlParameter("@ConvertedDocumentName",_rule.ConvertedDocumentName),
            new SqlParameter("@EntryDate",_rule.EntryDate),
            new SqlParameter("@ModifiedDate",_rule.ModifiedDate),
            new SqlParameter("@IsActive",_rule.IsActive),
            new SqlParameter("@NeighbourhoodCount",_rule.NeighbourhoodCount),
            new SqlParameter("@Expression1",_rule.Expression1),
            new SqlParameter("@Expression2",_rule.Expression2),
            new SqlParameter("@ContextWord",_rule.ContextWord),
            new SqlParameter("@Operator",_rule.Operator),
             new SqlParameter("@FieldName",_rule.FieldName),
            new SqlParameter("@FieldValue",_rule.FieldValue),
            new SqlParameter("@UploadedFile",_rule.UploadedFile),

             new SqlParameter("@IsIgnoreKeyword",_rule.IsIgnoreKeyword),
            new SqlParameter("@FieldPosition",_rule.FieldPosition),
             new SqlParameter("@IsCheckSynonyms",_rule.IsCheckSynonyms),
            new SqlParameter("@Synonyms",_rule.Synonyms),
            new SqlParameter("@ExpressionContext",_rule.ExpressionContext),
            };
            return SqlDBHelper.ExecuteNonQuery("proc_RuleDesc_AddNew", CommandType.StoredProcedure, parameters);
        }
        public bool Update(RuleDesc _rule)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@ID", _rule.ID),
            new SqlParameter("@RuleMastID",_rule.RuleMastID),
            new SqlParameter("@RuleName",_rule.RuleName),
            new SqlParameter("@SplitAs",_rule.SplitAs),
            new SqlParameter("@Dictionary",_rule.Dictionary),
            new SqlParameter("@OriginalDocumentName",_rule.OriginalDocumentName),
            new SqlParameter("@ConvertedDocumentName",_rule.ConvertedDocumentName),
            new SqlParameter("@EntryDate",_rule.EntryDate),
            new SqlParameter("@ModifiedDate",_rule.ModifiedDate),
            new SqlParameter("@IsActive",_rule.IsActive),
            new SqlParameter("@NeighbourhoodCount",_rule.NeighbourhoodCount),
            new SqlParameter("@Expression1",_rule.Expression1),
            new SqlParameter("@Expression2",_rule.Expression2),
            new SqlParameter("@ContextWord",_rule.ContextWord),
            new SqlParameter("@Operator",_rule.Operator),
            new SqlParameter("@FieldName",_rule.FieldName),
            new SqlParameter("@FieldValue",_rule.FieldValue),
            new SqlParameter("@UploadedFile",_rule.UploadedFile),
             new SqlParameter("@IsIgnoreKeyword",_rule.IsIgnoreKeyword),
            new SqlParameter("@FieldPosition",_rule.FieldPosition),
             new SqlParameter("@IsCheckSynonyms",_rule.IsCheckSynonyms),
            new SqlParameter("@Synonyms",_rule.Synonyms),
            new SqlParameter("@ExpressionContext",_rule.ExpressionContext),
            };

            return SqlDBHelper.ExecuteNonQuery("proc_RuleDesc_Update", CommandType.StoredProcedure, parameters);
        }

        public bool UpdateActiveInActive(RuleDesc _rule)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@ID", _rule.ID),
            new SqlParameter("@IsActive", _rule.IsActive),

            };

            return SqlDBHelper.ExecuteNonQuery("proc_RuleDesc_UpdateActiveInactive", CommandType.StoredProcedure, parameters);
        }

        public RuleDesc GetRuleDescDetails(int ID)
        {
            RuleDesc _rule = null;

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@ID", ID)
            };

            using (DataTable table = SqlDBHelper.ExecuteParamerizedSelectCommand("proc_RuleDesc_LoadByPK", CommandType.StoredProcedure, parameters))
            {
                //check if any record exist or not
                if (table.Rows.Count == 1)
                {
                    DataRow row = table.Rows[0];


                    _rule = new RuleDesc();
                    _rule.ID = Convert.ToInt32(row["ID"]);
                    _rule.RuleName = row["RuleName"].ToString();
                    _rule.EntryDate = Convert.ToDateTime(row["EntryDate"]);
                    _rule.IsActive = Convert.ToBoolean(row["IsActive"]);
                    _rule.ModifiedDate = Convert.ToDateTime(row["ModifiedDate"]);


                    _rule.RuleMastID = Convert.ToInt32(row["RuleMastID"]);

                    _rule.SplitAs = Convert.ToString(row["SplitAs"]);
                    _rule.Dictionary = Convert.ToString(row["Dictionary"]);
                    _rule.OriginalDocumentName = Convert.ToString(row["OriginalDocumentName"]);
                    _rule.ConvertedDocumentName = Convert.ToString(row["ConvertedDocumentName"]);

                    _rule.NeighbourhoodCount = Convert.ToInt32(row["NeighbourhoodCount"]);
                    _rule.ContextWord = Convert.ToString(row["ContextWord"]);
                    _rule.Operator = Convert.ToString(row["Operator"]);
                    _rule.FieldName = Convert.ToString(row["FieldName"]);
                    _rule.FieldValue = Convert.ToString(row["FieldValue"]);
                    _rule.Expression1 = Convert.ToString(row["Expression1"]);
                    _rule.Expression2 = Convert.ToString(row["Expression2"]);

                    _rule.ExpressionContext = Convert.ToString(row["ExpressionContext"]);
                    _rule.IsIgnoreKeyword = Convert.ToBoolean(row["IsIgnoreKeyword"]);
                    _rule.IsCheckSynonyms = Convert.ToBoolean(row["IsCheckSynonyms"]);
                    _rule.FieldPosition = Convert.ToString(row["FieldPosition"]);
                    _rule.Synonyms = Convert.ToString(row["Synonyms"]);
                }
            }

            return _rule;
        }


        public List<RuleDesc> GetRuleDetailsByRuleMastID(int RuleMastID)
        {
            List<RuleDesc> list = null;

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@RuleMastID", RuleMastID)
            };
            using (DataTable table = SqlDBHelper.ExecuteParamerizedSelectCommand("proc_RuleDesc_LoadByRuleMastID", CommandType.StoredProcedure, parameters))
            {
                if (table.Rows.Count > 0)
                {
                    list = new List<RuleDesc>();

                    foreach (DataRow row in table.Rows)
                    {
                        RuleDesc _rule = new RuleDesc();

                        // DataRow row = table.Rows[0];


                        _rule = new RuleDesc();
                        _rule.ID = Convert.ToInt32(row["ID"]);
                        _rule.RuleName = row["RuleName"].ToString();
                        _rule.EntryDate = Convert.ToDateTime(row["EntryDate"]);
                        _rule.IsActive = Convert.ToBoolean(row["IsActive"]);
                        _rule.ModifiedDate = Convert.ToDateTime(row["ModifiedDate"]);


                        _rule.RuleMastID = Convert.ToInt32(row["RuleMastID"]);

                        _rule.SplitAs = Convert.ToString(row["SplitAs"]);
                        _rule.Dictionary = Convert.ToString(row["Dictionary"]);
                        _rule.OriginalDocumentName = Convert.ToString(row["OriginalDocumentName"]);
                        _rule.ConvertedDocumentName = Convert.ToString(row["ConvertedDocumentName"]);

                        _rule.NeighbourhoodCount = Convert.ToInt32(row["NeighbourhoodCount"]);
                        _rule.ContextWord = Convert.ToString(row["ContextWord"]);
                        _rule.Operator = Convert.ToString(row["Operator"]);
                        _rule.FieldName = Convert.ToString(row["FieldName"]);
                        _rule.FieldValue = Convert.ToString(row["FieldValue"]);
                        _rule.Expression1 = Convert.ToString(row["Expression1"]);
                        _rule.Expression2 = Convert.ToString(row["Expression2"]);

                        list.Add(_rule);
                    }
                }
            }

            return list;
        }
    }
}
