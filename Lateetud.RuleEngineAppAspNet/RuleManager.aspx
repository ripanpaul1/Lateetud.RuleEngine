<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="RuleManager.aspx.cs" Inherits="RuleManager" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="DropDownCheckBoxes" Namespace="Saplin.Controls" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
            color: #0066FF;
        }

        .auto-style3 {
        }

        .auto-style4 {
            text-decoration: underline;
        }

        .auto-style5 {
            height: 28px;
        }

        .clearfix:after {
            content: ".";
            display: block;
            clear: both;
            visibility: hidden;
            line-height: 0;
            height: 0;
        }

        .clearfix {
            display: inline-block;
        }
    </style>

    <cc1:ToolkitScriptManager runat="server">
    </cc1:ToolkitScriptManager>
    <table width="100%">
        <tr>
            <td style="text-align: left">
                <asp:Label ID="lblActionMessage" runat="server" CssClass="auto-style1"></asp:Label>
            </td>
            <td style="text-align: right">
                <asp:LinkButton ID="lnkAddNew" runat="server" OnClick="lnkAddNew_Click">Add New</asp:LinkButton>&nbsp;
                <asp:LinkButton ID="lnkView" runat="server" OnClick="lnkView_Click">View</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:MultiView ID="mvMain" runat="server" ActiveViewIndex="0">

                    <asp:View ID="vwAdd" runat="server">
                        <%--<h3 class="auto-style1">Add New Rules </h3>--%>
                        <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>

                        <table width="100%" border="1">
                            <tr>
                                <td class="auto-style3" width="25%"><strong>Rule Set</strong></td>
                                <td colspan="3" style="width: 50%">
                                    <%--<asp:TextBox ID="txtRuleset" runat="server"></asp:TextBox>--%>&nbsp;
                                            <asp:DropDownList ID="ddlRuleSet" runat="server"></asp:DropDownList>
                                    <asp:LinkButton ID="btnCreateRuleSet" runat="server" OnClick="btnCreateRuleSet_Click">Create</asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="btnEditRuleSet" runat="server" OnClick="btnEditRuleSet_Click">Edit</asp:LinkButton>
                                    &nbsp;
                                            <asp:LinkButton ID="btnDeleteRuleSet" runat="server">Delete</asp:LinkButton>

                                </td>
                            </tr>


                            <tr>
                                <td class="auto-style3"><strong>Rule</strong></td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtRule" runat="server"></asp:TextBox>&nbsp;
                              <asp:DropDownList ID="ddlRuleType" runat="server">
                                  <asp:ListItem>Find</asp:ListItem>
                                  <asp:ListItem>Extraction </asp:ListItem>
                                  <asp:ListItem>Validation</asp:ListItem>
                              </asp:DropDownList>
                                </td>
                            </tr>


                            <tr>
                                <td class="auto-style4" colspan="4" style="background-color: #FFFFCC"><strong>Define Rule</strong></td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:RadioButtonList ID="rbtDocType" runat="server" RepeatDirection="Horizontal" Font-Bold="True">
                                        <asp:ListItem Selected="True" Value="DOC">Upload Document</asp:ListItem>
                                        <asp:ListItem Value="URL">Provide URL</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td class="auto-style5">
                                    <asp:FileUpload ID="fupFile" runat="server" />&nbsp;<asp:TextBox ID="txtUrl" runat="server"></asp:TextBox>
                                </td>
                                <td colspan="2" class="auto-style5">
                                    <asp:ImageButton ID="btnShow" runat="server" ImageUrl="~/images/view2.png" Width="30px" OnClick="btnShow_Click" />

                                </td>
                            </tr>


                            <tr>
                                <td class="auto-style3"><strong>Split As</strong></td>
                                <td>
                                    <asp:DropDownList ID="ddlSplit" runat="server">
                                        <asp:ListItem>Lines </asp:ListItem>
                                        <asp:ListItem>Words </asp:ListItem>
                                        <asp:ListItem>Sections</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td><strong>Choose Dictionary</strong></td>
                                <td>
                                    <asp:DropDownList ID="ddlDictionary" runat="server" OnSelectedIndexChanged="ddlDictionary_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>


                            <tr>
                                <td class="auto-style3">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style3" colspan="4">
                                    <asp:Panel ID="pnlQuery" runat="server">
                                        <table width="100%" border="1" style="margin-top: 0px">
                                            <tr>
                                                <td style="background-color: #CCFFCC"><strong>Operator</strong><br />
                                                    <asp:DropDownList ID="ddlOperator" runat="server">
                                                        <asp:ListItem>Any</asp:ListItem>
                                                        <asp:ListItem>Any of</asp:ListItem>
                                                        <asp:ListItem>Anything but</asp:ListItem>
                                                        <%--<asp:ListItem>Anything</asp:ListItem>--%>
                                                        <asp:ListItem>End of line</asp:ListItem>
                                                        <%--<asp:ListItem>Find</asp:ListItem>
                                                                <asp:ListItem>Line break</asp:ListItem>
                                                                <asp:ListItem>Maybe</asp:ListItem>--%>
                                                        <asp:ListItem>Range</asp:ListItem>
                                                        <%-- <asp:ListItem>Something</asp:ListItem>
                                                                <asp:ListItem>Something but</asp:ListItem>--%>
                                                        <asp:ListItem>Tab</asp:ListItem>
                                                        <asp:ListItem Value="RegEx">Regular Expression</asp:ListItem>
                                                        <asp:ListItem>Between</asp:ListItem>
                                                        <asp:ListItem>After</asp:ListItem>
                                                        <asp:ListItem>Before</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="background-color: #CCFFCC"><strong>Position</strong>
                                                    <asp:RadioButtonList ID="rbtPosition" runat="server" RepeatDirection="Horizontal">
                                                        <asp:ListItem Selected="True">None</asp:ListItem>
                                                        <asp:ListItem>First</asp:ListItem>
                                                        <asp:ListItem>Last</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                                <td style="background-color: #CCFFCC"><strong>Expressions</strong>
                                                    <asp:UpdatePanel ID="upnlExpr" runat="server">
                                                        <ContentTemplate>
                                                            <asp:RadioButtonList ID="rbExprOptions" AutoPostBack="true" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbExprOptions_SelectedIndexChanged">
                                                                <asp:ListItem Selected="True">None</asp:ListItem>
                                                                <asp:ListItem>Date</asp:ListItem>
                                                                <asp:ListItem>Number</asp:ListItem>
                                                                <asp:ListItem>Amount</asp:ListItem>
                                                                <asp:ListItem>Percent</asp:ListItem>
                                                                <asp:ListItem>String</asp:ListItem>
                                                            </asp:RadioButtonList>
                                                            <asp:TextBox ID="txtExpr1st" runat="server"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="ccExpr1st" PopupButtonID="txtExpr1st" runat="server" TargetControlID="txtExpr1st" Format="MM/dd/yyyy"></cc1:CalendarExtender>

                                                            &nbsp;and/or
                                                            <asp:TextBox ID="txtExpr2nd" runat="server"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="ccExpr2nd" PopupButtonID="txtExpr2nd" runat="server" TargetControlID="txtExpr2nd" Format="MM/dd/yyyy"></cc1:CalendarExtender>

                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                </td>
                                                <td style="background-color: #CCFFCC">
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                            <asp:CheckBox ID="chkSynonym" runat="server" Text="Check Synonyms" AutoPostBack="true" OnCheckedChanged="chkSynonym_CheckedChanged" />
                                                            <br />
                                                            <asp:DropDownCheckBoxes ID="ddlSynonym" runat="server" Width="140" AddJQueryReference="True" UseButtons="false" UseSelectAllNode="True">

                                                                <%--<Style SelectBoxWidth="140" DropDownBoxBoxWidth="140" />--%>
                                                                <Texts SelectBoxCaption="All" SelectAllNode="All" />
                                                            </asp:DropDownCheckBoxes>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                                        <ProgressTemplate>
                                                            <div class="modal">
                                                                <div class="center">
                                                                    <table>
                                                                        <tr>
                                                                            <td>Please wait..</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <img alt="" src="images/loader.gif" /></td>
                                                                        </tr>
                                                                    </table>

                                                                </div>
                                                            </div>
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="background-color: #CCFFCC" colspan="2"><strong>Context Word</strong>
                                                    <asp:TextBox ID="txtContext" runat="server" Width="480"></asp:TextBox>
                                                    &nbsp;
                                                            <asp:CheckBox ID="chkIgnoreContext" runat="server" Text="Ignore Keyword" />
                                                </td>
                                                <td style="background-color: #CCFFCC"><strong>Neighbourhood Count</strong>
                                                    <asp:TextBox ID="txtNeighbourhood" runat="server" Text="0"></asp:TextBox>
                                                </td>
                                                <td style="background-color: #CCFFCC">
                                                    <asp:DropDownList ID="ddlLines" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>

                                    </asp:Panel>

                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3" style="background-color: #99CCFF"><strong>Field Name</strong>:<asp:TextBox ID="txtFieldName" runat="server"></asp:TextBox></td>
                                <td class="auto-style3" style="background-color: #99CCFF" colspan="3"><strong>Field Value</strong>:<asp:Label ID="lblFieldValue" runat="server"></asp:Label></td>
                                <%--   <td class="auto-style3" colspan="2" style="background-color: #99CCFF">
                                            <strong>Field Type</strong>:<asp:DropDownList ID="ddlFiledType" runat="server">
                                                <asp:ListItem>Numeric</asp:ListItem>
                                                <asp:ListItem>Date</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>--%>
                            </tr>


                            <tr>
                                <td class="auto-style3" colspan="4">
                                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" BackColor="#0066FF" Font-Bold="True" ForeColor="White" />
                                    &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" BackColor="#0066FF" Font-Bold="True" ForeColor="White" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3" colspan="4">
                                    <asp:Chart ID="cTestChart" runat="server" Height="200px" Width="1300px">
                                        <Series>
                                            <asp:Series Name="Testing" IsValueShownAsLabel="true">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1">
                                                <Area3DStyle />
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </td>
                            </tr>

                        </table>

                    </asp:View>
                    <asp:View ID="vwShow" runat="server">
                        <asp:GridView ID="gvRule" runat="server" DataSourceID="odsRule" Font-Size="11px"
                            Font-Names="Verdana" Width="100%"
                            BorderColor="#8EC2E8" BorderStyle="Solid"
                            BorderWidth="1px" AllowPaging="True"
                            AllowSorting="True" AutoGenerateColumns="False"
                            CellPadding="1" CellSpacing="1"
                            GridLines="Both">
                            <EmptyDataRowStyle BorderStyle="Solid" HorizontalAlign="Center" Font-Bold="True"></EmptyDataRowStyle>
                            <Columns>
                                <asp:BoundField DataField="RuleName" SortExpression="RuleName" HeaderText="Rule Set">
                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                </asp:BoundField>

                                <asp:BoundField DataField="RuleDescName" SortExpression="RuleDescName" HeaderText="Rule">
                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="UploadedFile" SortExpression="UploadedFile" HeaderText="Document Name">
                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                </asp:BoundField>

                                <asp:BoundField DataField="FieldName" SortExpression="FieldName" HeaderText="FieldName"
                                    HtmlEncode="False">
                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="FieldValue" SortExpression="FieldValue" HeaderText="FieldValue"
                                    HtmlEncode="False">
                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ibtnActive" OnClick="ChangeStatus" runat="server" ImageUrl='<% # Convert.ToBoolean(Eval("IsActive")) ? "~/images/active.gif" : "~/images/inactive.gif" %>' CommandArgument='<% # Eval("IsActive") %>'
                                            CommandName='<% # Eval("ID") %>' ToolTip='<% # Convert.ToBoolean(Eval("IsActive")) ? "Click Here To Deactivate" : "Click Here To Activate" %>'></asp:ImageButton>
                                        <asp:ImageButton ID="ibtnEdit" runat="server" ImageUrl="~/images/details_icon2.gif"
                                            CommandArgument='<% # Eval("ID") %>' ToolTip="View Details & Edit" OnClick="ibtnEdit_Click" />

                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                            <EmptyDataTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/img/sorry_icon.gif" /><br />
                                <span style="color: red">Sorry! No Records Found.</span>
                            </EmptyDataTemplate>
                            <PagerStyle HorizontalAlign="Right"></PagerStyle>
                            <HeaderStyle BackColor="#317DB1" BorderStyle="Solid" ForeColor="White" BorderWidth="1px"
                                BorderColor="#8EC2E8"></HeaderStyle>
                            <AlternatingRowStyle BackColor="#F9F9F9"></AlternatingRowStyle>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="odsRule" runat="server" SelectMethod="GetRuleDetails" TypeName="BLL.VwRuleDescHandler"></asp:ObjectDataSource>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlDetails" runat="server" Width="600px" BorderWidth="1px" BorderStyle="Solid"
                BorderColor="gray" BackColor="#F0F0F0">
                <table style="font-weight: bold; font-size: 12px; color: white; font-family: Verdana; background-color: gray"
                    width="100%">
                    <tr>
                        <td style="width: 95%" align="left">
                            <asp:Label ID="lblQM" runat="server" CssClass="moveCursor" Width="100%">&nbsp;</asp:Label>
                        </td>
                        <td style="width: 5%" align="right">

                            <asp:ImageButton ID="ibtnCloseDetails" runat="server" ToolTip="close" ImageUrl="~/images/close.gif"></asp:ImageButton>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:Panel ID="pnlInner" Width="600px" runat="server" Height="600px">

                                <table id="tblWrite" runat="server" height="100%" width="100%">
                                    <tr>
                                        <td style="width: 100%; vertical-align: top;" colspan="2">
                                            <%--    <div id="dvContent" runat="server" height="100%" width="100%"></div>--%>
                                            <asp:HiddenField ID="hdnPDFSrc" runat="server" Value="TempUpload/DataRoboticsdocs.pdf" />
                                            <object id="objPDF" data='<%=hdnPDFSrc.Value %>' type="application/pdf" height="100%" width="100%">
                                            </object>

                                            <%--<iframe id="frPDF" runat="server"  height="100%" width="100%"></iframe>--%>
                                            <%-- <asp:Literal ID="ltEmbed" runat="server" />--%>
                                        </td>
                                    </tr>

                                    <tr height="20px">
                                        <td style="width: 10%"></td>
                                        <td style="width: 90%; vertical-align: text-bottom; padding: 10px; text-align: right;">
                                            <asp:Button ID="btnOK" runat="server" ForeColor="White"
                                                Font-Size="12px" Font-Names="Arial" Font-Bold="True" CausesValidation="true"
                                                Width="60px" ToolTip="click to cancel" Text="OK" BorderWidth="0px" BorderStyle="Solid"
                                                BorderColor="#8EC2E8" BackColor="Gray" ValidationGroup="Add"></asp:Button>&nbsp;</td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Button Style="display: none" ID="btnShowModalPopup" runat="server"></asp:Button>
            <cc1:ModalPopupExtender ID="mpShow" runat="server" TargetControlID="btnShowModalPopup"
                PopupDragHandleControlID="lblQM" PopupControlID="pnlDetails" BackgroundCssClass="popUpStyle">
            </cc1:ModalPopupExtender>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Panel ID="pnlDetailsCreateRule" runat="server" Width="300px" BorderWidth="1px" BorderStyle="Solid"
        BorderColor="gray" BackColor="#F0F0F0">
        <table style="font-weight: bold; font-size: 12px; color: white; font-family: Verdana; background-color: gray"
            width="100%">
            <tr>
                <td style="width: 95%" align="left">
                    <asp:Label ID="lblHdrCreateRule" runat="server" CssClass="moveCursor" Width="100%">&nbsp;</asp:Label>
                </td>
                <td style="width: 5%" align="right">

                    <asp:ImageButton ID="ibtnCloseCreateRule" runat="server" ToolTip="close" ImageUrl="~/images/close.gif"></asp:ImageButton>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Panel ID="pnlInnerCreateRule" Width="300px" runat="server" Height="120px">

                        <table id="tblWriteCreateRule" runat="server" height="100%" width="100%">
                            <tr>
                                <td style="width: 100%; vertical-align: top;" colspan="2">
                                    <%--Design--%>
                                    <table width="100%">
                                        <tr>
                                            <td>RuleName:</td>
                                            <td>
                                                <asp:TextBox ID="txtRuleName" runat="server"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td>Active:</td>
                                            <td>
                                                <asp:CheckBox ID="chkActive" runat="server" /></td>
                                        </tr>

                                    </table>
                                </td>
                            </tr>

                            <tr height="20px">
                                <td style="width: 10%"></td>
                                <td style="width: 90%; vertical-align: text-bottom; padding: 10px; text-align: right;">
                                    <asp:Button ID="btnSaveRule" runat="server" ForeColor="White"
                                        Font-Size="12px" Font-Names="Arial" Font-Bold="True" CausesValidation="true"
                                        Width="60px" ToolTip="click to save" Text="Save" BorderWidth="0px" BorderStyle="Solid"
                                        BorderColor="#8EC2E8" BackColor="Gray" ValidationGroup="Add" OnClick="btnSaveRule_Click"></asp:Button>
                                    &nbsp;
                                            <asp:Button ID="btnCancelCreateRule" runat="server" ForeColor="White"
                                                Font-Size="12px" Font-Names="Arial" Font-Bold="True" CausesValidation="true"
                                                Width="60px" ToolTip="click to cancel" Text="Cancel" BorderWidth="0px" BorderStyle="Solid"
                                                BorderColor="#8EC2E8" BackColor="Gray" ValidationGroup="Add"></asp:Button>&nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Button Style="display: none" ID="btnPopupCreateRUle" runat="server"></asp:Button>
    <cc1:ModalPopupExtender ID="mpCreateRule" runat="server" TargetControlID="btnPopupCreateRUle"
        PopupDragHandleControlID="lblHdrCreateRule" PopupControlID="pnlDetailsCreateRule" BackgroundCssClass="popUpStyle">
    </cc1:ModalPopupExtender>
    <script type="text/javascript">

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$rbtDocType']").click(function () {
               
                if ($("#ContentPlaceHolder1_rbtDocType_0").is(":checked")) {
                    $("#ContentPlaceHolder1_fupFile").show();
                    $("#ContentPlaceHolder1_txtUrl").hide();
                    //alert('aa');
                } else {
                    $("#ContentPlaceHolder1_fupFile").hide();
                    $("#ContentPlaceHolder1_txtUrl").show();
                    //alert('bb');
                }
            });
        });
        function showHide() {
            if ($("#ContentPlaceHolder1_rbtDocType_0").is(":checked")) {
                $("#ContentPlaceHolder1_fupFile").show();
                $("#ContentPlaceHolder1_txtUrl").hide();
                //alert('aa');
            } else {
                $("#ContentPlaceHolder1_fupFile").hide();
                $("#ContentPlaceHolder1_txtUrl").show();
                //alert('bb');
            }
            //$("#ContentPlaceHolder1_fupFile").show();
            //$("#ContentPlaceHolder1_txtUrl").hide();
        }
        $(document).ready(function () {
            showHide();
            //$('input[name="ctl00$ContentPlaceHolder1$rbtDocType"]:radio:first').click();
        });
    </script>
</asp:Content>
