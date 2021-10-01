<%@ Page Title="User Sign Up" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserSignUp.aspx.cs" Inherits="EcommerceGemShae.UserSignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <br /> <br />
            <div class="col-md-8 mx-auto center card-border product-polaroid">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <br /> <br />
                            <div class="col">
                                <center> <img width="100" alt="User Icon" src="images/user.png" /> </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>User Registration</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr class="rounded-hr" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="FullNameTextBox" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox ID="DOBTextBox" runat="server" CssClass="form-control" placeholder="dd-mm-yyyy" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox ID="ContNumTextBox" runat="server" CssClass="form-control" placeholder="Contact #" TextMode="Phone"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Email Address</label>
                                <div class="form-group">
                                    <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control" placeholder="Email Address" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Country</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="CountryDropDownList" runat="server" class="form-control" AutoPostBack="True">
                                        <asp:ListItem>Select</asp:ListItem>
                                        <asp:ListItem>Jamaica</asp:ListItem>
                                        <asp:ListItem>USA</asp:ListItem>
                                        <asp:ListItem>Mexico</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox ID="CityTextBox" runat="server" class="form-control" placeholder="City/Parish"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Zip Code</label>
                                <div class="form-group">
                                    <asp:TextBox ID="ZipCodeTextBox" runat="server" class="form-control" placeholder="Zip Code" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <label>Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                                <div class="col-md-12">
                                    <center>
                                        <span class="badge badge-pill badge-info">Login Credentials</span>
                                    </center>
                                </div>
                            
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>User ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="IDTextBox" runat="server" class="form-control" placeholder="User ID"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="PasswordTextBox" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col-md-12 text-center"> 
                                <div class="form-group">
                                    <center>
                                        <asp:Button ID="SignUpButton" runat="server" Text="Sign Up" class="btn btn-success btn-block btn-lg" />
                                    </center>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <a href="Default.aspx"> <b> << Back to Home </b> </a> 
                <br /> <br />
            </div>
        </div>
    </div>

</asp:Content>
