<%@ Page Title="User Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="EcommerceGemShae.UserLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /> <br />
    <div class="container">
        <div class="row pt-3">
            <br /> <br />
            <div class="col-md-6 mx-auto">

                <div class="card product-polaroid card-border">
                    <div class="card-body">

                        <%--IMAGE ROW--%>
                        <div class="row">
                            <br /> <br />
                            <div class="col">
                                <center> <img width="150" alt="User Icon" src="images/user.png" /> </center>
                            </div>
                        </div>

                        <%--TITLE ROW--%>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>User Login</h3>
                                </center>
                            </div>
                        </div>

                        <%--HR ROW--%>
                        <div class="row">
                            <div class="col">
                                <hr class="rounded-hr" />
                            </div>
                        </div>

                        <%--COL 12 - FULL DETAILS ROW--%>
                        <div class="row">
                            <div class="col">
                                <label>User ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="UserIDTextBox" runat="server" CssClass="form-control" placeholder="User ID"></asp:TextBox>
                                </div>

                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="UserPasswordTextBox" runat="server" CssClass="form-control" placeholder="User Password" TextMode="Password"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Button ID="LoginButton" runat="server" Text="Login" class="btn btn-success btn-block btn-lg" OnClick="LoginButton_Click" />
                                </div>

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UserLoginConnectionString %>" SelectCommand="SELECT * FROM [user_master]"></asp:SqlDataSource>

                                <div class="form-group">
                                    <a href="UserSignUp.aspx">
                                        <input id="SignUpButton" type="button" value="Sign Up" class="btn btn-info btn-block btn-lg" />
                                    </a>
                                </div>
                            </div>
                        </div>

                        <asp:Label ID="StatusLabel" runat="server" Text="" style="color:#E1B12C" Font-Bold="True" Font-Italic="True"></asp:Label> <br />

                        <a href="Default.aspx"> << <b> Back to Home </b></a>

                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
