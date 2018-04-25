using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string searchText = "RuleEngine Service run at 23-02-2018 16:38:39 for RuleMasterID: 1";
        string retString = null;
        retString = searchText.Substring(26, 19);

        //var regexCustom = new Regex(@"^(?:[01]?[0-9]|2[0-3]):[0-5][0-9]$");
        //string str = string.Empty;

        //foreach (Match m in regexCustom.Matches(searchText))
        //{

        //    str = m.Value.ToString();

        //}
        //var regexCustom1 = new Regex(@"^(?:0?[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$");

        //foreach (Match m in regexCustom1.Matches(searchText))
        //{

        //    str = m.Value.ToString();

        //}
        //var regexCustom2 = new Regex(@"^(?:[01][0-9]|2[0-3]):[0-5][0-9]$");

        //foreach (Match m in regexCustom2.Matches(searchText))
        //{

        //    str = m.Value.ToString();

        //}
        //var regexCustom3 = new Regex(@"^([0-9]|1[0-2]):[0-5]\d(:[0-5]\d(\:\d{1,3})?)?$");

        //foreach (Match m in regexCustom3.Matches(searchText))
        //{

        //    str = m.Value.ToString();

        //}
        //var regexCustom4 = new Regex(@"^([0-2]{1}[0-3]{1}:)?([0-5]{1}\d{1}:){1}([0-5]{1}\d{1}){1}$");

        //foreach (Match m in regexCustom4.Matches(searchText))
        //{

        //    str = m.Value.ToString();

        //}


        Response.Write(retString);

    }

}