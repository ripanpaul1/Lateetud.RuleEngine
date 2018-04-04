<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="APIReport.aspx.cs" Inherits="APIReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <cc1:ToolkitScriptManager runat="server">
    </cc1:ToolkitScriptManager>
    <asp:MultiView ID="MvAPIShow" runat="server">
        <asp:View ID="VwAPIParent" runat="server">
            <table style="width: 100%">
                <tr style="text-align: center">
                    <td>
                        <span style="font-size: x-large"><b><u>API Rule Application Summary</u></b></span>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">

                        <asp:GridView ID="GvAPIRuleApplicationSummary" runat="server" AllowPaging="True" AutoGenerateColumns="False" Width="662px" OnPageIndexChanging="GvAPIRuleApplicationSummary_PageIndexChanging">
                            <Columns>
                                <asp:TemplateField HeaderText="RunID">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkBtnAPIRunID" runat="server" CausesValidation="false" CommandArgument='<%# Eval("RunID") %>' Text='<%# Eval("RunID") %>' ToolTip="View Details & Edit" OnClick="lnkBtnAPIRunID_Click"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="RunTime" HeaderText="RunTime" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="VwAPIDetails" runat="server">
            <table style="width: 100%">
                <tr style="text-align: center">

                    <td>

                        <span style="font-size: x-large"><b><u>Service Log History</u></b></span>
                    </td>
                </tr>
                <tr style="text-align: left">
                    <td>
                        <asp:Button ID="btnAPIBack" runat="server" Text="BACK" Height="30px" Width="96px" Font-Bold="true" Font-Size="Medium" OnClick="btnAPIBack_Click" />
                    </td>

                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:GridView ID="GvAPIRuleApplicationDetails" runat="server" AutoGenerateColumns="False" Height="196px" Width="861px">
                            <Columns>

                                <asp:BoundField DataField="RunID" HeaderText="RunID" />
                                <asp:BoundField DataField="FileName" HeaderText="FileName" />
                                <asp:BoundField DataField="FieldValue" HeaderText="FieldValue" />
                                <asp:BoundField DataField="EntryDate" HeaderText="EntryDate" />
                                <asp:BoundField DataField="IsSuccess" HeaderText="IsSuccess" />

                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>

                                        <asp:ImageButton ID="ibtnAPIEdit" runat="server" ImageUrl="~/images/details_icon2.gif" CommandArgument='<% # Eval("ID") %>' ToolTip="View and Edit Details" OnClick="ibtnAPIEdit_Click" />

                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>

                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:View>

    </asp:MultiView>
    <asp:Panel ID="pnlAPIReportEditRule" runat="server" Width="400px" BorderWidth="1px" BorderStyle="Solid"
        BorderColor="gray" BackColor="#F0F0F0">
        <table style="font-weight: bold; font-size: 12px; color: white; font-family: Verdana; background-color: gray; width: 101%;">
            <tr>
                <td style="width: 95%" align="left">
                    <asp:Label ID="lblHdrAPIEditReportRule" runat="server" CssClass="moveCursor" Width="100%">&nbsp;</asp:Label>
                </td>
                <td style="width: 5%" align="right">

                    <asp:ImageButton ID="ibtnCloseAPIRule" runat="server" ToolTip="close" ImageUrl="~/images/close.gif"></asp:ImageButton>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Panel ID="pnlInnerAPIReportEditRule" Width="400px" runat="server" Height="180px">

                        <table id="tblWriteAPIeRule" runat="server" height="100%" width="100%">
                            <tr>
                                <td style="width: 100%; vertical-align: top;" colspan="2">
                                    <%--Design--%>
                                    <table>
                                        <tr>
                                            <td colspan="2">
                                                <span><b>File Name:</b></span>
                                                &nbsp;
                                                        <asp:Label ID="lblAPIFileName" runat="server"></asp:Label>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <span><b>Rule Name:</b></span>
                                                &nbsp;
                                                        <asp:Label ID="lblAPIReportRuleName" runat="server"></asp:Label>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <span><b>Field Value:</b></span>
                                                &nbsp;
                                                        <asp:TextBox ID="txtAPIFieldValue" runat="server" />
                                            </td>
                                        </tr>

                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: right">
                                    <asp:Button ID="btnAPIUpdate" runat="server" ForeColor="White"
                                        Font-Size="12px" Font-Names="Arial" Font-Bold="True" CausesValidation="true"
                                        Width="100px" ToolTip="click to save" Text="Save" BorderWidth="0px" BorderStyle="Solid"
                                        BorderColor="#8EC2E8" Height="30px" BackColor="Gray" ValidationGroup="Add" OnClick="btnAPIUpdate_Click"></asp:Button>
                                    &nbsp;
                                                <asp:Button ID="btnCancelAPIReportRule" runat="server" ForeColor="White"
                                                    Font-Size="12px" Font-Names="Arial" Font-Bold="True" CausesValidation="true"
                                                    Width="100px" ToolTip="click to cancel" Height="30px" Text="Cancel" BorderWidth="0px" BorderStyle="Solid"
                                                    BorderColor="#8EC2E8" BackColor="Gray" ValidationGroup="Add"></asp:Button>
                                    &nbsp;
                                </td>
                            </tr>

                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>

    </asp:Panel>
    <asp:Button Style="display: none" ID="btnPopupAPIReportRule" runat="server"></asp:Button>
    <cc1:ModalPopupExtender ID="mpAPIReportEditRule" runat="server" TargetControlID="btnPopupAPIReportRule"
        PopupDragHandleControlID="lblHdrAPIEditReportRule" PopupControlID="pnlAPIReportEditRule" BackgroundCssClass="popUpStyle">
    </cc1:ModalPopupExtender>
</asp:Content>

