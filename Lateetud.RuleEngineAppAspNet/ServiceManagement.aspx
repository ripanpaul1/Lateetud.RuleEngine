<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ServiceManagement.aspx.cs" Inherits="ServiceManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" border="1">
        <tr>
            <td colspan="2" style="text-decoration: underline; color: #0000FF; font-size: medium">
                <h2 style="color: #336600"><strong>Service Management</strong></h2>
            </td>
        </tr>
        <tr>
            <td width="30%"><strong>Current Status of the Service:</strong></td>
            <td>
                <asp:Label ID="lblCurrentStatus" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td width="30%"><strong>Next available schedule run:</strong></td>
            <td>
                <asp:Label ID="lblNextRun" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td width="30%"><strong>Start/Restart the Service:</strong></td>
            <td>
                <asp:Button ID="btnRestart" runat="server" Text="Start" OnClick="btnRestart_Click" /></td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td width="30%"><strong>Stop the Service:</strong></td>
            <td>
                <asp:Button ID="btnStop" runat="server" Text="Stop" OnClick="btnStop_Click" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>&nbsp;
            </td>
        </tr>
        <tr>
            <td>
              <strong>Adhoc Run(One time) the Service:</strong>
            </td>
             <td>
                <asp:Button ID="btnAdjocRun" runat="server" Text="Adhoc Run" OnClick="btnAdjocRun_Click" /></td>
        </tr>
    </table>
</asp:Content>

