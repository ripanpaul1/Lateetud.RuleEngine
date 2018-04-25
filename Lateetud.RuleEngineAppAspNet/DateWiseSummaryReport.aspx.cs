using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL;
using DAL;

public partial class DateWiseSummaryReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadSummary();
        }
        rvSummary.Drillthrough += new DrillthroughEventHandler(rvSummaryDrillthroughEventHandler);
    }

    private void LoadSummary()
    {
        rvSummary.Visible = true;
        rvSummary.ProcessingMode = ProcessingMode.Local;
        rvSummary.LocalReport.ReportPath = Server.MapPath("~/Reports/DateWiseData.rdlc");
        RuleApplicationSummaryHandler ruleApplicationHndlr = new RuleApplicationSummaryHandler();
        DataTable dtSummary= ruleApplicationHndlr.GetDateWiseData();
        ReportDataSource rds = new ReportDataSource("DateWiseDataDataSet", dtSummary);
        rvSummary.LocalReport.DataSources.Clear();
        rvSummary.LocalReport.DataSources.Add(rds);
        
    }
    private void rvSummaryDrillthroughEventHandler(object sender, DrillthroughEventArgs e)
    {
        LocalReport localReport = (LocalReport)e.Report;

        RuleApplicationSummaryHandler ruleApplicationHndlr = new RuleApplicationSummaryHandler();
        DataTable dtSummary = ruleApplicationHndlr.GetDateWiseSuccessFailure(Convert.ToDateTime(lblParameter.Text));

        localReport.DataSources.Add(new ReportDataSource("DateWiseSuccessFailureDataSet",
            dtSummary));
    }
    protected void rvSummary_Drillthrough(object sender, DrillthroughEventArgs e)
    {
        ReportParameterInfoCollection DrillThroughValues =
                                e.Report.GetParameters();


        foreach (ReportParameterInfo d in DrillThroughValues)
        {
            lblParameter.Text = d.Values[0].ToString().Trim();
        }
    }
}