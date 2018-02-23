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
}