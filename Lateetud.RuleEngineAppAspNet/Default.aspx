<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/style.css" />
    <style>
        .unwatermarked
        {
            height: 18px;
            width: 148px;
        }
        
        .watermarked
        {
            height: 20px;
            width: 150px;
            padding: 2px 0 0 2px;
            border: 1px solid #BEBEBE;
            background-color: #F0F8FF;
            color: gray;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <section class="container">
                <div class="login">
                    <h1>Login to Rule Engine</h1>
                
                        <p>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            UserName<asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                          
                            </p>
                        <p>
                             Password<asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
                            </p>
                        <p class="remember_me">
                            <label>
                                <input type="checkbox" name="remember_me" id="remember_me" />
                                Remember me on this computer
         
                            </label>
                        </p>
                        <p class="submit">
                            <asp:Button ID="btnSUbmit" runat="server" Text="Login" OnClick="btnSUbmit_Click" />
                           </p>
                   
                </div>

                <div class="login-help">
                    <p>Forgot your password? <a href="Default.aspx">Click here to reset it</a>.</p>
                </div>
            </section>
        </div>
    </form>
</body>
</html>
