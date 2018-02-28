using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;

public partial class UserManager : System.Web.UI.Page
{
    //UserTypeMasterHandler userTypeMasterHnd = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["SHOWACCTID"] != null)
            {
                int Id = Convert.ToInt32(Session["SHOWACCTID"]);
                ShowDetails(Id);

            }
            //BindDLL();
            txtPassword.Attributes.Add("value", txtPassword.Text);
        }
    }
    protected void ChangeView(object sender, EventArgs e)
    {
        mvUserManager.ActiveViewIndex = Convert.ToInt32(((LinkButton)sender).CommandArgument);
        if (mvUserManager.ActiveViewIndex == 1)
        {
            ResetAll();
            gvUser.DataBind();
        }
        if (mvUserManager.ActiveViewIndex == 0)
        {
            ResetAll();
            ViewState["mode"] = "ADD";
            txtPassword.Attributes.Add("value", txtPassword.Text);

            //lblMsg.Text = "Adding admin user";
        }

    }
    private void ResetAll()
    {

        txtFirstName.Text = string.Empty;
        txtPassword.Text = string.Empty;
        //ddlUserType.ClearSelection();
        txtEmail.Text = string.Empty;
        chkActive.Checked = false;
        txtLastName.Text = string.Empty;
        txtUserName.Text = string.Empty;

    }
    //private void BindDLL()
    //{
    //    //userTypeMasterHnd = new UserTypeMasterHandler();
    //    ddlUserType.DataSource = userTypeMasterHnd.GetUserTypeList();
    //    ddlUserType.DataTextField = "UserType";
    //    ddlUserType.DataValueField = "ID";
    //    ddlUserType.DataBind();
    //    ddlUserType.Items.Insert(0, new ListItem("--Select--", "0"));

    //}
    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvUser.PageSize = int.Parse(ddlPageSize.SelectedValue);
        gvUser.DataBind();
    }
    protected void ChangeStatus(object sender, ImageClickEventArgs e)
    {
        string Status = Convert.ToString(((ImageButton)sender).CommandArgument);

        int Id = int.Parse(((ImageButton)sender).CommandName);
        UserMaster objUser = new UserMaster();
        UserMasterHandler userMasterHandler = new UserMasterHandler();

        if (Status == "True")
        {
            objUser.ID = Id;
            objUser.IsActive = false;


            userMasterHandler.UpdateActiveInActiveUser(objUser);
        }
        else
        {
            objUser.IsActive = true;

            objUser.ID = Id;
            userMasterHandler.UpdateActiveInActiveUser(objUser);
        }
        gvUser.DataBind();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string strMode = ViewState["mode"].ToString();


        if (strMode == "ADD")
        {
            UserMaster objUser = new UserMaster();
            objUser.FirstName = Convert.ToString(txtFirstName.Text);
            objUser.LastName = Convert.ToString(txtLastName.Text);
            objUser.UserName = Convert.ToString(txtUserName.Text);
            objUser.EmailId = Convert.ToString(txtEmail.Text);
            objUser.Password = Convert.ToString(txtPassword.Text);
            objUser.IsActive = chkActive.Checked;
            //objUser.UserTypeId = Convert.ToInt32(ddlUserType.SelectedValue);
            objUser.CreatedDate = DateTime.Now;
            objUser.ModifiedDate = DateTime.Now;
            objUser.LoginDatetime = DateTime.Now;
            objUser.LastLoginDatetime = DateTime.Now;

            UserMasterHandler userMasterHandler = new UserMasterHandler();

            userMasterHandler.AddNewUser(objUser);
            mvUserManager.ActiveViewIndex = 1;
        }
        else
        {
            if (strMode == "EDIT" && Session["UserID"] != null)
            {
                int userId = Convert.ToInt32(ViewState["UserID"]);
                UserMaster objUser = new UserMaster();
                objUser.ID = userId;
                objUser.FirstName = Convert.ToString(txtFirstName.Text);
                objUser.LastName = Convert.ToString(txtLastName.Text);
                objUser.UserName = Convert.ToString(txtUserName.Text);
                objUser.EmailId = Convert.ToString(txtEmail.Text);
                objUser.Password = Convert.ToString(txtPassword.Text);
                objUser.IsActive = chkActive.Checked;
                //objUser.UserTypeId = Convert.ToInt32(ddlUserType.SelectedValue);
                objUser.CreatedDate = DateTime.Now;
                objUser.ModifiedDate = DateTime.Now;
                objUser.LoginDatetime = DateTime.Now;
                objUser.LastLoginDatetime = DateTime.Now;

                UserMasterHandler userMasterHandler = new UserMasterHandler();

                userMasterHandler.UpdateUser(objUser);
                mvUserManager.ActiveViewIndex = 1;
                txtPassword.Attributes.Add("value", txtPassword.Text);
            }
        }
    }

    protected void ibtnEdit_Click(object sender, ImageClickEventArgs e)
    {
        int Id = Convert.ToInt32(((ImageButton)sender).CommandArgument);
        Session["UserID"] = Id;
        ResetAll();
        ShowDetails(Id);
    }
    private void ShowDetails(int Id)
    {
        UserMasterHandler objUserMstrH = new UserMasterHandler();
        UserMaster objUser = objUserMstrH.GetUserDetails(Id);
        txtFirstName.Text = Convert.ToString(objUser.FirstName);
        txtLastName.Text = Convert.ToString(objUser.LastName);
        txtEmail.Text = Convert.ToString(objUser.EmailId);
        txtUserName.Text = Convert.ToString(objUser.UserName);
        txtPassword.Text = Convert.ToString(objUser.Password);
        //ddlUserType.SelectedValue = Convert.ToString(objUser.UserTypeId);
        chkActive.Checked = objUser.IsActive;
        mvUserManager.ActiveViewIndex = 0;
        ViewState["mode"] = "EDIT";
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Session["SHOWACCTID"] != null)
        {
            Response.Redirect("Home.aspx");
        }

        ResetAll();
        mvUserManager.ActiveViewIndex = 1;
    }
}