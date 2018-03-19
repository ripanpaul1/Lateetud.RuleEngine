using BLL;
using DAL;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SummaryReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadLogDetails();
        }
        rvServiceLog.Drillthrough += new DrillthroughEventHandler(rvServiceLogDrillthroughEventHandler);
    }

    private void rvServiceLogDrillthroughEventHandler(object sender, DrillthroughEventArgs e)
    {

        LocalReport localReport = (LocalReport)e.Report;
        RuleApplicationSummaryHandler summaryHndlr = new RuleApplicationSummaryHandler();
        List<RuleApplicationSummary> applicationSummary = new List<RuleApplicationSummary>();
        applicationSummary = summaryHndlr.LoadByRunID(Convert.ToInt32(lblParameter.Text));
        localReport.DataSources.Add(new ReportDataSource("SummaryDataSet1",
            applicationSummary));

        if (applicationSummary == null)
        {
            mpReport.Show();
        }

    }

    private void LoadSummary()
    {
        rvServiceLog.Visible = true;
        rvServiceLog.ProcessingMode = ProcessingMode.Local;

        rvServiceLog.LocalReport.ReportPath = Server.MapPath("~/Reports/Summary.rdlc");
        RuleApplicationSummaryHandler summaryHndlr = new RuleApplicationSummaryHandler();
        List<RuleApplicationSummary> applicationSummary = summaryHndlr.LoadByRunID(Convert.ToInt32(140));
        ReportDataSource rds = new ReportDataSource("SummaryDataSet1", applicationSummary);

        rvServiceLog.LocalReport.DataSources.Clear();

        rvServiceLog.LocalReport.DataSources.Add(rds);
        rvServiceLog.LocalReport.Refresh();
    }
    private void LoadLogDetails()
    {
        rvServiceLog.Visible = true;
        rvServiceLog.ProcessingMode = ProcessingMode.Local;
        rvServiceLog.LocalReport.ReportPath = Server.MapPath("~/Reports/ServiceLogReport.rdlc");
        ServiceHistoryHandler serviceHistoryHndlr = new ServiceHistoryHandler();
        List<ServiceHistory> serviceHistory = serviceHistoryHndlr.GetAllServiceHistory();
        ReportDataSource rds = new ReportDataSource("ServiceLogReportDataset", serviceHistory);
        rvServiceLog.LocalReport.DataSources.Clear();
        rvServiceLog.LocalReport.DataSources.Add(rds);
    }

    protected void rvServiceLog_Drillthrough(object sender, DrillthroughEventArgs e)
    {
        ReportParameterInfoCollection DrillThroughValues =
                                e.Report.GetParameters();


        foreach (ReportParameterInfo d in DrillThroughValues)
        {
            lblParameter.Text = d.Values[0].ToString().Trim();
        }
    }

    protected void btnCancelPopup_Click(object sender, EventArgs e)
    {
        LoadLogDetails();
    }
}