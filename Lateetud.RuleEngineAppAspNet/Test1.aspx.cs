using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string test = "Error description, code : -1A. higher quality, dial a number based on your current location.";

        string strTestAfter = After(test, "code :");
        string strTestBefore = Before(test, "code");
        string strBetween = Between(test, "code", "dial");
        // Test Between.
        //Response.Write(test.Between("DEFINE:", "="));
        //Response.Write(test.Between(":", "="));

        //// Test Before.
        //Response.Write(test.Before(":"));
        //Response.Write(test.Before("="));

        //// Test After.
        //Response.Write(test.After(":"));
        //Response.Write(test.After("DEFINE:"));
        //Response.Write(test.After("="));
        Response.Write(strTestAfter);
        Response.Write(strTestBefore);
        Response.Write(strBetween);
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

    private string Before(string value, string a)
    {
        int posA = value.IndexOf(a);
        if (posA == -1)
        {
            return "";
        }
        return value.Substring(0, posA);
    }

    private string After(string value, string a)
    {
        int posA = value.LastIndexOf(a);
        if (posA == -1)
        {
            return "";
        }
        int adjustedPosA = posA + a.Length;
        if (adjustedPosA >= value.Length)
        {
            return "";
        }
        return value.Substring(adjustedPosA);
    }
    //public string Between(this string value, string a, string b)
    //{
    //    int posA = value.IndexOf(a);
    //    int posB = value.LastIndexOf(b);
    //    if (posA == -1)
    //    {
    //        return "";
    //    }
    //    if (posB == -1)
    //    {
    //        return "";
    //    }
    //    int adjustedPosA = posA + a.Length;
    //    if (adjustedPosA >= posB)
    //    {
    //        return "";
    //    }
    //    return value.Substring(adjustedPosA, posB - adjustedPosA);
    //}
    //public string Before(this string value, string a)
    //{
    //    int posA = value.IndexOf(a);
    //    if (posA == -1)
    //    {
    //        return "";
    //    }
    //    return value.Substring(0, posA);
    //}
    //public string After(this string value, string a)
    //{
    //    int posA = value.LastIndexOf(a);
    //    if (posA == -1)
    //    {
    //        return "";
    //    }
    //    int adjustedPosA = posA + a.Length;
    //    if (adjustedPosA >= value.Length)
    //    {
    //        return "";
    //    }
    //    return value.Substring(adjustedPosA);
    //}
}