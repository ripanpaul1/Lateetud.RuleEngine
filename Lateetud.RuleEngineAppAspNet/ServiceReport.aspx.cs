using BLL;
using DAL;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ServiceReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadLogDetails();
            MvShow.ActiveViewIndex = 0;
        }
    }
    private void LoadLogDetails()
    {
        ServiceHistoryHandler serviceHistoryHndlr = new ServiceHistoryHandler();
        List<ServiceHistory> serviceHistory = serviceHistoryHndlr.GetAllServiceHistory();
        GvRuleApplicationSummary.DataSource = serviceHistory;
        GvRuleApplicationSummary.DataBind();

    }



    protected void GvRuleApplicationSummary_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GvRuleApplicationSummary.PageIndex = e.NewPageIndex;
        LoadLogDetails();
<<<<<<< HEAD
        //DataBind();
=======
>>>>>>> pb-development
    }

    protected void lnkBtnID_Click(object sender, EventArgs e)
    {
        LinkButton lnkbtn = sender as LinkButton;
        int id =Convert.ToInt32(lnkbtn.CommandArgument);
        ViewState["RunID"] = id;
        VwRuleApplicationSummaryHandler summaryHndlr = new VwRuleApplicationSummaryHandler();
        List<VwRuleApplicationSummary> applicationSummary = new List<VwRuleApplicationSummary>();
        applicationSummary = summaryHndlr.LoadByRunID(id);
        GvRuleApplicationDetails.DataSource = applicationSummary;
        GvRuleApplicationDetails.DataBind();
        MvShow.ActiveViewIndex = 1;
    }

    protected void ibtnEditReport_Click(object sender, EventArgs e)
    {
        int Id= int.Parse(((ImageButton)sender).CommandArgument);
    
        ViewState["ID"] = Id;
        RefreshEditReportReset();
        VwRuleApplicationSummaryHandler ruleApplicationSummaryhandler = new VwRuleApplicationSummaryHandler();
        VwRuleApplicationSummary objRunIDRowChk = new VwRuleApplicationSummary();
        objRunIDRowChk = ruleApplicationSummaryhandler.LoadByID(Id);
        if (objRunIDRowChk != null)
        {
            lblFileName.Text = objRunIDRowChk.FileName;
            lblReportRuleName.Text = objRunIDRowChk.RuleName;
            txtFieldValue.Text = objRunIDRowChk.FieldValue;
        }

        mpReportEditRule.Show();
    }

    protected void RefreshEditReportReset()
    {

        txtFieldValue.Text = " ";
        lblFileName.Text = " ";
        lblReportRuleName.Text = " ";
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int Id = Convert.ToInt32(ViewState["ID"]);
        
        RuleApplicationSummaryHandler objupdateHandler = new RuleApplicationSummaryHandler();

        RuleApplicationSummary objUpdate = new RuleApplicationSummary();
        objUpdate.FieldValue = txtFieldValue.Text;
        objUpdate.ID = Id;

        objupdateHandler.UpdateFieldValue(objUpdate);

        int RunId = Convert.ToInt32(ViewState["RunID"]);
        VwRuleApplicationSummaryHandler summaryHndlr = new VwRuleApplicationSummaryHandler();
        List<VwRuleApplicationSummary> applicationSummary = new List<VwRuleApplicationSummary>();
        applicationSummary = summaryHndlr.LoadByRunID(RunId);
        GvRuleApplicationDetails.DataSource = applicationSummary;
        GvRuleApplicationDetails.DataBind();
        MvShow.ActiveViewIndex = 1;
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        LoadLogDetails();
        MvShow.ActiveViewIndex = 0;
    }

}