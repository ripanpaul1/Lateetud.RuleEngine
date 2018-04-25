using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnkBtnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Default.aspx");
    }
    protected void btnAcctDetails_Click(object sender, EventArgs e)
    {
        long id = Convert.ToInt64(Session["UserID"]);
        Session["SHOWACCTID"] = id;
        Response.Redirect("UserManager.aspx");
    }
}
