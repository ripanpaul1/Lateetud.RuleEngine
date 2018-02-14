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
        string myString = "Look, good against remotes is one thing, good against the living, that’s something else.";
        //string[] delimiters = new string[] { " " };

        //string[] words = myString.Split(delimiters, StringSplitOptions.RemoveEmptyEntries);
        //string wordAfterMy = GetWordAfter("remotes ", myString);
        string wordAfterMy = GetWordAfter("remotes is", myString);
        Response.Write(wordAfterMy);
    }
    static string GetWordAfter1(string word, string phrase)
    {
        var pattern = @"\b" + Regex.Escape(word) + @"\s+(\w+)";
        return Regex.Match(phrase, pattern, RegexOptions.IgnoreCase).Groups[1].Value;
    }

    static string GetWordAfter(string word, string phrase)
    {
        var pattern = @"\b" + Regex.Escape(word) + @"\s+(\w+)";
        return Regex.Match(phrase, pattern, RegexOptions.IgnoreCase).Groups[1].Value;
    }
}