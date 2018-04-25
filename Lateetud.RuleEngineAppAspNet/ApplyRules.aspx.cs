using BLL;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class ApplyRules : System.Web.UI.Page
{
    private bool isFolderSelect = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            mvMain.SetActiveView(vwShow);
            BindDLL();
        }
    }

    protected void btnApply_Click(object sender, EventArgs e)
    {
        string strMode = ViewState["Mode"].ToString();
        if (strMode == "ADD")
        {
            string strRules = string.IsNullOrEmpty(String.Join(",", ddlRule.Items.Cast<System.Web.UI.WebControls.ListItem>()
                    .Where(li => li.Selected)
                    .ToList())) ? "All" : (ddlRule.Items.Cast<System.Web.UI.WebControls.ListItem>()
            .Where(li => li.Selected)
            .ToList().Count == ddlRule.Items.Cast<System.Web.UI.WebControls.ListItem>().ToList().Count) ? "All" :
                    String.Join(",", ddlRule.Items.Cast<System.Web.UI.WebControls.ListItem>()
                    .Where(li => li.Selected).Select(x => string.Format("{0}", x.Value))
                    .ToList());
            RuleEngineDetails objRuleEngine = new RuleEngineDetails();

            objRuleEngine.RuleMastID = Convert.ToInt32(ddlRuleSet.SelectedValue);
            objRuleEngine.RuleDescID = Convert.ToString(strRules);
            objRuleEngine.UserID = 0;//Need to change once login page complete
            objRuleEngine.FolderPath = @"E:\Work\RuleEngine\";
            objRuleEngine.ModifiedDate = DateTime.Now;
            objRuleEngine.CreateDate = DateTime.Now;
            objRuleEngine.IsActive = true;

            RuleEngineDetailsHandler rEHandler = new RuleEngineDetailsHandler();

            rEHandler.AddNew(objRuleEngine);
            //mvMain.ActiveViewIndex = 1;
        }
    }
    private void BindDLL()
    {
        RuleMastHandler ruleMastHndlr = new RuleMastHandler();
        ddlRuleSet.DataSource = ruleMastHndlr.GetRuleMastDetails();
        ddlRuleSet.DataTextField = "RuleName";
        ddlRuleSet.DataValueField = "ID";
        ddlRuleSet.DataBind();
        ddlRuleSet.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Rules--", "0"));


    }

    protected void ddlRuleSet_SelectedIndexChanged(object sender, EventArgs e)
    {
        RuleDescHandler ruleDescHndlr = new RuleDescHandler();
        ddlRule.DataSource = ruleDescHndlr.GetRuleDetailsByRuleMastID(Convert.ToInt32(ddlRuleSet.SelectedValue));
        ddlRule.DataTextField = "RuleName";
        ddlRule.DataValueField = "ID";
        ddlRule.DataBind();
        ddlRule.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Rules--", "0"));
    }

    protected void lnkAddNew_Click(object sender, EventArgs e)
    {
        ViewState["Mode"] = "ADD";
        mvMain.SetActiveView(vwAdd);
    }

    protected void lnkView_Click(object sender, EventArgs e)
    {
        mvMain.SetActiveView(vwShow);
    }

    protected void ChangeStatus(object sender, ImageClickEventArgs e)
    {

    }

    protected void ibtnEdit_Click(object sender, ImageClickEventArgs e)
    {
        int ruleMastId = int.Parse(((ImageButton)sender).CommandArgument);
        ddlRuleSet.SelectedValue = Convert.ToString(ruleMastId);
        ddlRuleSet.Enabled = false;

        RuleDescHandler ruleDescHndlr = new RuleDescHandler();
        ddlRule.DataSource = ruleDescHndlr.GetRuleDetailsByRuleMastID(Convert.ToInt32(ddlRuleSet.SelectedValue));
        ddlRule.DataTextField = "RuleName";
        ddlRule.DataValueField = "ID";
        ddlRule.DataBind();

        RuleEngineDetailsHandler ruleEngDtlsHndlr = new RuleEngineDetailsHandler();
        List<RuleEngineDetails> ruleEngDtls = ruleEngDtlsHndlr.GetRuleDetailsByRuleMastID(Convert.ToInt32(ddlRuleSet.SelectedValue));


        foreach (RuleEngineDetails ruleElement in ruleEngDtls)
        {
            ddlRule.SelectedValue = Convert.ToString(ruleElement.RuleDescID);
        }
        ddlRule.DataBind();
        string strRuleFilteredText = string.IsNullOrEmpty(String.Join(",", ddlRule.Items.Cast<ListItem>()
   .Where(li => li.Selected)
   .ToList())) ? "All" : (ddlRule.Items.Cast<ListItem>()
   .Where(li => li.Selected)
   .ToList().Count == ddlRule.Items.Cast<ListItem>().ToList().Count) ? "All" : "Filtered";
       
        ddlRule.Texts.SelectBoxCaption = strRuleFilteredText;
        mpRule.Show();
    }

    protected void btnSaveRule_Click(object sender, EventArgs e)
    {
        string strRules = string.IsNullOrEmpty(String.Join(",", ddlRule.Items.Cast<System.Web.UI.WebControls.ListItem>()
                    .Where(li => li.Selected)
                    .ToList())) ? "All" : (ddlRule.Items.Cast<System.Web.UI.WebControls.ListItem>()
            .Where(li => li.Selected)
            .ToList().Count == ddlRule.Items.Cast<System.Web.UI.WebControls.ListItem>().ToList().Count) ? "All" :
                    String.Join(",", ddlRule.Items.Cast<System.Web.UI.WebControls.ListItem>()
                    .Where(li => li.Selected).Select(x => string.Format("{0}", x.Value))
                    .ToList());
        RuleEngineDetails objRuleEngine = new RuleEngineDetails();

        objRuleEngine.RuleMastID = Convert.ToInt32(ddlRuleSet.SelectedValue);
        objRuleEngine.RuleDescID = Convert.ToString(strRules);
        objRuleEngine.UserID = 1;//Need to change once login page complete
        objRuleEngine.FolderPath = @"E:\Document\RuleEngineDoc";//Convert.ToString(lblFolderName.Text);
        objRuleEngine.ModifiedDate = DateTime.Now;
        objRuleEngine.CreateDate = DateTime.Now;
        objRuleEngine.IsActive = true;

        RuleEngineDetailsHandler rEHandler = new RuleEngineDetailsHandler();

        rEHandler.UpdateorInsert(objRuleEngine);
    }

    protected void btnCancelRule_Click(object sender, EventArgs e)
    {

    }

    protected void btnBrowseFolder_Click(object sender, EventArgs e)
    {
        Thread thdSyncRead = new Thread(new ThreadStart(openfolder));
        thdSyncRead.SetApartmentState(ApartmentState.STA);

        thdSyncRead.Start();
    }
    public void openfolder()
    {

        FolderBrowserDialog fbd = new FolderBrowserDialog();
        fbd.ShowNewFolderButton = false;
        DialogResult result = fbd.ShowDialog();
        if (fbd.ShowDialog() == DialogResult.OK)
        {
            lblFolderName.Text = fbd.SelectedPath;
            isFolderSelect = true;
        }
        else
        {
            lblFolderName.Text = "No folder selected";
            isFolderSelect = false;
        }

    }
}