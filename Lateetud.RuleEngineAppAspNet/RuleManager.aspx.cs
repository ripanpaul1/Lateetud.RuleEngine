﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using iTextSharp_Playground.Content;
using System.Text.RegularExpressions;
using System.Text;
using System.Web.UI.HtmlControls;
using BLL;
using System.Globalization;
using System.Web.UI.DataVisualization.Charting;
using Microsoft.Office.Interop.Word;
using WordApplication = Microsoft.Office.Interop.Word.Application;
using System.IO;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.parser;
using iTextSharp.text;
using HtmlAgilityPack;
using iTextSharp.text.html.simpleparser;

public partial class RuleManager : System.Web.UI.Page
{
    Dictionary<string, int> chartData = new Dictionary<string, int>();
   
    StringBuilder strListofSynonyms;// = new StringBuilder();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ScriptManager.RegisterStartupScript(this.Page,GetType(), "popIt", "showHide();", true);
            mvMain.SetActiveView(vwShow);
            lblActionMessage.Text = "Showing Existing Rules";
            BindDLL();
            ddlSynonym.Style.SelectBoxWidth = 140;// Added dynamically to solve design rendering issue
            ddlSynonym.Style.DropDownBoxBoxWidth = 140;// Added dynamically to solve design rendering issue
        }
    }
    private void BindDLL()
    {
        RuleMastHandler ruleMastHndlr = new RuleMastHandler();
        ddlRuleSet.DataSource = ruleMastHndlr.GetRuleMastDetails();
        ddlRuleSet.DataTextField = "RuleName";
        ddlRuleSet.DataValueField = "ID";
        ddlRuleSet.DataBind();
        ddlRuleSet.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Rules--", "0"));

        ddlRuleType.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select RuleType", "0"));
        ddlSplit.SelectedValue = "Lines";
        //ddlSplit.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Lines", "0"));
        ddlDictionary.Items.Insert(0, new System.Web.UI.WebControls.ListItem("General Insurane", "0"));
        ddlLines.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Lines", "0"));
        //ddlOperator.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Any", "0"));
        ddlOperator.SelectedValue = "Any";
    }

    protected void lnkAddNew_Click(object sender, EventArgs e)
    {
        ViewState["Mode"] = "ADD";
        mvMain.SetActiveView(vwAdd);
        lblActionMessage.Text = "Add New Rules";
        ScriptManager.RegisterStartupScript(this.Page, GetType(), "popIt", "showHide();", true);
    }

    protected void lnkView_Click(object sender, EventArgs e)
    {
        mvMain.SetActiveView(vwShow);
        lblActionMessage.Text = "Showing Existing Rules";
    }

    protected void btnShow_Click(object sender, ImageClickEventArgs e)
    {
        if (rbtDocType.SelectedValue == "URL")
        {
            #region Show Result From URL
            try
            {
               

                #region Fetch Data from Web
                var getHtmlWeb = new HtmlWeb();
                var strPageUrl = Convert.ToString(txtUrl.Text);
                var document = getHtmlWeb.Load(strPageUrl);
                string strCompleteContent = document.DocumentNode.InnerHtml;
                string strHighlightedContent = string.Empty;

                #endregion

                #region veriable declaration

                string searchText = Convert.ToString(txtContext.Text);
                int strNeighbourhood = Convert.ToInt32(txtNeighbourhood.Text);
                string strExprOption = Convert.ToString(rbExprOptions.SelectedItem.Text);
                string strOperator = Convert.ToString(ddlOperator.SelectedItem.Value);
                string strPosition = Convert.ToString(rbtPosition.SelectedItem.Value);
                string strSynonym = string.IsNullOrEmpty(String.Join(",", ddlSynonym.Items.Cast<System.Web.UI.WebControls.ListItem>()
                        .Where(li => li.Selected)
                        .ToList())) ? "All" : (ddlSynonym.Items.Cast<System.Web.UI.WebControls.ListItem>()
                        .Where(li => li.Selected)
                        .ToList().Count == ddlSynonym.Items.Cast<System.Web.UI.WebControls.ListItem>().ToList().Count) ? "All" :
                         String.Join(",", ddlSynonym.Items.Cast<System.Web.UI.WebControls.ListItem>()
                        .Where(li => li.Selected).Select(x => string.Format("{0}", x.Value))
                        .ToList());
                int curTxtLength = 0;
                int lastValueCurTxt = 0;
                string strCurrText = string.Empty;
                int currPos = 0;

                string[] searchValues = new string[0];
                string strExpr1 = Convert.ToString(txtExpr1st.Text);
                string strExpr2 = Convert.ToString(txtExpr2nd.Text);
                string strExprText = string.Empty;

                #endregion
                if ((!chkIgnoreContext.Checked) || (string.IsNullOrEmpty(searchText)))
                    if ((strOperator != "RegEx"))
                    {
                        searchValues = searchText.Split(',');
                    }
                #region Synonym Operation
                if (chkSynonym.Checked == true)              //Modified by Ananya
                {
                    foreach (string m in strSynonym.Split(','))
                    {
                        searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m }).ToArray();

                    }
                }
                #endregion
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
                switch (strOperator)
                {
                    case "After":
                        for (int i = 0; i < searchValues.Length; i++)
                        {
                            currPos = strCompleteContent.IndexOf(searchValues[i]);
                            curTxtLength = searchValues[i].Length;
                            lastValueCurTxt = curTxtLength + (strNeighbourhood);
                            if (currPos >= 0)
                                searchValues[i] = strCompleteContent.Substring(currPos, lastValueCurTxt);
                        }
                        break;
                    case "Before":
                        for (int i = 0; i < searchValues.Length; i++)
                        {
                            currPos = strCompleteContent.IndexOf(searchValues[i]);
                            curTxtLength = searchValues[i].Length;
                            lastValueCurTxt = curTxtLength + (strNeighbourhood);
                            if (currPos >= 0)
                                searchValues[i] = strCompleteContent.Substring(currPos - strNeighbourhood, lastValueCurTxt);
                        }
                        break;
                    default:
                        for (int i = 0; i < searchValues.Length; i++)
                        {
                            currPos = strCompleteContent.IndexOf(searchValues[i]);
                            curTxtLength = searchValues[i].Length;
                            lastValueCurTxt = curTxtLength + (strNeighbourhood * 2);
                            if (currPos >= 0)
                                searchValues[i] = strCompleteContent.Substring(currPos - strNeighbourhood, lastValueCurTxt);
                        }
                        break;
                }

                #endregion
                lblFieldValue.Text = string.Join(", ", searchValues);

                //strHighlightedContent = HighlightKeyWords(strCompleteContent, Convert.ToString(lblFieldValue.Text), "yellow", true);// Heighlight matched item
                //string newFileName = "URL_" + DateTime.Now.Ticks + ".pdf";
                //GeneratePDF(newFileName, strHighlightedContent);
                ViewState["OldFile"] = strPageUrl;
                ViewState["NewFile"] = strPageUrl;//"TempUpload/" + newFileName;
                ViewState["FileName"] = strPageUrl; //newFileName;
                
                //hdnPDFSrc.Value = "TempUpload/" + newFileName + "";
                
                DataBind();
                //mpShow.Show();
                
            }
            catch(Exception ex)
            {
                lblMsg.Text = ex.Message.ToString();
            }
            #endregion
        }
        else
        {
            #region Save File to Temp Folder

            if (fupFile.HasFile)
            {
                #region Save File
                string oldFile = Server.MapPath("~/TempUpload/" + Path.GetFileName(fupFile.PostedFile.FileName));

                fupFile.SaveAs(oldFile);

                string newFileName = Path.GetFileNameWithoutExtension(fupFile.PostedFile.FileName) + "_" + DateTime.Now.Ticks + ".pdf";
                string newFile = Server.MapPath("~/TempUpload/" + newFileName);
                #endregion

                #region veriable declaration
                string strCompleteContent = ExtractTextFromPdf(oldFile);
                string searchText = Convert.ToString(txtContext.Text);
                int strNeighbourhood = Convert.ToInt32(txtNeighbourhood.Text);
                string strExprOption = Convert.ToString(rbExprOptions.SelectedItem.Text);
                string strOperator = Convert.ToString(ddlOperator.SelectedItem.Value);
                string strPosition = Convert.ToString(rbtPosition.SelectedItem.Value);
                string strSynonym = string.IsNullOrEmpty(String.Join(",", ddlSynonym.Items.Cast<System.Web.UI.WebControls.ListItem>()
                        .Where(li => li.Selected)
                        .ToList())) ? "All" : (ddlSynonym.Items.Cast<System.Web.UI.WebControls.ListItem>()
                        .Where(li => li.Selected)
                        .ToList().Count == ddlSynonym.Items.Cast<System.Web.UI.WebControls.ListItem>().ToList().Count) ? "All" :
                         String.Join(",", ddlSynonym.Items.Cast<System.Web.UI.WebControls.ListItem>()
                        .Where(li => li.Selected).Select(x => string.Format("{0}", x.Value))
                        .ToList());
                int curTxtLength = 0;
                int lastValueCurTxt = 0;
                string strCurrText = string.Empty;
                int currPos = 0;

                string[] searchValues = new string[0];
                string strExpr1 = Convert.ToString(txtExpr1st.Text);
                string strExpr2 = Convert.ToString(txtExpr2nd.Text);
                string strExprText = string.Empty;

                #endregion
                if ((!chkIgnoreContext.Checked) || (string.IsNullOrEmpty(searchText)))
                    if ((strOperator != "RegEx"))
                    {
                        searchValues = searchText.Split(',');
                    }
                #region Synonym Operation
                if (chkSynonym.Checked == true)              //Modified by Ananya
                {
                    foreach (string m in strSynonym.Split(','))
                    {
                        searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m }).ToArray();

                    }
                }
                #endregion
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
                switch (strOperator)
                {
                    case "After":
                        for (int i = 0; i < searchValues.Length; i++)
                        {
                            currPos = strCompleteContent.IndexOf(searchValues[i]);
                            curTxtLength = searchValues[i].Length;
                            lastValueCurTxt = curTxtLength + (strNeighbourhood);
                            if (currPos >= 0)
                                searchValues[i] = strCompleteContent.Substring(currPos, lastValueCurTxt);
                        }
                        break;
                    case "Before":
                        for (int i = 0; i < searchValues.Length; i++)
                        {
                            currPos = strCompleteContent.IndexOf(searchValues[i]);
                            curTxtLength = searchValues[i].Length;
                            lastValueCurTxt = curTxtLength + (strNeighbourhood);
                            if (currPos >= 0)
                                searchValues[i] = strCompleteContent.Substring(currPos - strNeighbourhood, lastValueCurTxt);
                        }
                        break;
                    default:
                        for (int i = 0; i < searchValues.Length; i++)
                        {
                            currPos = strCompleteContent.IndexOf(searchValues[i]);
                            curTxtLength = searchValues[i].Length;
                            lastValueCurTxt = curTxtLength + (strNeighbourhood * 2);
                            if (currPos >= 0)
                                searchValues[i] = strCompleteContent.Substring(currPos - strNeighbourhood, lastValueCurTxt);
                        }
                        break;
                }

                #endregion
                lblFieldValue.Text = string.Join(", ", searchValues);

                highlightPDFAnnotation(oldFile, newFile, 1, searchValues); // Heighlight matched item
                ViewState["OldFile"] = "TempUpload/" + fupFile.PostedFile.FileName;
                ViewState["NewFile"] = "TempUpload/" + newFileName;
                ViewState["FileName"] = fupFile.PostedFile.FileName;

                //highlightPDFAnnotation(oldFile, newFile, 1, strSearchTexh);
                hdnPDFSrc.Value = "TempUpload/" + newFileName + "";
            }
            else
            {
                string strMode = "";
                if (ViewState["Mode"] == null)
                {
                    ViewState["Mode"] = "ADD";
                    strMode = "ADD";
                }
                else
                {
                    strMode = ViewState["Mode"].ToString();
                }
                if (strMode == "EDIT")
                {

                    hdnPDFSrc.Value = ViewState["NewFile"].ToString();
                }
                else
                {
                    #region Save File
                    string strFileName = Convert.ToString(ViewState["FileName"]);
                    string oldFile = Server.MapPath("~/TempUpload/" + strFileName);
                    //fupFile.SaveAs(oldFile);

                    string newFileName = Path.GetFileNameWithoutExtension(oldFile) + "_" + DateTime.Now.Ticks + ".pdf";
                    string newFile = Server.MapPath("~/TempUpload/" + newFileName);
                    #endregion

                    #region veriable declaration
                    string strCompleteContent = ExtractTextFromPdf(oldFile);
                    string searchText = Convert.ToString(txtContext.Text);
                    int strNeighbourhood = Convert.ToInt32(txtNeighbourhood.Text);
                    string strExprOption = Convert.ToString(rbExprOptions.SelectedItem.Text);
                    string strOperator = Convert.ToString(ddlOperator.SelectedItem.Value);
                    string strPosition = Convert.ToString(rbtPosition.SelectedItem.Value);
                    string strSynonym = string.IsNullOrEmpty(String.Join(",", ddlSynonym.Items.Cast<System.Web.UI.WebControls.ListItem>()
                        .Where(li => li.Selected)
                        .ToList())) ? "All" : (ddlSynonym.Items.Cast<System.Web.UI.WebControls.ListItem>()
                        .Where(li => li.Selected)
                        .ToList().Count == ddlSynonym.Items.Cast<System.Web.UI.WebControls.ListItem>().ToList().Count) ? "All" :
                         String.Join(",", ddlSynonym.Items.Cast<System.Web.UI.WebControls.ListItem>()
                        .Where(li => li.Selected).Select(x => string.Format("{0}", x.Value))
                        .ToList());
                    int curTxtLength = 0;
                    int lastValueCurTxt = 0;
                    string strCurrText = string.Empty;
                    int currPos = 0;

                    string[] searchValues = new string[0];
                    string strExpr1 = Convert.ToString(txtExpr1st.Text);
                    string strExpr2 = Convert.ToString(txtExpr2nd.Text);
                    string strExprText = string.Empty;

                    #endregion
                    if ((!chkIgnoreContext.Checked) || (string.IsNullOrEmpty(searchText)))
                        if ((strOperator != "RegEx"))
                        {
                            searchValues = searchText.Split(',');
                        }
                    #region Synonym Operation
                    if (chkSynonym.Checked)
                    {
                        foreach (string m in strSynonym.Split(','))
                        {
                            searchValues = (searchValues ?? Enumerable.Empty<string>()).Concat(new[] { m }).ToArray();
                        }
                    }
                    #endregion
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
                    switch (strOperator)
                    {
                        case "After":
                            for (int i = 0; i < searchValues.Length; i++)
                            {
                                currPos = strCompleteContent.IndexOf(searchValues[i]);
                                curTxtLength = searchValues[i].Length;
                                lastValueCurTxt = curTxtLength + (strNeighbourhood);
                                if (currPos >= 0)
                                    searchValues[i] = strCompleteContent.Substring(currPos, lastValueCurTxt);
                            }
                            break;
                        case "Before":
                            for (int i = 0; i < searchValues.Length; i++)
                            {
                                currPos = strCompleteContent.IndexOf(searchValues[i]);
                                curTxtLength = searchValues[i].Length;
                                lastValueCurTxt = curTxtLength + (strNeighbourhood);
                                if (currPos >= 0)
                                    searchValues[i] = strCompleteContent.Substring(currPos - strNeighbourhood, lastValueCurTxt);
                            }
                            break;
                        default:
                            for (int i = 0; i < searchValues.Length; i++)
                            {
                                currPos = strCompleteContent.IndexOf(searchValues[i]);
                                curTxtLength = searchValues[i].Length;
                                lastValueCurTxt = curTxtLength + (strNeighbourhood * 2);
                                if (currPos >= 0)
                                    searchValues[i] = strCompleteContent.Substring(currPos - strNeighbourhood, lastValueCurTxt);
                            }
                            break;
                    }

                    #endregion
                    //#region Implement Neighbourhood
                    //for (int i = 0; i < searchValues.Length; i++)
                    //{
                    //    currPos = strCompleteContent.IndexOf(searchValues[i]);
                    //    curTxtLength = searchValues[i].Length;
                    //    lastValueCurTxt = curTxtLength + (strNeighbourhood * 2);
                    //    if (currPos >= 0)
                    //        searchValues[i] = strCompleteContent.Substring(currPos - strNeighbourhood, lastValueCurTxt);
                    //}

                    //#endregion
                    lblFieldValue.Text = string.Join(", ", searchValues);

                    highlightPDFAnnotation(oldFile, newFile, 1, searchValues); // Heighlight matched item
                    ViewState["OldFile"] = "TempUpload/" + strFileName;
                    ViewState["NewFile"] = "TempUpload/" + newFileName;
                    ViewState["FileName"] = strFileName;

                    //highlightPDFAnnotation(oldFile, newFile, 1, strSearchTexh);
                    hdnPDFSrc.Value = "TempUpload/" + newFileName + "";
                }
            }

            cTestChart.Series["Testing"].Points.DataBind(chartData, "Key", "Value", string.Empty);
            cTestChart.Series["Testing"].ChartType = SeriesChartType.StackedColumn;
            cTestChart.Series["Testing"].ChartTypeName = "StackedColumn";
            cTestChart.ChartAreas[0].AxisX.Interval = 1;
            cTestChart.ChartAreas[0].Area3DStyle.Enable3D = false;
            DataBind();
            mpShow.Show();

            #endregion
        }

    }
    public static string HighlightKeyWords(string text, string keywords, string cssClass, bool fullMatch)
    {
        if (text == String.Empty || keywords == String.Empty || cssClass == String.Empty)
            return text;
        var words = keywords.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
        if (!fullMatch)
            return words.Select(word => word.Trim()).Aggregate(text,
                         (current, pattern) =>
                         Regex.Replace(current,
                                         pattern,
                                           string.Format("<span style=\"background-color:{0}\">{1}</span>",
                                           cssClass,
                                           "$0"),
                                           RegexOptions.IgnoreCase));
        return words.Select(word => "\\b" + word.Trim() + "\\b")
                    .Aggregate(text, (current, pattern) =>
                               Regex.Replace(current,
                               pattern,
                                 string.Format("<span style=\"background-color:{0}\">{1}</span>",
                                 cssClass,
                                 "$0"),
                                 RegexOptions.IgnoreCase));

    }
    private void GeneratePDF(string FileName, string Content)
    {
        iTextSharp.text.Document pdfDoc = new iTextSharp.text.Document();

        PdfWriter writer = PdfWriter.GetInstance(pdfDoc, new FileStream(Server.MapPath("TempUpload/" + FileName + ".pdf"), FileMode.OpenOrCreate));

        pdfDoc.Open();

        HTMLWorker htmlWorker = new HTMLWorker(pdfDoc);

        htmlWorker.Parse(new StringReader(Content));

        pdfDoc.Close();

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
    static string GetWordAfter1(string word, string phrase)
    {
        var pattern = @"\b" + Regex.Escape(word) + @"\s+(\w+)";
        return Regex.Match(phrase, pattern, RegexOptions.IgnoreCase).Groups[3].Value;
    }
    private void highlightPDFAnnotation(string outputFile, string highLightFile, int pageno, string[] splitText)
    {

        PdfReader reader = new PdfReader(outputFile);
        iTextSharp.text.pdf.PdfContentByte canvas;
        using (FileStream fs = new FileStream(highLightFile, FileMode.Create, FileAccess.Write, FileShare.None))
        {
            using (PdfStamper stamper = new PdfStamper(reader, fs))
            {

                myLocationTextExtractionStrategy strategy = new myLocationTextExtractionStrategy();
                strategy.UndercontentHorizontalScaling = 100;


                string currentText = PdfTextExtractor.GetTextFromPage(reader, pageno, strategy);
                for (int i = 0; i < splitText.Length; i++)
                {
                    List<iTextSharp.text.Rectangle> MatchesFound = strategy.GetTextLocations(splitText[i].Trim(), StringComparison.CurrentCultureIgnoreCase);

                    #region Data Addition for Chart
                    if ((chartData.Count > 0) && (!chartData.ContainsKey(splitText[i].ToString())))
                    {
                        chartData.Add(splitText[i].ToString(), MatchesFound.Count);
                    }
                    else
                    {
                        if (chartData.Count == 0)
                        {
                            chartData.Add(splitText[i].ToString(), MatchesFound.Count);
                        }
                    }
                    #endregion
                    foreach (iTextSharp.text.Rectangle rect in MatchesFound)
                    {
                        float[] quad = { rect.Left - 3.0f, rect.Bottom, rect.Right, rect.Bottom, rect.Left - 3.0f, rect.Top + 1.0f, rect.Right, rect.Top + 1.0f };
                        //Create hightlight
                        PdfAnnotation highlight = PdfAnnotation.CreateMarkup(stamper.Writer, rect, null, PdfAnnotation.MARKUP_HIGHLIGHT, quad);
                        //Set the color
                        highlight.Color = BaseColor.YELLOW;

                        PdfAppearance appearance = PdfAppearance.CreateAppearance(stamper.Writer, rect.Width, rect.Height);
                        PdfGState state = new PdfGState();
                        state.BlendMode = new PdfName("Multiply");
                        appearance.SetGState(state);
                        appearance.Rectangle(0, 0, rect.Width, rect.Height);
                        appearance.SetColorFill(BaseColor.YELLOW);
                        appearance.Fill();

                        highlight.SetAppearance(PdfAnnotation.APPEARANCE_NORMAL, appearance);

                        //Add the annotation
                        stamper.AddAnnotation(highlight, pageno);
                    }
                }
            }
        }
        reader.Close();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strMode = ViewState["Mode"].ToString();
        string strSelectedSynonym = string.IsNullOrEmpty(String.Join(",", ddlSynonym.Items.Cast<System.Web.UI.WebControls.ListItem>()
                    .Where(li => li.Selected)
                    .ToList())) ? "All" : (ddlSynonym.Items.Cast<System.Web.UI.WebControls.ListItem>()
            .Where(li => li.Selected)
            .ToList().Count == ddlSynonym.Items.Cast<System.Web.UI.WebControls.ListItem>().ToList().Count) ? "All" :
                    String.Join(",", ddlSynonym.Items.Cast<System.Web.UI.WebControls.ListItem>()
                    .Where(li => li.Selected).Select(x => string.Format("{0}", x.Value))
                    .ToList());
        string[] arrAllSynonyms = ddlSynonym.Items.Cast<object>().Select(o => o.ToString()).ToArray();
        if (strMode == "ADD")
        {
            RuleDesc objRule = new RuleDesc();
            objRule.RuleMastID = Convert.ToInt32(ddlRuleSet.SelectedValue);
            objRule.RuleName = Convert.ToString(txtRule.Text);
            objRule.SplitAs = Convert.ToString(ddlSplit.SelectedValue);
            objRule.Dictionary = Convert.ToString(ddlDictionary.SelectedValue);
            objRule.OriginalDocumentName = Convert.ToString(ViewState["OldFile"]);
            objRule.ConvertedDocumentName = Convert.ToString(ViewState["NewFile"]);
            objRule.EntryDate = DateTime.Now;
            objRule.ModifiedDate = DateTime.Now;
            objRule.IsActive = true;
            objRule.NeighbourhoodCount = Convert.ToInt32(txtNeighbourhood.Text);
            objRule.ContextWord = Convert.ToString(txtContext.Text);
            objRule.Operator = Convert.ToString(ddlOperator.SelectedValue);
            objRule.FieldName = Convert.ToString(txtFieldName.Text);
            objRule.FieldValue = Convert.ToString(lblFieldValue.Text);
            objRule.Expression1 = string.Empty;
            objRule.Expression2 = string.Empty;
            objRule.UploadedFile = Convert.ToString(ViewState["FileName"]);
            objRule.IsIgnoreKeyword = chkIgnoreContext.Checked;
            objRule.FieldPosition = Convert.ToString(rbtPosition.SelectedValue);
            objRule.IsCheckSynonyms = chkSynonym.Checked;
            objRule.DocType =Convert.ToString(rbtDocType.SelectedValue);
            if (strSelectedSynonym == "All")
            {

                objRule.Synonyms = string.Join(",", arrAllSynonyms);
            }
            else
                objRule.Synonyms = strSelectedSynonym;
            objRule.AllSynonyms = string.Join(",", arrAllSynonyms);
            objRule.ExpressionContext = rbExprOptions.SelectedValue.ToString();

            RuleDescHandler ruleDescHandler = new RuleDescHandler();
            ruleDescHandler.AddNew(objRule);
            mvMain.ActiveViewIndex = 1;
            //gvRule.DataBind();
        }
        else
        {
            if (strMode == "EDIT")
            {
                int Id = Convert.ToInt32(ViewState["RuleDescID"]);
                RuleDesc objRule = new RuleDesc();
                objRule.ID = Id;
                objRule.RuleMastID = Convert.ToInt32(ddlRuleSet.SelectedValue);
                objRule.RuleName = Convert.ToString(txtRule.Text);
                objRule.SplitAs = Convert.ToString(ddlSplit.SelectedValue);
                objRule.Dictionary = Convert.ToString(ddlDictionary.SelectedValue);
                objRule.OriginalDocumentName = Convert.ToString(ViewState["OldFile"]);
                objRule.ConvertedDocumentName = Convert.ToString(ViewState["NewFile"]);
                objRule.EntryDate = DateTime.Now;
                objRule.ModifiedDate = DateTime.Now;
                objRule.IsActive = true;
                objRule.NeighbourhoodCount = Convert.ToInt32(txtNeighbourhood.Text);
                objRule.ContextWord = Convert.ToString(txtContext.Text);
                objRule.Operator = Convert.ToString(ddlOperator.SelectedValue);
                objRule.FieldName = Convert.ToString(txtFieldName.Text);
                objRule.FieldValue = Convert.ToString(lblFieldValue.Text);
                objRule.Expression1 = string.Empty;
                objRule.Expression2 = string.Empty;
                objRule.UploadedFile = Convert.ToString(ViewState["FileName"]);
                objRule.IsIgnoreKeyword = chkIgnoreContext.Checked;
                objRule.FieldPosition = Convert.ToString(rbtPosition.SelectedValue);
                objRule.IsCheckSynonyms = chkSynonym.Checked;
                objRule.Synonyms = strSelectedSynonym;
                objRule.AllSynonyms = string.Join(",", arrAllSynonyms);
                objRule.ExpressionContext = rbExprOptions.SelectedValue.ToString();
                objRule.DocType = Convert.ToString(rbtDocType.SelectedValue);
                RuleDescHandler ruleDescHandler = new RuleDescHandler();
                ruleDescHandler.Update(objRule);
                //  gvRule.DataBind();
                mvMain.ActiveViewIndex = 1;
            }
        }
        //DataBind();
        gvRule.DataBind();
    }

    protected void ibtnEdit_Click(object sender, ImageClickEventArgs e)
    {
        int Id = int.Parse(((ImageButton)sender).CommandArgument);
        ViewState["RuleDescID"] = Id;
        ViewState["Mode"] = "EDIT";

        RuleDescHandler objRuleDescH = new RuleDescHandler();

        RuleDesc objRule = objRuleDescH.GetRuleDescDetailsByID(Id);

        txtContext.Text = Convert.ToString(objRule.ContextWord);
        txtExpr1st.Text = Convert.ToString(objRule.Expression1);
        txtExpr2nd.Text = Convert.ToString(objRule.Expression2);
        txtFieldName.Text = Convert.ToString(objRule.FieldName);
        lblFieldValue.Text = Convert.ToString(objRule.FieldValue);
        txtNeighbourhood.Text = Convert.ToString(objRule.NeighbourhoodCount);
        txtRule.Text = Convert.ToString(objRule.RuleName);
        ddlDictionary.SelectedValue = Convert.ToString(objRule.Dictionary);
        //ddlFiledType.SelectedValue = Convert.ToString();
        //ddlLines.SelectedValue = Convert.ToString();
        ddlOperator.SelectedValue = Convert.ToString(objRule.Operator);
        ddlRuleSet.SelectedValue = Convert.ToString(objRule.RuleMastID);
        //ddlRuleType.SelectedValue = Convert.ToString();
        ddlSplit.SelectedValue = Convert.ToString(objRule.SplitAs);
        //rbtPosition.c = Convert.ToString(objRule.FieldPosition);
        rbtPosition.Items.FindByText(Convert.ToString(objRule.FieldPosition)).Selected = true;
        chkIgnoreContext.Checked = Convert.ToBoolean(objRule.IsIgnoreKeyword);
        ViewState["NewFile"] = Convert.ToString(objRule.ConvertedDocumentName);
        ViewState["FileName"] = Convert.ToString(objRule.UploadedFile);
        ViewState["OldFile"] = Convert.ToString(objRule.OriginalDocumentName);
        rbExprOptions.Items.FindByValue(Convert.ToString(objRule.ExpressionContext)).Selected = true;
        chkSynonym.Checked = Convert.ToBoolean(objRule.IsCheckSynonyms);
        rbtDocType.SelectedValue = Convert.ToString(objRule.DocType);
        if (objRule.AllSynonyms != null && objRule.Synonyms != null)
        {
            ddlSynonym.DataSource = objRule.AllSynonyms.Split(',');
            ddlSynonym.DataBind();
            //if(objRule.AllSynonyms==objRule.Synonyms)
            //{
            //    ddlSynonym.Items.FindByText("All").Selected = true;
            //}
            //else
            //{
            foreach (string synonym in objRule.Synonyms.Split(','))
            {
                ddlSynonym.Items.FindByText(synonym).Selected = true;
            }
            //}
        }
        mvMain.ActiveViewIndex = 0;
    }

    protected void ChangeStatus(object sender, ImageClickEventArgs e)
    {
        string Status = Convert.ToString(((ImageButton)sender).CommandArgument);

        int Id = int.Parse(((ImageButton)sender).CommandName);
        RuleDesc objRule = new RuleDesc();
        RuleDescHandler ruleDescHandler = new RuleDescHandler();

        if (Status == "True")
        {
            objRule.ID = Id;
            objRule.IsActive = false;


            ruleDescHandler.UpdateActiveInActiveRule(objRule);
        }
        else
        {
            objRule.IsActive = true;

            objRule.ID = Id;
            ruleDescHandler.UpdateActiveInActiveRule(objRule);
        }
        gvRule.DataBind();
    }

    protected void btnSaveRule_Click(object sender, EventArgs e)
    {
        string strMode = ViewState["RULESETMode"].ToString();


        if (strMode == "ADDRULESET")
        {
            RuleMast objRule = new RuleMast();

            objRule.RuleName = Convert.ToString(txtRuleName.Text);

            objRule.CreateDate = DateTime.Now;
            objRule.ModifiedDate = DateTime.Now;
            objRule.IsActive = true;

            RuleMastHandler ruleMastHandler = new RuleMastHandler();
            ruleMastHandler.AddNew(objRule);

            mvMain.ActiveViewIndex = 1;
        }
        else
        {
            if (strMode == "EDITRULESET")
            {
                int Id = Convert.ToInt32(ViewState["RuleMastID"]);
                RuleMast objRule = new RuleMast();
                objRule.ID = Id;
                objRule.RuleName = Convert.ToString(txtRuleName.Text);

                objRule.ModifiedDate = DateTime.Now;
                objRule.IsActive = true;

                RuleMastHandler ruleMasterHandler = new RuleMastHandler();

                ruleMasterHandler.Update(objRule);
                mvMain.ActiveViewIndex = 1;

            }
        }
    }

    protected void btnCreateRuleSet_Click(object sender, EventArgs e)
    {
        ViewState["RULESETMode"] = "ADDRULESET";
        mpCreateRule.Show();
    }

    protected void btnEditRuleSet_Click(object sender, EventArgs e)
    {
        ViewState["RULESETMode"] = "EDITRULESET";
        int Id = Convert.ToInt32(ddlRuleSet.SelectedValue);
        ViewState["RuleMastID"] = Id;
        RuleMastHandler objRuleMastH = new RuleMastHandler();

        RuleMast objRule = objRuleMastH.GetRuleMastDetailsByID(Id);

        txtRuleName.Text = Convert.ToString(objRule.RuleName);
        chkActive.Checked = objRule.IsActive;

        mpCreateRule.Show();
    }

    protected void rbExprOptions_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strRbOption = Convert.ToString(rbExprOptions.SelectedValue);
        switch (strRbOption)
        {
            case "Date":
                ccExpr1st.Enabled = true;
                ccExpr2nd.Enabled = true;
                break;
            case "Number":
                ccExpr1st.Enabled = false;
                ccExpr2nd.Enabled = false;
                break;
            case "Amount":
                ccExpr1st.Enabled = false;
                ccExpr2nd.Enabled = false;
                break;
            case "None":
                ccExpr1st.Enabled = false;
                ccExpr2nd.Enabled = false;
                break;
            default:
                ccExpr1st.Enabled = false;
                ccExpr2nd.Enabled = false;
                break;
        }

    }

    //private void LoadChart(Dictionary<string, int> chartData)
    //{

    //    cTestChart.Series["Testing"].Points.DataBind(chartData, "Key", "Value", string.Empty);
    //}

    protected void chkSynonym_CheckedChanged(object sender, EventArgs e)
    {
        bool isCheckSynonyms = true;
        string operation = Convert.ToString(ddlOperator.SelectedValue);
        switch (operation)
        {
            case "After":
                if (chkIgnoreContext.Checked)
                    isCheckSynonyms = false;
                break;
            case "Before":
                if (chkIgnoreContext.Checked)
                    isCheckSynonyms = false;
                break;
            default:
                isCheckSynonyms = true;
                break;

        }
        if (isCheckSynonyms && chkSynonym.Checked)
        {
            Microsoft.Office.Interop.Word.Application appWord;      // word application var
            object objNull = null;      // word object method calls require
                                        // references to objects... create
                                        // object for null and
            object objFalse = false;      // false entries and language

            object objLanguage = Microsoft.Office.Interop.Word.WdLanguageID.wdEnglishUS; // or appropritate lang!

            try
            {
                // Try opening Word app
                appWord = new Microsoft.Office.Interop.Word.Application();
            }
            catch (System.Exception exc)
            {
                // could not open word... show error message and return
                lblMsg.Text = exc.Message.ToString();

                return;
            }

            // clear synonym listbox lbSynonym
            //litSyn.Text = "";
            ddlSynonym.Items.Clear();
            //lbSynonym.Items.Clear();
            string strSearchWord = txtContext.Text;
            // now call get_SynonymInfo to get SynonymInfo structure for
            // word entered in TextBox tbWord
            Microsoft.Office.Interop.Word.SynonymInfo si =
                     appWord.get_SynonymInfo(strSearchWord, ref (objLanguage));


            // first find out how many meanings were found for word
            int iMeanings = (int)si.MeaningCount;

            if (si.MeaningCount > 0)
            {
                // one or more meanings were found... loop over each
                // (notice SynonymInfo.MeaningList is type System.ArrayList!)
                var strMeanings = si.MeaningList as Array;
                string[] arrSynonymsList = new string[0];
                strListofSynonyms = new StringBuilder();
                if (strMeanings != null)
                    foreach (var strMeaning in strMeanings)
                    {
                        // get Synonym List for each meaning... note that
                        // get_SynonymList takes an object ref, thus we
                        // must create objMeaning object
                        //if (strSearchWord.CompareTo(strMeaning.ToString()) == 0)
                        //{
                        var objMeaning = strMeaning;

                        var aSynonyms = si.SynonymList[objMeaning];
                        var strSynonyms = aSynonyms as Array;
                        //arrSynonymsList = strSynonyms.OfType<object>().Select(o => o.ToString()).ToArray();
                        if (strSynonyms != null)
                        {
                            //strListofSynonyms.Clear();
                            //strListofSynonyms = strListofSynonyms.Append(string.Join(",", arrSynonymsList));
                            ddlSynonym.DataSource = strSynonyms;
                            ddlSynonym.DataBind();
                        }
                        //foreach (string strSynonym in strSynonyms)
                        //{
                        //    // loop over each synonym in ArrayList
                        //    // and add to lbSynonym ListBox
                        //    lbSynonym.Items.Add(strSynonym);
                        //}
                    }
                //}
            }
            else
            {
                // no meanings/synonyms found... set ListBox value to "NONE"
                ddlSynonym.Texts.SelectBoxCaption = "None";
                ddlSynonym.Items.Add("NONE");
            }
        }
        else
        {
            ddlSynonym.Items.Clear();
        }
    }

    protected void ddlDictionary_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}