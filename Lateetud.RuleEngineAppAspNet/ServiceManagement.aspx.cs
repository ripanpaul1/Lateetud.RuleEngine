using BLL;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceProcess;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ServiceManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetCurrentStatus();
            GetServiceStatus();
        }
    }

    private void GetCurrentStatus()
    {
        ServiceController svcController = new ServiceController("LateetudRuleEngineService");
        if (svcController != null)
        {
            try
            {
                lblCurrentStatus.Text = svcController.Status.ToString();
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message.ToString();
                //Response.Write(ex.Message);
            }
        }
    }

    private void GetServiceStatus()
    {
        List<ServiceHistory> objServiceHistoryList = new List<ServiceHistory>();

        ServiceHistoryHandler historyHandler = new ServiceHistoryHandler();
        objServiceHistoryList = historyHandler.StatusOfNRecords();

        List<Configuration> objConfigurationLst = new List<Configuration>();

        ConfigurationHandler configurationHandler = new ConfigurationHandler();
        objConfigurationLst = configurationHandler.GetConfigurationDetails();

        string strMode = string.Empty;
        string strInterval = string.Empty;
        string strNextRun = string.Empty;
        foreach (var historyLog in objServiceHistoryList)
        {
            if (historyLog.Status == "STOP")
            {
                lblNextRun.Text = "Currently the service(LateetudRuleEngineService) is not running. Please start the service to know the next run.";
            }
            else
            {
                if (historyLog.RunID != 0)
                {
                    DateTime retString = new DateTime();
                    retString = Convert.ToDateTime(historyLog.Comment.Substring(26, 19));

                    foreach (var config in objConfigurationLst)
                    {
                        if ((config.ConfigurationKey == "Mode") && (config.ConfigurationValue == "Interval"))//Need to transfer to ENUM
                        {
                            strMode = "Interval";

                        }
                        else
                        {
                            if (((config.ConfigurationKey == "Mode") && (config.ConfigurationValue == "Daily")))
                            {
                                strMode = "Daily";
                            }
                            else
                            {
                                if (config.ConfigurationKey == "IntervalMinutes")
                                {
                                    strInterval = Convert.ToString(config.ConfigurationValue);
                                    if (strMode == "Interval")
                                    {
                                        strNextRun = Convert.ToString(retString.AddMinutes(Convert.ToInt32(strInterval)));
                                    }

                                }
                                else
                                {
                                    if (config.ConfigurationKey == "ScheduledTime")
                                    {
                                        if (strMode == "Daily")
                                        {
                                            strNextRun = Convert.ToString(config.ConfigurationValue);
                                        }
                                    }
                                }

                            }
                        }
                    }
                }
            }
        }
        lblNextRun.Text = strNextRun;
    }
    private void StopStartService()
    {

        ServiceController svcController = new ServiceController("LateetudRuleEngineService");

        if (svcController != null)
        {
            try
            {
                if (svcController.Status == ServiceControllerStatus.Stopped)
                {

                    try
                    {
                        svcController.Start();

                    }
                    catch (Exception ex)
                    {
                        lblMsg.Text = ex.Message.ToString();
                        //Response.Write(ex.Message);
                    }

                }
                else
                {
                    try
                    {
                        svcController.Stop();
                        svcController.Start();

                    }
                    catch (Exception ex)
                    {

                        lblMsg.Text = ex.Message.ToString();
                    }

                }
            }
            catch (Exception ex)
            {

                lblMsg.Text = ex.Message.ToString();
            }
        }

        //if (svcController != null)
        //{
        //    try
        //    {
        //        svcController.Stop();
        //        svcController.WaitForStatus(ServiceControllerStatus.Stopped, TimeSpan.FromSeconds(50));
        //        svcController.Start();
        //    }
        //    catch (Exception ex)
        //    {
        //        //Todo: throw new application exeception
        //    }
        //}
    }

    protected void btnRestart_Click(object sender, EventArgs e)
    {

        StopStartService();
    }

    protected void btnStop_Click(object sender, EventArgs e)
    {
        ServiceController svcController = new ServiceController("LateetudRuleEngineService");

        if (svcController != null)
        {
            try
            {
                if (svcController.Status == ServiceControllerStatus.Running)
                {
                    try
                    {
                        svcController.Stop();


                    }
                    catch (Exception ex)
                    {

                        lblMsg.Text = ex.Message.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message.ToString();
            }
        }
    }
}