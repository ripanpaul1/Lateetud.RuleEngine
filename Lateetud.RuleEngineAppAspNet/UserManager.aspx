<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="UserManager.aspx.cs" Inherits="UserManager" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .FontBold {
            font-weight: bold;
        }

        .FontRightBold {
            text-align: right;
            font-weight: bold;
        }
    </style>
          <cc1:ToolkitScriptManager runat="server">
            </cc1:ToolkitScriptManager>
    <table width="100%">
        <tr>
            <td class="FontBold" colspan="5" style="padding: 15px;">
                <br />
                <b>User Management</b>
                <hr />

            </td>
        </tr>
        <tr>
            <td colspan="4" style="padding: 5px;"></td>
            <td class="FontRightBold" style="padding: 5px;">
                <asp:LinkButton ID="LinkAdd" OnClick="ChangeView" runat="server" CommandArgument="0"
                    ToolTip="click here to add new record" Font-Underline="False"
                    Font-Size="12pt"
                    Font-Names="Arial" Font-Bold="False" CausesValidation="False">Add New</asp:LinkButton>
                &nbsp;  |&nbsp;
                                                            <asp:LinkButton ID="LinkBrowse" OnClick="ChangeView" runat="server" CommandArgument="1"
                                                                ToolTip="click here to browse all records." Font-Underline="False"
                                                                Font-Size="12pt"
                                                                Font-Names="Arial" Font-Bold="False" CausesValidation="False">Browse</asp:LinkButton>
            </td>
        </tr>
    </table>
    <asp:MultiView ID="mvUserManager" runat="server" ActiveViewIndex="1">
        <asp:View ID="vwAdd" runat="server">
            <table>
                <tr>
                    <td style="width: 189px; padding: 3px;">&nbsp;<span style="color: #ff0000">*</span><span class="form_tx">First Name:</span></td>
                    <td style="width: 761px; padding: 5px;"><asp:TextBox ID="txtFirstName" runat="server" BorderColor="#8ADDF4" BorderStyle="Solid"
                        BorderWidth="1px" ValidationGroup="AddUser" Width="300px"
                        CausesValidation="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqvalFName" runat="server" ControlToValidate="txtFirstName"
                            Display="None" SetFocusOnError="True" ValidationGroup="AddUser" ErrorMessage="Please enter First Name"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td style="width: 189px; padding: 3px;">&nbsp;
                        <span style="color: #ff0000">*</span><span>Last Name:</span></td>
                    <td style="width: 761px; padding: 3px;">&nbsp;<asp:TextBox ID="txtLastName" runat="server" BorderColor="#8ADDF4" BorderStyle="Solid"
                        BorderWidth="1px" ValidationGroup="AddUser" Width="300px"
                        CausesValidation="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqvalLName" runat="server" ControlToValidate="txtFirstName"
                            Display="None" SetFocusOnError="True" ValidationGroup="AddUser" ErrorMessage="Please enter Last Name"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td style="width: 189px; padding: 3px;">&nbsp;<span style="color: #ff0000">*</span><span class="form_tx">UserName:</span></td>
                    <td style="width: 761px; padding: 3px;">&nbsp;<asp:TextBox ID="txtUserName" runat="server" BorderColor="#8ADDF4" BorderStyle="Solid"
                        BorderWidth="1px" ValidationGroup="AddUser" Width="300px"
                        CausesValidation="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqvalUserName" runat="server" ControlToValidate="txtUserName"
                            Display="None" SetFocusOnError="True" ValidationGroup="AddUser" ErrorMessage="Please enter User Name"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td style="width: 189px; padding: 3px;">&nbsp;<span style="color: #ff0000">*</span><span class="form_tx">Password:</span></td>
                    <td style="width: 761px; padding: 3px;">&nbsp;<asp:TextBox ID="txtPassword" runat="server" BorderColor="#8ADDF4" BorderStyle="Solid"
                        BorderWidth="1px" ValidationGroup="AddUser" Width="300px"
                        CausesValidation="True" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 189px; padding: 3px;">&nbsp;<span style="color: #ff0000">*</span><span class="form_tx">Email-ID:</span></td>
                    <td style="width: 761px; padding: 3px;">&nbsp;<asp:TextBox ID="txtEmail" runat="server" BorderColor="#8ADDF4" BorderStyle="Solid"
                        BorderWidth="1px" Width="300px" ValidationGroup="AddUser"
                        MaxLength="250"></asp:TextBox><span style="color: #ff0000"> </span>
                        <asp:RequiredFieldValidator ID="reqvalEmailId" runat="server" ControlToValidate="txtEmail"
                            Display="None" SetFocusOnError="True" ValidationGroup="AddUser" ErrorMessage="please enter Email-Id"></asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator ID="regValEmailId" runat="server" ControlToValidate="txtEmail"
                            Display="None" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ValidationGroup="AddUser" ErrorMessage="please enter valid email"></asp:RegularExpressionValidator>

                    </td>
                </tr>
               <%-- <tr>
                    <td style="width: 189px; padding: 3px;">&nbsp;<span style="color: #ff0000">*</span><span class="form_tx">User Type:</span></td>
                    <td style="width: 761px; padding: 3px;">&nbsp;<asp:DropDownList ID="ddlUserType" runat="server"
                        ValidationGroup="AddFAQ" Width="130px">
                    </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="reqvalUserType" runat="server"
                            ErrorMessage="Select User Type" InitialValue="-1" Display="None"
                            ControlToValidate="ddlUserType" ValidationGroup="AddFAQ"></asp:RequiredFieldValidator>


                    </td>
                </tr>--%>
                <tr>
                    <td style="width: 189px; padding: 3px;">
                        <span class="form_tx">&nbsp;&nbsp;Active:</span></td>
                    <td style="width: 761px; padding: 3px;">&nbsp;<asp:CheckBox ID="chkActive" Checked="true" runat="server" CssClass="space_ie" /></td>
                </tr>
                <tr>
                    <td align="right" style="width: 189px; padding: 10px;">
                        <asp:Button ID="btnSave" runat="server" BackColor="#317DB1" BorderColor="#8EC2E8"
                            BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Arial" Font-Size="12px"
                            ForeColor="White" Text="Save" ToolTip="click to save" Width="60px" OnClick="btnSave_Click" />
                        &nbsp;&nbsp;
                    </td>
                    <td align="left" style="width: 761px; padding: 10px;">
                        <asp:Button ID="btnCancel" runat="server" BackColor="#317DB1" BorderColor="#8EC2E8"
                            BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Arial" Font-Size="12px"
                            ForeColor="White" Text="Cancel" ToolTip="click to Cancel" Width="60px" OnClick="btnCancel_Click" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="vwView" runat="server">
            <table width="100%">
        <tr>
        <td>
        <asp:DropDownList ID="ddlSearchFor" runat="server" Font-Names="Verdana" Font-Size="11px"
                                    Width="130px">
                                    <asp:ListItem Value="UserName">User Id</asp:ListItem>
                                   
                                </asp:DropDownList>
                                <%--<asp:RadioButtonList ID="rdolstSearchType" runat="server" RepeatDirection="Horizontal"
                                    RepeatLayout="Flow" CssClass="text5">
                                    <asp:ListItem Selected="True" Value="SW">Starts With</asp:ListItem>
                                    <asp:ListItem Value="C">Contains</asp:ListItem>
                                </asp:RadioButtonList>--%>
                                <asp:TextBox ID="txtSearchFor" runat="server" Font-Names="Verdana" Font-Size="11px"
                                    Width="150px"></asp:TextBox>
                                <asp:Button ID="btnSearch" runat="server" BackColor="#317DB1" BorderColor="#8EC2E8"
                                    BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Arial" Font-Size="12px"
                                    ForeColor="White" Text="Search" ToolTip="click to save" Width="60px" />
        </td>
        </tr>
        <tr>
        
        <td align="right">
         <span class="text50">Record Per page</span>
                                <asp:DropDownList ID="ddlPageSize" runat="server" Font-Names="Verdana" Font-Size="11px"
                                    AutoPostBack="True" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem Selected="True">10</asp:ListItem>
                                    <asp:ListItem>25</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>100</asp:ListItem>
                                </asp:DropDownList>
        </td>
        </tr>
        <tr>
        <td>
          <asp:GridView ID="gvUser" runat="server" DataSourceID="odsUser" Font-Size="11px" 
                Font-Names="Verdana" Width="100%"
                                BorderColor="#8EC2E8" BorderStyle="Solid" 
                BorderWidth="1px" AllowPaging="True"
                                AllowSorting="True" AutoGenerateColumns="False" 
                CellPadding="1" CellSpacing="1"
                                GridLines="Both">
                                <EmptyDataRowStyle BorderStyle="Solid" HorizontalAlign="Center" Font-Bold="True">
                                </EmptyDataRowStyle>
                                <Columns>
                                     <asp:BoundField DataField="UserName" SortExpression="UserName" HeaderText="UserName">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                 
                                    <asp:BoundField DataField="FirstName" SortExpression="FirstName" HeaderText="First Name">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                      <asp:BoundField DataField="LastName" SortExpression="LastName" HeaderText="Last Name">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="EmailId" SortExpression="EmailId" HeaderText="Email Address">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ModifiedDate" SortExpression="ModifiedDate" HeaderText="Modification Date"
                                         HtmlEncode="False">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="LoginDatetime" SortExpression="LoginDatetime" HeaderText="Last Login Date"
                                         HtmlEncode="False">
                                        <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemStyle Width="10%" HorizontalAlign="Center"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ibtnActive" OnClick="ChangeStatus" runat="server" ImageUrl='<% # Convert.ToBoolean(Eval("IsActive")) ? "~/images/active.gif" : "~/images/inactive.gif" %>' CommandArgument='<% # Eval("IsActive") %>'
                                                CommandName='<% # Eval("ID") %>' ToolTip='<% # Convert.ToBoolean(Eval("IsActive")) ? "Click Here To Deactivate" : "Click Here To Activate" %>' ></asp:ImageButton>
                                            <asp:ImageButton ID="ibtnEdit" runat="server" ImageUrl="~/images/details_icon2.gif"
                                                CommandArgument='<% # Eval("ID") %>' ToolTip="View Details & Edit" OnClick="ibtnEdit_Click"/>
                                          
                                            
                                          
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
        </td>
        </tr>
        <tr>
        <td style="width: 1021px">
       <asp:ObjectDataSource ID="odsUser" runat="server" SelectMethod="GetUserListDetails" TypeName="BLL.UserMasterHandler"></asp:ObjectDataSource>
        </td>
        </tr>
            <tr>
                <td style="width: 1021px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 1021px">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 1021px">
                    &nbsp;</td>
            </tr>
        </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>

