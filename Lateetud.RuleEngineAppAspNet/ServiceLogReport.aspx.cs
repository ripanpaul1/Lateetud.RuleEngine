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
}