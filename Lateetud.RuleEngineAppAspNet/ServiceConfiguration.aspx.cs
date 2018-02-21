using BLL;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ServiceConfiguration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void gvRule_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void gvRule_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvRule.EditIndex = e.NewEditIndex;
        gvRule.DataBind();
    }

   
    protected void gvRule_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label lblId = (Label)gvRule.Rows[e.RowIndex].FindControl("lblId");
        TextBox txtName = (TextBox)gvRule.Rows[e.RowIndex].FindControl("txtValue");
        Configuration config = new Configuration();

        config.ID = Convert.ToInt32(lblId.Text);
        config.ConfigurationValue = Convert.ToString(txtName.Text);

        config.ModifiedDate = DateTime.Now;

        ConfigurationHandler configHandler = new ConfigurationHandler();

        configHandler.Update(config);
        gvRule.EditIndex = -1;
        gvRule.DataBind();
    }

    protected void ChangeStatus(object sender, ImageClickEventArgs e)
    {

    }

    protected void gvRule_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvRule.EditIndex = -1;
        gvRule.DataBind();
    }
}