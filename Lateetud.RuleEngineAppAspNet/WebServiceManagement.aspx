<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="WebServiceManagement.aspx.cs" Inherits="WebServiceManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%"  border="1">
        <tr>
            <td colspan="2" style="text-align: center; color: #339933; text-decoration: underline; font-size: large"><strong>Manage Services</strong></td>
        </tr>
        <tr>
            <td><strong>Get the result through web service (Receive result in JSON and XML format)</strong></td>
            <td>

                <a href="Services/LateetudRuleEngine.asmx" id="hlWebservice" target="_blank">Call the service</a>
            </td>
        </tr>
    </table>
</asp:Content>

