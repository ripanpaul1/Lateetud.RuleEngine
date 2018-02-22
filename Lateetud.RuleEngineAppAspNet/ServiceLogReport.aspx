<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ServiceLogReport.aspx.cs" Inherits="ServiceLogReport" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td></td>
        </tr>
        <tr>
            <td>
                <cc1:ToolkitScriptManager runat="server">
    </cc1:ToolkitScriptManager>
                <rsweb:ReportViewer ID="rvServiceLog" runat="server" Width="100%" Height="500px"></rsweb:ReportViewer>
            </td>
        </tr>
    </table>
</asp:Content>

