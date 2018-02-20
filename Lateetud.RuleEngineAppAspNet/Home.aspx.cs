using BLL;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    Dictionary<DateTime, int> chartData = new Dictionary<DateTime, int>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            List<ServiceHistory> objServiceHistoryList = new List<ServiceHistory>();

            ServiceHistoryHandler historyHandler = new ServiceHistoryHandler();
            objServiceHistoryList = historyHandler.GetServiceHistoryForLastNRecords();
            foreach (var service in objServiceHistoryList)
            {
                chartData.Add(service.RunTime, service.NoOfFile);
                
            }
            cTestChart.Series["Testing"].Points.DataBind(chartData, "Key", "Value", string.Empty);
            cTestChart.Series["Testing"].ChartType = SeriesChartType.Pyramid;
            cTestChart.Series["Testing"].ChartTypeName = "Pyramid";


            cTestChart.ChartAreas[0].AxisX.Interval = 1;
            cTestChart.ChartAreas[0].Area3DStyle.Enable3D = false;
            DataBind();
        }
    }
}