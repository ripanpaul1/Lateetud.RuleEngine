using BLL;
using DAL;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    Dictionary<string, int> chartData = new Dictionary<string, int>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            LoadChart();
            
        }
    }

    private void LoadChart()
    {
        try
        {
            List<ServiceHistory> objServiceHistoryList = new List<ServiceHistory>();

            ServiceHistoryHandler historyHandler = new ServiceHistoryHandler();
            objServiceHistoryList = historyHandler.GetServiceHistoryForLastNRecords();
            foreach (var service in objServiceHistoryList)
            {
                chartData.Add(service.RunTime.ToString("MM-dd-yyyy, HH:mm"), service.NoOfFile);

            }
            cTestChart.Series["Testing"].Points.DataBind(chartData, "Key", "Value", string.Empty);
            cTestChart.Series["Testing"].ChartType = SeriesChartType.Column;
            cTestChart.Series["Testing"].ChartTypeName = "Column";
            cTestChart.Series["Testing"].Color = Color.DarkOliveGreen;

            cTestChart.ChartAreas["ChartArea1"].AxisX.MajorGrid.LineWidth = 0;

            cTestChart.ChartAreas[0].AxisX.Interval = 1;

            cTestChart.ChartAreas[0].Area3DStyle.Enable3D = false;
            DataBind();
        }
        catch
        { }
    }
}