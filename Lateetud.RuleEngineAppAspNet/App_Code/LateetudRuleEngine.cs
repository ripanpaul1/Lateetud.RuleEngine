﻿using BLL;
using DAL;
using HtmlAgilityPack;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Xml;
using Lateetud.Utilities.XmlManager;

/// <summary>
/// Summary description for LateetudRuleEngine
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class LateetudRuleEngine : System.Web.Services.WebService
{

    public LateetudRuleEngine()
    {
        
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string GetResultInJSON(string filePath)
    {
        DataTable dt = FetchRuleDetails(filePath);
        JsonSerializerSettings jss = new JsonSerializerSettings { ReferenceLoopHandling = ReferenceLoopHandling.Ignore };
        var result = JsonConvert.SerializeObject(dt, Newtonsoft.Json.Formatting.Indented, jss);

        return result;
        //return new JavaScriptSerializer().Serialize(dt);
        //return Json(result, JsonRequestBehavior.AllowGet);
    }
    [WebMethod]
    public string GetResultInXML(string filePath)
    {
        Lateetud.Utilities.XmlManager.XMLUtility xmlUtility = new XMLUtility();
        DataTable dt = new DataTable();
        dt = FetchRuleDetails(filePath);
        dt.TableName = "LateetudRuleApplication";
        string str = xmlUtility.ConvertDatatableToXML(dt);
        return str;
    }
    private DataTable FetchRuleDetails(string filePath)
    {
        //string strPath = @"E:\Document\RuleEngineDoc";
        RuleEngineDetailsHandler objRuleEngineH = new RuleEngineDetailsHandler();
        List<RuleEngineDetails> lstRuleEngine = objRuleEngineH.GetRuleDetails();// Get All Rules
        string[] strRule = new string[0];
        RuleDescHandler objRuleDescH = new RuleDescHandler();
        RuleDesc objRule;
        string[] searchValues = new string[0];

        int curTxtLength = 0;
        int lastValueCurTxt = 0;
        string strCurrText = string.Empty;
        int currPos = 0;
        string strRuleDescIds = string.Empty;
        string strCompleteContent = string.Empty;
        string searchText = string.Empty;
        int strNeighbourhood = 0;
        string strExprOption = string.Empty;
        string strOperator = string.Empty;
        string strPosition = string.Empty;
        string strExpr1 = string.Empty;
        string strExpr2 = string.Empty;
        string strFieldValue = string.Empty;
        string strFile = string.Empty;
        int noOfFile = 0;
        DataTable dt = new DataTable("RuleApplicationResult");
        List<RuleResult> ruleResult = new List<RuleResult>();
        APIRuleApplicationSummaryHandler objRuleSummaryHandler = new APIRuleApplicationSummaryHandler();
        APIRuleApplicationSummary objRuleSummary = objRuleSummaryHandler.GetRunID();

        foreach (RuleEngineDetails ruleElement in lstRuleEngine)
        {
            strRuleDescIds = Convert.ToString(ruleElement.RuleDescID);// Get Rule Ids
            Array.Clear(strRule, 0, strRule.Length);
            Array.Clear(searchValues, 0, searchValues.Length);
            strRule = strRuleDescIds.Split(',');
            curTxtLength = 0;
            lastValueCurTxt = 0;
            strCurrText = string.Empty;
            currPos = 0;
            strNeighbourhood = 0;
            noOfFile = 0;

            strExprOption = string.Empty;
            strOperator = string.Empty;
            strPosition = string.Empty;
            strExpr1 = string.Empty;
            strExpr2 = string.Empty;
            strFieldValue = string.Empty;

            //foreach (string file in Directory.EnumerateFiles(ruleElement.FolderPath.ToString(), "*.*", SearchOption.TopDirectoryOnly))
            //{

            strCompleteContent = ExtractTextFromPdf(filePath);
            ruleResult = new List<RuleResult>();//Reinitialize List
            searchValues = new string[0];//Reinitialize result

            #region Implement Rule
            foreach (string strID in strRule)
            {
                searchValues = new string[0];//Reinitialize result, Newly Added on 02-21-18

                objRule = objRuleDescH.GetRuleDescDetailsByID(Convert.ToInt32(strID));
                strOperator = Convert.ToString(objRule.Operator);
                strExprOption = Convert.ToString(objRule.ExpressionContext);
                searchText = Convert.ToString(objRule.ContextWord);
                strNeighbourhood = Convert.ToInt32(objRule.NeighbourhoodCount);
                strExpr1 = Convert.ToString(objRule.Expression1);
                strExpr2 = Convert.ToString(objRule.Expression2);
                strPosition = Convert.ToString(objRule.FieldPosition);

                if ((!objRule.IsIgnoreKeyword) || (string.IsNullOrEmpty(searchText)))
                    if ((strOperator != "RegEx"))
                    {
                        searchValues = searchText.Split(',');
                    }

                #region Operator Operation
                switch (strOperator)
                {
                    case "Range":
                        #region RangeOperation
                        switch (strExprOption)
                        {
                            case "Date":
                                //var re = new Regex(@"\b(?:Jan(?:uary)?|Feb(?:ruary)?|...|Dec(?:ember)?) (?:19[7-9]\d|2\d{3})(?=\D|$)");
                                //var month = re.Match(strCompleteContent).Groups["month"];
                                var regex = new Regex(@"\b(?:Jan(?:uary)?|Feb(?:ruary)?|Mar(?:ch)?|Apr(?:il)?|May|Jun(?:e)?|Jul(?:y)?|Aug(?:ust)?|Sep(?:tember)?|Oct(?:ober)?|Nov(?:ember)?|Dec(?:ember)?) (?:19[7-9]\d|2\d{3})(?=\D|$)");
                                //var regex = new Regex(@"\b(?:Jan(?:uary)?|Feb(?:ruary)?|...|Dec(?:ember)?) (?:19[7-9]\d|2\d{3})(?=\D|$)");
                                foreach (Match m in regex.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }
                                var regex1 = new Regex(@"\b(?:Jan(?:uary)?|Feb(?:ruary)?|...|Dec(?:ember)?) (?:19[7-9]\d|2\d{3})(?=\D|$)");
                                foreach (Match m in regex1.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }

                                var regex2 = new Regex(@"(\b\d{1,2}\D{0,3})?\b(?:Jan(?:uary)?|Feb(?:ruary)?|Mar(?:ch)?|Apr(?:il)?|May|Jun(?:e)?|Jul(?:y)?|Aug(?:ust)?|Sep(?:tember)?|Oct(?:ober)?|(Nov|Dec)(?:ember)?)\D?(\d{1,2}\D?)?\D?((19[7-9]\d|20\d{2})|\d{2})");
                                foreach (Match m in regex2.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }

                                var regex3 = new Regex(@"^(?ni:(((?:((((((?<month>(?<monthname>(Jan(uary)?|Ma(r(ch)?|y)|Jul(y)?|Aug(ust)?|Oct(ober)?|Dec(ember)?)))\ )|(?<month>(?<monthnum>(0?[13578])|10)(?<sep>[-/.])))(?<day>31)(?(monthnum)|st)?)|((((?<month>(?<monthname>Jan(uary)?|Ma(r(ch)?|y)|Apr(il)?|Ju((ly?)|(ne?))|Aug(ust)?|Oct(ober)?|(Sept|Nov|Dec)(ember)?))\ )|((?<month>(?<monthnum>(0?[13-9])|1[012]))(?<sep>[-/.])))(?<day>((0?[1-9]|([12]\d)|30)|(?(monthname)(\b2?(1st|2nd|3rd|[4-9]th)|(2|3)0th|1\dth\b))))))|((((?<month>(?<monthname>Feb(ruary)?))\ )|((?<month>0?2)(?<sep>[-/.])))((?(monthname)(?<day>(\b2?(1st|2nd|3rd|[4-8]th)|9th|20th|1\dth\b)|(0?[1-9]|1\d|2[0-8])))|(?<day>29(?=(\k<sep>|(?(monthname)th)?,\ )((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)))))))(?(sep)\k<sep>|((?(monthname)th)?,\ ))(?<year>(1[6-9]|[2-9]\d)\d{2}))$|((?<days>(31(?<suffix>st)?(?!(\ (Feb(ruary)?|Apr(il)?|June?|(Sep(?=\b|t)t?|Nov)(ember)?))|[-/.](0?[2469]|11)))|((30|29)(?<suffix>th)?(?!((\ Feb(ruary)?)|([-/.]0?2))))|(29(?<suffix>th)?(?=((\ Feb(ruary)?\ )|([ -/.]0?2))(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)))))|(?<suffix>(?=\d\d?[nrst][dht]\ [JFMASOND])(\b2?(1st|2nd|3rd|[4-8]th)|20th|1\dth\b)|((0?[1-9])|1\d|2[0-8])))(?<month>(\ (?<monthname>(Jan(uary)?|Feb(ruary)?|Ma(r(ch)?|y)|Apr(il)?|Ju((ly?)|(ne?))|Aug(ust)?|Oct(ober)?|(Sep(?=\b|t)t?|Nov|Dec)(ember)?))\ )|(?(\k<suffix>)|((?<sep>[-/.])(0?[1-9]|1[012])\k<sep>)))(?<year>(1[6-9]|[2-9]\d)\d{2}))|\b((?<year>((1[6-9])|([2-9]\d))\d\d)(?<sep>[/.-])(?<month>0?[1-9]|1[012])\k<sep>(?<day>((?<!(\k<sep>((0?[2469])|11)\k<sep>))31)|(?<!\k<sep>(0?2)\k<sep>)(29|30)|((?<=((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|(16|[2468][048]|[3579][26])00)\k<sep>(0?2)\k<sep>)29)|((0?[1-9])|(1\d)|(2[0-8]))))\b)(?:(?=\x20\d)\x20|$))?((?<time>((0?[1-9]|1[012])(:[0-5]\d){0,2}(\x20[AP]M))|([01]\d|2[0-3])(:[0-5]\d){1,2}))?)$");
                                foreach (Match m in regex3.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }
                                break;
                            case "Number":
                                string[] numbers = Regex.Split(strCompleteContent, @"\D+");
                                foreach (string value in numbers)
                                {
                                    if (!string.IsNullOrEmpty(value))
                                    {
                                        int i = int.Parse(value);
                                        if (Enumerable.Range(Convert.ToInt32(strExpr1), Convert.ToInt32(strExpr2)).Contains(i))
                                        {
                                            searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { i.ToString() }).ToArray();
                                        }

                                    }
                                }
                                break;
                            case "Amount":
                                //string[] amount = Regex.Split(strCompleteContent, @"^\$[0-9]+(\.[0-9][0-9])?$");
                                //foreach (string value in amount)
                                //{
                                //    if (!string.IsNullOrEmpty(value))
                                //    {
                                //        //int i = int.Parse(value);

                                //        searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { value.ToString() }).ToArray();


                                //    }
                                //}
                                var regexAmt = new Regex(@"^(\$)?((\d{1,5})|(\d{1,3})(\,\d{3})*)(\.\d{1,2})?$");
                                foreach (Match m in regexAmt.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }
                                var regexAmt1 = new Regex(@"^\$?\d{1,2}\,\d{3}?\,\d{3}?(\.(\d{2}))$|^\$?\d{1,3}?\,\d{3}?(\.(\d{2}))$|^\$?\d{1,3}?(\.(\d{2}))$");
                                foreach (Match m in regexAmt1.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }
                                var regexAmt2 = new Regex(@"$(\d+)");
                                foreach (Match m in regexAmt2.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }
                                var regexAmt3 = new Regex(@"(\\$\\w+) ");
                                foreach (Match m in regexAmt3.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }
                                var regexAmt4 = new Regex(@"(\\$[a-zA-Z]*)");
                                foreach (Match m in regexAmt4.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }

                                Regex reg = new Regex("$");
                                Match mat = reg.Match(strCompleteContent);
                                while (mat.Success)
                                {

                                    mat = reg.Match(strCompleteContent, mat.Index + mat.Length);
                                    //searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { value.ToString() }).ToArray();
                                }
                                break;

                            case "Percent":
                                var regexPercent = new Regex(@"^\s*(\d{0,2})(\.?(\d*))?\s*\%?\s*$");
                                foreach (Match m in regexPercent.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }

                                string[] regexPercent1 = Regex.Split(strCompleteContent, @"^(\d{0,4}(?:\.\d{0,2})? | [-]\d{0,2}(?:\.\d{0,2})? )[%]{0,1}$");
                                foreach (string value in regexPercent1)
                                {
                                    if (!string.IsNullOrEmpty(value))
                                    {

                                        searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { value.ToString() }).ToArray();

                                    }
                                }
                                //string[] regexPercent2 = Regex.Split(strCompleteContent, @"(\d+)%");
                                //foreach (string value in regexPercent2)
                                //{
                                //    if (!string.IsNullOrEmpty(value))
                                //    {

                                //        searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { value.ToString() }).ToArray();

                                //    }
                                //}
                                var regexPercent3 = new Regex(@"(\d+)%");
                                foreach (Match m in regexPercent3.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }

                                break;
                            default:
                                break;
                        }
                        #endregion
                        break;
                    case "Any":
                        #region AnyOperation
                        switch (strExprOption)
                        {
                            case "Date":
                                //var re = new Regex(@"\b(?:Jan(?:uary)?|Feb(?:ruary)?|...|Dec(?:ember)?) (?:19[7-9]\d|2\d{3})(?=\D|$)");
                                //var month = re.Match(strCompleteContent).Groups["month"];
                                var regex = new Regex(@"\b(?:Jan(?:uary)?|Feb(?:ruary)?|Mar(?:ch)?|Apr(?:il)?|May|Jun(?:e)?|Jul(?:y)?|Aug(?:ust)?|Sep(?:tember)?|Oct(?:ober)?|Nov(?:ember)?|Dec(?:ember)?) (?:19[7-9]\d|2\d{3})(?=\D|$)");
                                //var regex = new Regex(@"\b(?:Jan(?:uary)?|Feb(?:ruary)?|...|Dec(?:ember)?) (?:19[7-9]\d|2\d{3})(?=\D|$)");
                                foreach (Match m in regex.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }
                                var regex1 = new Regex(@"\b(?:Jan(?:uary)?|Feb(?:ruary)?|...|Dec(?:ember)?) (?:19[7-9]\d|2\d{3})(?=\D|$)");
                                foreach (Match m in regex1.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }

                                var regex2 = new Regex(@"(\b\d{1,2}\D{0,3})?\b(?:Jan(?:uary)?|Feb(?:ruary)?|Mar(?:ch)?|Apr(?:il)?|May|Jun(?:e)?|Jul(?:y)?|Aug(?:ust)?|Sep(?:tember)?|Oct(?:ober)?|(Nov|Dec)(?:ember)?)\D?(\d{1,2}\D?)?\D?((19[7-9]\d|20\d{2})|\d{2})");
                                foreach (Match m in regex2.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }

                                var regex3 = new Regex(@"^(?ni:(((?:((((((?<month>(?<monthname>(Jan(uary)?|Ma(r(ch)?|y)|Jul(y)?|Aug(ust)?|Oct(ober)?|Dec(ember)?)))\ )|(?<month>(?<monthnum>(0?[13578])|10)(?<sep>[-/.])))(?<day>31)(?(monthnum)|st)?)|((((?<month>(?<monthname>Jan(uary)?|Ma(r(ch)?|y)|Apr(il)?|Ju((ly?)|(ne?))|Aug(ust)?|Oct(ober)?|(Sept|Nov|Dec)(ember)?))\ )|((?<month>(?<monthnum>(0?[13-9])|1[012]))(?<sep>[-/.])))(?<day>((0?[1-9]|([12]\d)|30)|(?(monthname)(\b2?(1st|2nd|3rd|[4-9]th)|(2|3)0th|1\dth\b))))))|((((?<month>(?<monthname>Feb(ruary)?))\ )|((?<month>0?2)(?<sep>[-/.])))((?(monthname)(?<day>(\b2?(1st|2nd|3rd|[4-8]th)|9th|20th|1\dth\b)|(0?[1-9]|1\d|2[0-8])))|(?<day>29(?=(\k<sep>|(?(monthname)th)?,\ )((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)))))))(?(sep)\k<sep>|((?(monthname)th)?,\ ))(?<year>(1[6-9]|[2-9]\d)\d{2}))$|((?<days>(31(?<suffix>st)?(?!(\ (Feb(ruary)?|Apr(il)?|June?|(Sep(?=\b|t)t?|Nov)(ember)?))|[-/.](0?[2469]|11)))|((30|29)(?<suffix>th)?(?!((\ Feb(ruary)?)|([-/.]0?2))))|(29(?<suffix>th)?(?=((\ Feb(ruary)?\ )|([ -/.]0?2))(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)))))|(?<suffix>(?=\d\d?[nrst][dht]\ [JFMASOND])(\b2?(1st|2nd|3rd|[4-8]th)|20th|1\dth\b)|((0?[1-9])|1\d|2[0-8])))(?<month>(\ (?<monthname>(Jan(uary)?|Feb(ruary)?|Ma(r(ch)?|y)|Apr(il)?|Ju((ly?)|(ne?))|Aug(ust)?|Oct(ober)?|(Sep(?=\b|t)t?|Nov|Dec)(ember)?))\ )|(?(\k<suffix>)|((?<sep>[-/.])(0?[1-9]|1[012])\k<sep>)))(?<year>(1[6-9]|[2-9]\d)\d{2}))|\b((?<year>((1[6-9])|([2-9]\d))\d\d)(?<sep>[/.-])(?<month>0?[1-9]|1[012])\k<sep>(?<day>((?<!(\k<sep>((0?[2469])|11)\k<sep>))31)|(?<!\k<sep>(0?2)\k<sep>)(29|30)|((?<=((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|(16|[2468][048]|[3579][26])00)\k<sep>(0?2)\k<sep>)29)|((0?[1-9])|(1\d)|(2[0-8]))))\b)(?:(?=\x20\d)\x20|$))?((?<time>((0?[1-9]|1[012])(:[0-5]\d){0,2}(\x20[AP]M))|([01]\d|2[0-3])(:[0-5]\d){1,2}))?)$");
                                foreach (Match m in regex3.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }
                                break;
                            case "Number":
                                string[] numbers = Regex.Split(strCompleteContent, @"\D+");
                                foreach (string value in numbers)
                                {
                                    if (!string.IsNullOrEmpty(value))
                                    {
                                        int i = int.Parse(value);
                                        //if (Enumerable.Range(Convert.ToInt32(strExpr1), Convert.ToInt32(strExpr2)).Contains(i))
                                        //{
                                        searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { i.ToString() }).ToArray();
                                        //}

                                    }
                                }
                                break;
                            case "Amount":

                                var regexAmt = new Regex(@"^(\$)?((\d{1,5})|(\d{1,3})(\,\d{3})*)(\.\d{1,2})?$");
                                foreach (Match m in regexAmt.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }
                                var regexAmt1 = new Regex(@"^\$?\d{1,2}\,\d{3}?\,\d{3}?(\.(\d{2}))$|^\$?\d{1,3}?\,\d{3}?(\.(\d{2}))$|^\$?\d{1,3}?(\.(\d{2}))$");
                                foreach (Match m in regexAmt1.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }
                                var regexAmt2 = new Regex(@"$(\d+)");
                                foreach (Match m in regexAmt2.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }
                                var regexAmt3 = new Regex(@"(\\$\\w+) ");
                                foreach (Match m in regexAmt3.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }
                                var regexAmt4 = new Regex(@"(\\$[a-zA-Z]*)");
                                foreach (Match m in regexAmt4.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }

                                Regex reg = new Regex("$");
                                Match mat = reg.Match(strCompleteContent);
                                while (mat.Success)
                                {

                                    mat = reg.Match(strCompleteContent, mat.Index + mat.Length);
                                    //searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { value.ToString() }).ToArray();
                                }
                                break;

                            case "Percent":
                                var regexPercent = new Regex(@"^\s*(\d{0,2})(\.?(\d*))?\s*\%?\s*$");
                                foreach (Match m in regexPercent.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }

                                string[] regexPercent1 = Regex.Split(strCompleteContent, @"^(\d{0,4}(?:\.\d{0,2})? | [-]\d{0,2}(?:\.\d{0,2})? )[%]{0,1}$");
                                foreach (string value in regexPercent1)
                                {
                                    if (!string.IsNullOrEmpty(value))
                                    {

                                        searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { value.ToString() }).ToArray();

                                    }
                                }

                                var regexPercent3 = new Regex(@"(\d+)%");
                                foreach (Match m in regexPercent3.Matches(strCompleteContent))
                                {
                                    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                                }

                                break;
                            default:
                                break;
                        }
                        #endregion
                        break;
                    case "RegEx":
                        #region RegExOperation

                        //var regexCustom = new Regex(@"" + searchText + "");
                        var regexCustom = new Regex('@' + searchText);
                        //var regexCustom1 = new Regex(@"\D+");
                        foreach (Match m in regexCustom.Matches(strCompleteContent))
                        {

                            searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Value.ToString() }).ToArray();

                        }
                        //string[] strRegex = Regex.Split(strCompleteContent,regexCustom.ToString());
                        //foreach (string value in strRegex)
                        //{
                        //    searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { value }).ToArray();
                        //}
                        #endregion
                        break;
                    case "Between":
                        #region BetweenOperation
                        switch (strExprOption)
                        {
                            case "String":
                                string strBetween = Between(strCompleteContent, strExpr1, strExpr2);
                                searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { strBetween.ToString() }).ToArray();
                                break;
                            case "None":
                                string strBetweenNone = Between(strCompleteContent, strExpr1, strExpr2);
                                searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { strBetweenNone.ToString() }).ToArray();
                                break;
                            default:
                                break;
                        }
                        #endregion
                        break;
                    case "After":
                        #region AfterOperation
                        switch (strExprOption)
                        {
                            case "String":
                                switch (strPosition)
                                {
                                    case "First":
                                        string wordAfterMy = GetWordAfter(searchText, strCompleteContent);

                                        searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { wordAfterMy.ToString() }).ToArray();
                                        break;
                                    case "Last":

                                        var regexAfter1 = new Regex(@"\b" + Regex.Escape(searchText) + @"\s+(\w+)");
                                        string strValueAfter = Regex.Match(strCompleteContent, regexAfter1.ToString(), RegexOptions.RightToLeft).Groups[1].Value.ToString();
                                        searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { strValueAfter }).ToArray();

                                        break;
                                    case "None":
                                        var regexAfter = new Regex(@"\b" + Regex.Escape(searchText) + @"\s+(\w+)");
                                        foreach (Match m in regexAfter.Matches(strCompleteContent))
                                        {

                                            searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Groups[1].Value.ToString() }).ToArray();

                                        }
                                        break;
                                    default:
                                        break;
                                }

                                break;
                            case "None":
                                switch (strPosition)
                                {
                                    case "First":
                                        string wordAfterMy = GetWordAfter(searchText, strCompleteContent);

                                        searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { wordAfterMy.ToString() }).ToArray();
                                        break;
                                    case "Last":

                                        var regexAfter1 = new Regex(@"\b" + Regex.Escape(searchText) + @"\s+(\w+)");
                                        string strValueAfter = Regex.Match(strCompleteContent, regexAfter1.ToString(), RegexOptions.RightToLeft).Groups[1].Value.ToString();
                                        searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { strValueAfter }).ToArray();

                                        break;
                                    case "None":
                                        var regexAfter = new Regex(@"\b" + Regex.Escape(searchText) + @"\s+(\w+)");
                                        foreach (Match m in regexAfter.Matches(strCompleteContent))
                                        {

                                            searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Groups[1].Value.ToString() }).ToArray();

                                        }
                                        break;
                                    default:
                                        break;
                                }

                                break;
                            default:
                                break;
                        }
                        #endregion
                        break;
                    case "Before":
                        #region BeforeOperation
                        switch (strExprOption)
                        {
                            case "String":
                                switch (strPosition)
                                {
                                    case "First":
                                        var regexBeforeFirst = new Regex(@"(\S+)\s+" + searchText + "");
                                        string strValueBeforeFirst = Regex.Match(strCompleteContent, regexBeforeFirst.ToString(), RegexOptions.IgnoreCase).Groups[1].Value.ToString();
                                        searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { strValueBeforeFirst }).ToArray();

                                        break;
                                    case "Last":

                                        var regexBeforeLast = new Regex(@"(\S+)\s+" + searchText + "");
                                        string strValueBeforeLast = Regex.Match(strCompleteContent, regexBeforeLast.ToString(), RegexOptions.RightToLeft).Groups[1].Value.ToString();
                                        searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { strValueBeforeLast }).ToArray();

                                        break;
                                    case "None":
                                        var regexBefore = new Regex(@"(\S+)\s+" + searchText + "");
                                        foreach (Match m in regexBefore.Matches(strCompleteContent))
                                        {

                                            searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Groups[1].Value.ToString() }).ToArray();

                                        }
                                        break;
                                    default:
                                        break;
                                }


                                break;
                            case "None":
                                switch (strPosition)
                                {
                                    case "First":
                                        var regexBeforeFirst = new Regex(@"(\S+)\s+" + searchText + "");
                                        string strValueBeforeFirst = Regex.Match(strCompleteContent, regexBeforeFirst.ToString(), RegexOptions.IgnoreCase).Groups[1].Value.ToString();
                                        searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { strValueBeforeFirst }).ToArray();

                                        break;
                                    case "Last":

                                        var regexBeforeLast = new Regex(@"(\S+)\s+" + searchText + "");
                                        string strValueBeforeLast = Regex.Match(strCompleteContent, regexBeforeLast.ToString(), RegexOptions.RightToLeft).Groups[1].Value.ToString();
                                        searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { strValueBeforeLast }).ToArray();

                                        break;
                                    case "None":
                                        var regexBefore = new Regex(@"(\S+)\s+" + searchText + "");
                                        foreach (Match m in regexBefore.Matches(strCompleteContent))
                                        {

                                            searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m.Groups[1].Value.ToString() }).ToArray();

                                        }
                                        break;
                                    default:
                                        break;
                                }


                                break;
                            default:
                                break;
                        }
                        #endregion
                        break;
                    default:
                        break;
                }
                #endregion

                #region Implement Neighbourhood
                for (int i = 0; i < searchValues.Length; i++)
                {
                    currPos = strCompleteContent.IndexOf(searchValues[i]);
                    curTxtLength = searchValues[i].Length;
                    lastValueCurTxt = curTxtLength + (strNeighbourhood * 2);
                    if (currPos >= 0)
                        searchValues[i] = strCompleteContent.Substring(currPos - strNeighbourhood, lastValueCurTxt);
                }

                #endregion

                strFieldValue = string.Join(", ", searchValues);
                ruleResult.Add(new RuleResult { RuleDescID = Convert.ToInt32(strID), ResultValues = strFieldValue });
            }
            #endregion

            #region Insert Result into DB
            APIRuleApplicationSummary objRuleSummaryEntry;// = new RuleApplicationSummary();
            if (ruleResult.Count > 0)
            {
                foreach (var ruleR in ruleResult)
                {
                    objRuleSummaryEntry = new APIRuleApplicationSummary();

                    objRuleSummaryEntry.RunID = objRuleSummary.RunID;
                    objRuleSummaryEntry.FileName = filePath;
                    objRuleSummaryEntry.EntryDate = DateTime.Now;
                    if (string.IsNullOrEmpty(ruleR.ResultValues))
                    {

                        objRuleSummaryEntry.FieldValue = "N/A";
                        objRuleSummaryEntry.IsSuccess = false;
                    }
                    else
                    {
                        objRuleSummaryEntry.FieldValue = ruleR.ResultValues;
                        objRuleSummaryEntry.IsSuccess = true;
                    }
                    objRuleSummaryEntry.FieldValue = ruleR.ResultValues;
                    objRuleSummaryEntry.RuleDescID = ruleR.RuleDescID;


                    APIRuleApplicationSummaryHandler rEHandler = new APIRuleApplicationSummaryHandler();

                    rEHandler.AddNew(objRuleSummaryEntry);

                }
            }
            else
            {
                objRuleSummaryEntry = new APIRuleApplicationSummary();

                objRuleSummaryEntry.RunID = objRuleSummary.RunID;
                objRuleSummaryEntry.FileName = filePath;
                objRuleSummaryEntry.EntryDate = DateTime.Now;
                objRuleSummaryEntry.FieldValue = "N/A";
                objRuleSummaryEntry.RuleDescID = 0;
                objRuleSummaryEntry.IsSuccess = false;

                APIRuleApplicationSummaryHandler rEHandler = new APIRuleApplicationSummaryHandler();

                rEHandler.AddNew(objRuleSummaryEntry);
            }
            #endregion
            noOfFile += 1;
            //}
            #region Entry Into Log Table
            APICallHistory objServiceHistory = new APICallHistory();
            objServiceHistory.RunID = objRuleSummary.RunID;
            objServiceHistory.Comment = "RuleEngine Service run at " + DateTime.Now + " for RuleMasterID: " + ruleElement.RuleMastID + "";
            objServiceHistory.RunTime = DateTime.Now;
            objServiceHistory.Status = "RUNNING";


            APICallHistoryHandler historyHandler = new APICallHistoryHandler();

            historyHandler.AddNew(objServiceHistory);
            #endregion

            #region GetResult

            VwAPIRuleApplicationSummaryHandler objApiSummaryHndlr = new VwAPIRuleApplicationSummaryHandler();
            dt = objApiSummaryHndlr.GetResultByRunID(objRuleSummary.RunID);
            //dt.TableName = "MyTable";
            // string str = ConvertDatatableToXML(dt);
            #endregion

            //string json = JavaScriptSerializer.Serialize(new { results = dt });
            //Response.Write(json);
            //return new JavaScriptSerializer().Serialize(dt);
        }
        return dt;
    }
   
    public static string ExtractTextFromPdf(string path)
    {
        using (PdfReader reader = new PdfReader(path))
        {
            StringBuilder text = new StringBuilder();

            for (int i = 1; i <= reader.NumberOfPages; i++)
            {
                text.Append(PdfTextExtractor.GetTextFromPage(reader, i));
            }

            return text.ToString();
        }
    }
    private string Between(string value, string a, string b)
    {
        int posA = value.IndexOf(a);
        int posB = value.LastIndexOf(b);
        if (posA == -1)
        {
            return "";
        }
        if (posB == -1)
        {
            return "";
        }
        int adjustedPosA = posA + a.Length;
        if (adjustedPosA >= posB)
        {
            return "";
        }
        return value.Substring(adjustedPosA, posB - adjustedPosA);
    }
    static string GetWordAfter(string word, string phrase)
    {
        var pattern = @"\b" + Regex.Escape(word) + @"\s+(\w+)";
        return Regex.Match(phrase, pattern, RegexOptions.IgnoreCase).Groups[1].Value;
    }
    private class RuleResult
    {
        public int RuleDescID { get; set; }
        public string ResultValues { get; set; }
    }
    

}
