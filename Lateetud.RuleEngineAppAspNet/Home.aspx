<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" border="1" style="text-align:center">
        <tr>
            <td rowspan="2">
                 <asp:Calendar ID="calFE" runat="server" BorderStyle="None" BackColor="#4b5a61"
                    CellPadding="0" CellSpacing="3" CssClass="week" EnableTheming="True" BorderWidth="0px"
                    ForeColor="White" Width="300px" Height="200px">
                    <DayStyle CssClass="box" />
                    <NextPrevStyle CssClass="next_arrow" />
                    <TitleStyle CssClass="month_display" BorderStyle="Dotted" BorderWidth="0px" />
                    <TodayDayStyle CssClass="selected_box" />
                    <WeekendDayStyle CssClass="box" />
                    <OtherMonthDayStyle CssClass="" />
                </asp:Calendar>

            </td>
            <td>
                <img src="images/dashboard_icons/dashboard-icon1.gif" /></td>
            <td>
                <img src="images/dashboard_icons/popular_dw_hover.gif" /></td>
            <td>
                <img src="images/dashboard_icons/information.jpg" height="100" /></td>
        </tr>
        <tr>
            <td>
                <img src="images/dashboard_icons/offer.gif" />
               </td>
            <td>
                <img src="images/dashboard_icons/cms1.gif" /></td>
            <td>
                <img src="images/dashboard_icons/composers.gif" /> </td>
        </tr>
        <tr>
            <td >
                 <asp:Chart ID="cTestChart" runat="server" Height="200px" Width="200px">
                                        <Series>
                                            <asp:Series Name="Testing" IsValueShownAsLabel="true">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1">
                                                <Area3DStyle />
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart></td>
            <td >
                <img src="images/dashboard_icons/product_management.gif" />
                </td>
            <td><img src="images/dashboard_icons/difficulty.gif" /></td>
            <td>
                <img src="images/dashboard_icons/user.gif" /></td>
            
        </tr>
    </table>
</asp:Content>

