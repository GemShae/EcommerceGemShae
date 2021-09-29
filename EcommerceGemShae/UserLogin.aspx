<%@ Page Title="User Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="EcommerceGemShae.UserLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto center card-border">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <br /> <br />
                            <div class="col">
                                <center> <img width="150" alt="User Icon" src="images/user.png" /> </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Member Login</h3>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr class="rounded-hr" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Member ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="MemberIDTextBox" runat="server" CssClass="form-control" placeholder="Member ID"></asp:TextBox>
                                </div>

                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="MemberPasswordTextBox" runat="server" CssClass="form-control" placeholder="Member Password" TextMode="Password"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <asp:Button ID="LoginButton" runat="server" Text="Login" class="btn btn-success btn-block btn-lg" />
                                </div>
                                <div class="form-group">
                                    <a href="UserSignUp.aspx">
                                        <input id="SignUpButton" type="button" value="Signup" class="btn btn-info btn-block btn-lg" />
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <a href="Default.aspx"> << Back to Home</a> 
                <br /> <br />
            </div>
        </div>
    </div>

</asp:Content>
