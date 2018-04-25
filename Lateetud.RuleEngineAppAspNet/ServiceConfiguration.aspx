<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ServiceConfiguration.aspx.cs" Inherits="ServiceConfiguration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .show {
            display: none;
        }
    </style>
    <table width="100%">
        <tr>
            <td><span style="font-size: x-large; text-decoration: underline"><strong>Configuration Details</strong></span></td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvRule" runat="server"  Font-Size="11px"
                    Font-Names="Verdana" Width="100%"
                    BorderColor="#8EC2E8" BorderStyle="Solid"
                    BorderWidth="1px" AllowPaging="True"
                    AllowSorting="True" DataKeyNames="ID" AutoGenerateColumns="False"
                    CellPadding="1" CellSpacing="1"
                    GridLines="Both" OnRowEditing="gvRule_RowEditing" OnRowUpdating="gvRule_RowUpdating" OnRowCancelingEdit="gvRule_RowCancelingEdit">
                    <EmptyDataRowStyle BorderStyle="Solid" HorizontalAlign="Center" Font-Bold="True"></EmptyDataRowStyle>
                    <Columns>
                        <asp:BoundField DataField="ConfigurationKey" ReadOnly="true" SortExpression="ConfigurationKey" HeaderText="Configuration Key">
                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Configuration Value" HeaderStyle-HorizontalAlign="Left">
                            <EditItemTemplate>
                                <asp:Label ID="lblId" runat="server" CssClass="show" Text='<%# Bind("ID") %>'></asp:Label>
                                <asp:TextBox ID="txtValue" runat="server" Text='<%# Bind("ConfigurationValue") %>'></asp:TextBox>
                            </EditItemTemplate>

                            <ItemTemplate>
                                <asp:Label ID="lblValue" runat="server" Text='<%# Bind("ConfigurationValue") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="ConfigurationType"  ReadOnly="true" SortExpression="ConfigurationType" HeaderText="Configuration Type">
                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Comment"  ReadOnly="true" SortExpression="Comment" HeaderText="Comment">
                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                        </asp:BoundField>


                        <asp:TemplateField HeaderText="Action" ShowHeader="true" HeaderStyle-HorizontalAlign="Left">
                            <ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <EditItemTemplate>
                                <asp:ImageButton ID="ibtnUpdate" runat="server" ImageUrl="~/images/approved.gif"
                                                CommandArgument='<% # Eval("ID") %>' ToolTip="Save" CommandName="Update" CausesValidation="True"/> &nbsp;
                               <%-- <asp:LinkButton ID="lbkUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>--%>
                                <asp:ImageButton ID="ibtnCancel" runat="server" ImageUrl="~/images/del.gif"
                                                CommandArgument='<% # Eval("ID") %>' ToolTip="Cancel" CommandName="Cancel" CausesValidation="True"/>
                                
                                <%--<asp:LinkButton ID="lnkCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>--%>
                            </EditItemTemplate>

                            <ItemTemplate>
                                 <asp:ImageButton ID="ibtnEdit" runat="server" ImageUrl="~/images/edit1.gif"
                                                CommandArgument='<% # Eval("ID") %>' ToolTip="Edit" CommandName="Edit" CausesValidation="False"/>
                               <%-- <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>--%>
                                <%--<asp:ImageButton ID="ibtnActive" OnClick="ChangeStatus" runat="server" ImageUrl='<% # Convert.ToBoolean(Eval("IsActive")) ? "~/images/active.gif" : "~/images/inactive.gif" %>' CommandArgument='<% # Eval("IsActive") %>'
                                    CommandName='<% # Eval("ID") %>' ToolTip='<% # Convert.ToBoolean(Eval("IsActive")) ? "Click Here To Deactivate" : "Click Here To Activate" %>'></asp:ImageButton>--%>

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
              <%--  <asp:ObjectDataSource ID="odsRule" runat="server" SelectMethod="GetConfigurationDetails" TypeName="BLL.ConfigurationHandler"></asp:ObjectDataSource>--%>


            </td>
        </tr>
    </table>
</asp:Content>

