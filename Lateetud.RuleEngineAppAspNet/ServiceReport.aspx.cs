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
        LoadLogDetails();
        MultiView1.ActiveViewIndex = 0;
    }
    private void LoadLogDetails()
    {
        ServiceHistoryHandler serviceHistoryHndlr = new ServiceHistoryHandler();
        List<ServiceHistory> serviceHistory = serviceHistoryHndlr.GetAllServiceHistory();
        GridView1.DataSource = serviceHistory;
        GridView1.DataBind();
        
    }



    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        DataBind();
    }

    protected void lnkBtnRunID_Click(object sender, EventArgs e)
    {
        LinkButton lnkbtn = sender as LinkButton;
        string argumnt = lnkbtn.CommandArgument.ToString();
        RuleApplicationSummaryHandler summaryHndlr = new RuleApplicationSummaryHandler();
        List<RuleApplicationSummary> applicationSummary = new List<RuleApplicationSummary>();
        applicationSummary = summaryHndlr.LoadByRunID(Convert.ToInt32(argumnt));
        GridView2.DataSource = applicationSummary;
        GridView2.DataBind();
        MultiView1.ActiveViewIndex = 1;
    }

   
}