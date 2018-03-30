<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ServiceReport.aspx.cs" Inherits="ServiceReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server">
          <asp:View ID="VwParent" runat="server">
              <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" Width="662px" OnPageIndexChanging="GridView1_PageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="RunID">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkBtnRunID" runat="server" CausesValidation="false" CommandArgument='<%# Eval("RunID") %>' Text='<%# Eval("RunID") %>' OnClick="lnkBtnRunID_Click"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NoOfFile" HeaderText="NoOfFile" />
                    <asp:BoundField DataField="RunTime" HeaderText="RunTime" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                </Columns>
              </asp:GridView>
          </asp:View>

          <asp:View ID="VwDetails" runat="server">
              <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Height="196px" Width="861px">
                  <Columns>
                      <asp:BoundField DataField="RunID" HeaderText="RunID" />
                      <asp:BoundField DataField="FileName" HeaderText="FileName" />
                      <asp:BoundField DataField="FieldValue" HeaderText="FieldValue" />
                      <asp:BoundField DataField="EntryDate" HeaderText="EntryDate"/>
                      <asp:BoundField DataField="IsSuccess" HeaderText="IsSuccess" />
                      
                      <asp:TemplateField HeaderText="Actions">
                          <ItemTemplate>
                              <asp:ImageButton ID="ibtnActiveReport" runat="server" ImageUrl="~/images/inactive.gif" />
                              <asp:ImageButton ID="ibtnEditReport" runat="server"  ImageUrl="~/images/details_icon2.gif" />
                              <asp:ImageButton ID="ibtnValidateReport" runat="server" ImageUrl="~/images/pending.gif"/>
                          </ItemTemplate>
                      </asp:TemplateField>
                      
                  </Columns>
              </asp:GridView>
        </asp:View>
    </asp:MultiView>
    

  
</asp:Content>

