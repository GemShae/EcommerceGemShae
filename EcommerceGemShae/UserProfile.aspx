<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="EcommerceGemShae.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">
        <div class="row">
            <br /> <br />
            <div class="col-md-5 card-border product-polaroid">
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
                                    <h4>Your Profile</h4>

                                    <span>Account Status - </span>
                                    <asp:Label ID="AccStatusLabel" runat="server" Text="Online" class="badge badge-pill badge-info"></asp:Label>
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
                            <div class="col-md-4">
                                <label>User ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="IDTextBox" runat="server" class="form-control" placeholder="Member ID" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Current Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="PasswordTextBox" runat="server" class="form-control" placeholder="Password" TextMode="Password" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>New Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col-md-12 text-center mx-auto"> 
                                <div class="form-group">
                                    <center>
                                        <asp:Button ID="UpdateButton" runat="server" Text="Update" class="btn btn-primary btn-block btn-lg" />
                                    </center>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <a href="Default.aspx"> <b> << Back to Home </b> </a> 
                <br /> <br />
            </div>

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <br /> <br />
                            <div class="col">
                                <center> <img width="100" alt="GemShae Banner" src="images/Banner.png" /> </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Your Profile</h4>

                                    <span>Account Status - </span>
                                    <asp:Label ID="Label1" runat="server" Text="Online" class="badge badge-pill badge-info"></asp:Label>
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
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="dd-mm-yyyy" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" placeholder="Contact #" TextMode="Phone"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Email Address</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" placeholder="Email Address" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Country</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" AutoPostBack="True">
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
                                    <asp:TextBox ID="TextBox6" runat="server" class="form-control" placeholder="City/Parish"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Zip Code</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox7" runat="server" class="form-control" placeholder="Zip Code" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <label>Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
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
                            <div class="col-md-4">
                                <label>User ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox9" runat="server" class="form-control" placeholder="Member ID" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Current Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox10" runat="server" class="form-control" placeholder="Password" TextMode="Password" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>New Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox11" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col-md-12 text-center mx-auto"> 
                                <div class="form-group">
                                    <center>
                                        <asp:Button ID="Button1" runat="server" Text="Update" class="btn btn-primary btn-block btn-lg" />
                                    </center>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
