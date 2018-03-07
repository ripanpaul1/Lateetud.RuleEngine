using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using BLL;
using DAL;

public partial class ServiceLogReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            rvServiceLog.Visible = true;
            //set Processing Mode of Report as Local  
            rvServiceLog.ProcessingMode = ProcessingMode.Local;
            //set path of the Local report   
            rvServiceLog.LocalReport.ReportPath = Server.MapPath("~/Reports/ServiceLogReport.rdlc");
            //creating object of DataSet dsMember and filling the DataSet using SQLDataAdapter   

            
            //Providing DataSource for the Report   

            ServiceHistoryHandler serviceHistoryHndlr = new ServiceHistoryHandler();
            List<ServiceHistory> serviceHistory = serviceHistoryHndlr.GetAllServiceHistory();
            ReportDataSource rds = new ReportDataSource("ServiceLogReportDataset", serviceHistory);
            rvServiceLog.LocalReport.DataSources.Clear();
            //Add ReportDataSource   
            rvServiceLog.LocalReport.DataSources.Add(rds);
        }
    }

    protected void rvServiceLog_Drillthrough(object sender, DrillthroughEventArgs e)
    {
        rvServiceLog.Visible = true;

        rvServiceLog.ProcessingMode = ProcessingMode.Local;
        rvServiceLog.LocalReport.ReportPath = Server.MapPath("~/Reports/Summary.rdlc");
        ReportParameterInfoCollection DrillThroughValues =
                                e.Report.GetParameters();
        

        foreach (ReportParameterInfo d in DrillThroughValues)
        {
            lblParameter.Text = d.Values[0].ToString().Trim();
        }
        //LocalReport localreport = (LocalReport)e.Report;


        //set path of the Local report   
        //rvServiceLog.LocalReport.ReportPath = Server.MapPath("~/Reports/Summary.rdlc");

        RuleApplicationSummaryHandler summaryHndlr = new RuleApplicationSummaryHandler();
        List<RuleApplicationSummary> applicationSummary = summaryHndlr.LoadByRunID(Convert.ToInt32(140));

        ReportDataSource rds = new ReportDataSource("SummaryDataSet1", applicationSummary);

        //Fill dataset for Level1.rdlc
        //SqlConnection thisConnection = new SqlConnection(thisConnectionString);
        //System.Data.DataSet Level1DataSet = new System.Data.DataSet();

        //Level1SearchValue[0] = new SqlParameter("@OrderID",
        //                       lblParameter.Text.Trim());




        //ReportDataSource rds = new ReportDataSource("SummaryDataset", applicationSummary);
        rvServiceLog.LocalReport.DataSources.Clear();

        rvServiceLog.LocalReport.DataSources.Add(rds);
        rvServiceLog.LocalReport.Refresh();
       // rvServiceLog.DataBind();


        //localreport.DataSources.Clear();
        //localreport.DataSources.Add(rds);
        //localreport.Refresh();
        rvServiceLog.Visible = true;

    }
}