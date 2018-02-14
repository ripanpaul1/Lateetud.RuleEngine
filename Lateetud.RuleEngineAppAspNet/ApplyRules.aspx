﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ApplyRules.aspx.cs" Inherits="ApplyRules" %>
<%@ Register Assembly="DropDownCheckBoxes" Namespace="Saplin.Controls" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="100%">
            <tr>
                    <td style="text-align: right">
                        <asp:LinkButton ID="lnkAddNew" runat="server" OnClick="lnkAddNew_Click">Add New</asp:LinkButton>&nbsp;
                <asp:LinkButton ID="lnkView" runat="server" OnClick="lnkView_Click">View</asp:LinkButton>
                    </td>
                </tr>
                <tr><td>
                    <asp:MultiView ID="mvMain" runat="server">

                        <asp:View ID="vwAdd" runat="server"><table width="100%" border="1">
                <tr>
                    <td>Select RuleSet:</td>
                    <td>
                        <asp:DropDownList ID="ddlRuleSet" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlRuleSet_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Select Rules:</td>
                    <td>
                       <asp:DropDownCheckBoxes ID="ddlRule" runat="server"
                                                                        AddJQueryReference="True" UseButtons="false" UseSelectAllNode="True">
                                                                        <Style SelectBoxWidth="140" DropDownBoxBoxWidth="140" />
                                                                        <Texts SelectBoxCaption="All" SelectAllNode="All" />
                                                                    </asp:DropDownCheckBoxes>
                    </td>
                </tr>
                <tr>
                    <td>Select Folder:</td>
                    <td>
                        <asp:Button ID="btnBrowseFolder" runat="server" Text="Browse.." />&nbsp; 
                        <asp:Label ID="lblFolderName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnApply" runat="server" ForeColor="White"
                            Font-Size="12px" Font-Names="Arial" Font-Bold="True" CausesValidation="true"
                            Width="60px" ToolTip="click to Apply" Text="Save" BorderWidth="0px" BorderStyle="Solid"
                            BorderColor="#8EC2E8" BackColor="#0066FF" ValidationGroup="Add" OnClick="btnApply_Click"></asp:Button>
                    </td>
                    <td></td>
                </tr>
            </table></asp:View>
                        <asp:View ID="vwShow" runat="server">

                             <h3 class="auto-style1">Showing Existing Rues</h3>
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

                                        <asp:BoundField DataField="FolderPath" SortExpression="FolderPath" HeaderText="FolderPath">
                                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                        </asp:BoundField>
                                        <%--<asp:BoundField DataField="RuleName" SortExpression="RuleName" HeaderText="RuleName">
                                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                        </asp:BoundField>--%>

                                       
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
                                <asp:ObjectDataSource ID="odsRule" runat="server" SelectMethod="GetRuleDetails" TypeName="BLL.VwRuleEngineHandler"></asp:ObjectDataSource>
                             
                            </asp:View>
                        </asp:View>
                    </asp:MultiView>
            
                    </td></tr>
                </table>
        </div>
    </form>
</body>
</html>
