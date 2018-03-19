<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ServiceLogReport.aspx.cs" Inherits="ServiceLogReport" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td>
                <asp:Label ID="lblParameter" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <cc1:ToolkitScriptManager runat="server">
    </cc1:ToolkitScriptManager>
                <rsweb:ReportViewer ID="rvServiceLog" runat="server" Width="100%" Height="500px" Visible="false" OnDrillthrough="rvServiceLog_Drillthrough"></rsweb:ReportViewer>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="upnlRpt" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlReportMain" runat="server" Width="300px" BorderWidth="1px" BorderStyle="Solid"
                BorderColor="gray" BackColor="#F0F0F0">
                <table style="font-weight: bold; font-size: 12px; color: white; font-family: Verdana; background-color: gray"
                    width="100%">
                    <tr>
                        <td style="width: 95%" align="left">
                            <asp:Label ID="lblHdrReport" runat="server" CssClass="moveCursor" Width="100%">&nbsp;</asp:Label>
                        </td>
                        <td style="width: 5%" align="right">

                            <asp:ImageButton ID="ibtnCloseReport" runat="server" ToolTip="close" ImageUrl="~/images/close.gif"></asp:ImageButton>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <asp:Panel ID="pnlInnerReport" Width="300px" runat="server" Height="100px">

                                <table id="tblReport" runat="server" height="100%" width="100%">
                                    <tr>
                                        <td style="width: 100%; vertical-align: top;" colspan="2">
                                            <strong>Please choose a Non Zero Run ID</strong>
                                        </td>
                                    </tr>

                                    <tr height="20px">
                                        <td style="width: 10%"></td>
                                        <td style="width: 90%; vertical-align: text-bottom; padding: 10px; text-align: right;">
                                           
                                                    <asp:Button ID="btnCancelPopup" runat="server" ForeColor="White"
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
            <asp:Button Style="display: none" ID="btnPopupReport" runat="server"></asp:Button>
            <cc1:ModalPopupExtender ID="mpReport" runat="server" TargetControlID="btnPopupReport"
                PopupDragHandleControlID="lblHdrReport" PopupControlID="pnlReportMain" BackgroundCssClass="popUpStyle">
            </cc1:ModalPopupExtender>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

