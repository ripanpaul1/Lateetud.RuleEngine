using BLL;
using DAL;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class APIReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadLogDetails();
            MvAPIShow.ActiveViewIndex = 0;
        }
    }
    private void LoadLogDetails()
    {
        APICallHistoryHandler apiCallHistoryHndlr = new APICallHistoryHandler();
        List<APICallHistory> apiCallHistory = apiCallHistoryHndlr.GetAllApiHistory();
        GvAPIRuleApplicationSummary.DataSource = apiCallHistory;
        GvAPIRuleApplicationSummary.DataBind();

    }

    protected void GvAPIRuleApplicationSummary_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GvAPIRuleApplicationSummary.PageIndex = e.NewPageIndex;
        LoadLogDetails();

    }

    protected void lnkBtnAPIRunID_Click(object sender, EventArgs e)
    {
        LinkButton lnkbtn = sender as LinkButton;
        int id = Convert.ToInt32(lnkbtn.CommandArgument);
        ViewState["RunID"] = id;
        VwAPIRuleApplicationSummaryHandler apiSummaryHndlr = new VwAPIRuleApplicationSummaryHandler();
        List<VwAPIRuleApplicationSummary> apiSummary = new List<VwAPIRuleApplicationSummary>();
        apiSummary = apiSummaryHndlr.LoadByRunIDAPI(id);
        GvAPIRuleApplicationDetails.DataSource = apiSummary;
        GvAPIRuleApplicationDetails.DataBind();
        MvAPIShow.ActiveViewIndex = 1;
    }

    protected void ibtnAPIEdit_Click(object sender, EventArgs e)
    {
        int Id = int.Parse(((ImageButton)sender).CommandArgument);

        ViewState["ID"] = Id;
        RefreshEditAPIReportReset();
        VwAPIRuleApplicationSummaryHandler apiSummaryhandler = new VwAPIRuleApplicationSummaryHandler();
        VwAPIRuleApplicationSummary objRunIDRowChk = new VwAPIRuleApplicationSummary();
        objRunIDRowChk = apiSummaryhandler.APIReportLoadByID(Id);
        if (objRunIDRowChk != null)
        {
            lblAPIFileName.Text = objRunIDRowChk.FileName;
            lblAPIReportRuleName.Text = objRunIDRowChk.RuleName;
            txtAPIFieldValue.Text = objRunIDRowChk.FieldValue;
        }

        mpAPIReportEditRule.Show();
    }

    protected void RefreshEditAPIReportReset()
    {

        txtAPIFieldValue.Text = " ";
        lblAPIFileName.Text = " ";
        txtAPIFieldValue.Text = " ";
    }

    protected void btnAPIUpdate_Click(object sender, EventArgs e)
    {
        int Id = Convert.ToInt32(ViewState["ID"]);

        VwAPIRuleApplicationSummaryHandler objApiUpdateHandler = new VwAPIRuleApplicationSummaryHandler();

        VwAPIRuleApplicationSummary objApiUpdate = new VwAPIRuleApplicationSummary();
        objApiUpdate.FieldValue = txtAPIFieldValue.Text;
        objApiUpdate.ID = Id;

        objApiUpdateHandler.UpdateAPIFieldValue(objApiUpdate);

        int RunId = Convert.ToInt32(ViewState["RunID"]);
        VwAPIRuleApplicationSummaryHandler apiSummaryHndlr = new VwAPIRuleApplicationSummaryHandler();
        List<VwAPIRuleApplicationSummary> apiSummary = new List<VwAPIRuleApplicationSummary>();
        apiSummary = apiSummaryHndlr.LoadByRunIDAPI(RunId);
        GvAPIRuleApplicationDetails.DataSource = apiSummary;
        GvAPIRuleApplicationDetails.DataBind();
        MvAPIShow.ActiveViewIndex = 1;
    }

    protected void btnAPIBack_Click(object sender, EventArgs e)
    {
        LoadLogDetails();
        MvAPIShow.ActiveViewIndex = 0;
    }

}