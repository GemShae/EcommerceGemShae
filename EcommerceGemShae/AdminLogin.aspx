<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="EcommerceGemShae.AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <br /> <br />
            <div class="col-md-6 mx-auto center card-border product-polaroid">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <br /> <br />
                            <div class="col">
                                <center> <img width="150" alt="Admin User Icon" src="images/admin user.png" /> </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Admin Login</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr class="rounded-hr" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:TextBox ID="AdminUsernameTextBox" runat="server" CssClass="form-control" placeholder="Admin Username"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:TextBox ID="AdminPasswordTextBox" runat="server" CssClass="form-control" placeholder="Admin Password" TextMode="Password"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Button ID="LoginButton" runat="server" Text="Login" class="btn btn-success btn-block btn-lg" OnClick="LoginButton_Click" />
                                </div>

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AdminLoginConnectionString %>" SelectCommand="SELECT * FROM [admin_login_master]"></asp:SqlDataSource>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
