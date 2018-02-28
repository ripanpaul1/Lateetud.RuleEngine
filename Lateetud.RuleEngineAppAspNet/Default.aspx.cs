using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;


public partial class _Default : System.Web.UI.Page
{
    UserMasterHandler userHandler = null;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSUbmit_Click(object sender, EventArgs e)
    {
        string strUser = Convert.ToString(txtUserName.Text);
        string strPasd = Convert.ToString(txtPassword.Text);
        userHandler = new UserMasterHandler();

        UserMaster usr = userHandler.GetUserByUserName(strUser);
        if (usr.Password == strPasd)
        {
            Session["IsValidUser"] = true;
            Session["User"] = usr;
            Session["UserID"] = usr.ID;
            Response.Redirect("Home.aspx");
        }
    }
}