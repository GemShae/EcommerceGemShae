<%@ Page Title="User Sign Up" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserSignUp.aspx.cs" Inherits="EcommerceGemShae.UserSignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <br /> <br />
            <div class="col-md-9 mx-auto center card-border product-polaroid">

                <div class="card">
                    <div class="card-body">

                        <%--IMAGE ROW--%>
                        <div class="row">
                            <br /> <br />
                            <div class="col">
                                <center> <img width="100" alt="User Icon" src="images/user.png" /> </center>
                            </div>
                        </div>

                        <%--TITLE ROW--%>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>User Registration</h4>
                                </center>
                            </div>
                        </div>

                        <%--HR ROW--%>
                        <div class="row">
                            <div class="col">
                                <hr class="rounded-hr" />
                            </div>
                        </div>

                        <%--COL 6 - NAME & DOB ROW--%>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="FullNameTextBox" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="FullNameRequiredFieldValidator" runat="server" ControlToValidate="FullNameTextBox" ErrorMessage="Full name is empty" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="FullNameRegularExpressionValidator" runat="server" ErrorMessage="Only Characters Allowed" ControlToValidate="FullNameTextBox" ForeColor="Red" ValidationExpression="^[A-Za-z]*$"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox ID="DOBTextBox" runat="server" CssClass="form-control" placeholder="dd-mm-yyyy" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%--COL 6 - CONTACT # & EMAIL ROW--%>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox ID="ContNumTextBox" runat="server" CssClass="form-control" placeholder="Contact #" TextMode="Number"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="ContNumRegularExpressionValidator" runat="server" ErrorMessage="Invalid Phone Number" ControlToValidate="ContNumTextBox" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Email Address</label>
                                <div class="form-group">
                                    <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control" placeholder="Email Address" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" runat="server" ControlToValidate="EmailTextBox" ErrorMessage="Email is empty" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <%--COL 4 - COUNTRY,CITY & ZIP CODE ROW--%>
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
                                    <asp:RequiredFieldValidator ID="CountryRequiredFieldValidator" runat="server" ControlToValidate="CountryDropDownList" ErrorMessage="Country is empty" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox ID="CityTextBox" runat="server" class="form-control" placeholder="City/Parish"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="CityRequiredFieldValidator" runat="server" ControlToValidate="CityTextBox" ErrorMessage="City is empty" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Zip Code</label>
                                <div class="form-group">
                                    <asp:TextBox ID="ZipCodeTextBox" runat="server" class="form-control" placeholder="Zip Code" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ZipCodeRequiredFieldValidator" runat="server" ControlToValidate="ZipCodeTextBox" ErrorMessage="Zip Code is empty" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <%--COL 12 - FULL ADDRESS ROW--%>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AddressRequiredFieldValidator" runat="server" ControlToValidate="AddressTextBox" ErrorMessage="Address is empty" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <%--COL 12 - LOGIN DIVIDER ROW--%>
                        <div class="row">
                                <div class="col-md-12">
                                    <center>
                                        <span class="badge badge-pill badge-info" style="color:#E1B12C">Login Credentials</span>
                                    </center>
                                </div>    
                        </div>

                        <%--COL 6 - ID & PASSWORD ROW--%>
                        <div class="row">
                            <div class="col-md-4">
                                <label>User ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="IDTextBox" runat="server" class="form-control" placeholder="User ID"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserIdRequiredFieldValidator" runat="server" ControlToValidate="IDTextBox" ErrorMessage="User Id is empty" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="PasswordTextBox" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator" runat="server" ControlToValidate="PasswordTextBox" ErrorMessage="Password is empty" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label> Confirm Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="ConfirmPasswordTextBox" runat="server" class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="CPasswordRequiredFieldValidator" runat="server" ControlToValidate="ConfirmPasswordTextBox" ErrorMessage="Confirm Password is empty" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CPasswordCompareValidator" runat="server" ErrorMessage="Password is not the same" ControlToCompare="PasswordTextBox" ControlToValidate="ConfirmPasswordTextBox" ForeColor="Red"></asp:CompareValidator>
                                </div>
                            </div>
                        </div>

                        <%--COL 12 -BUTTON ROW--%>
                        <div class="row text-center">
                            <div class="col-md-12 text-center"> 
                                <div class="form-group">
                                    <center>
                                        <asp:Button ID="SignUpButton" runat="server" Text="Sign Up" class="btn btn-success btn-block btn-lg" OnClick="SignUpButton_Click" />
                                    </center>
                                </div>

                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" Font-Bold="True" Font-Italic="True" ForeColor="Red" />

                            </div>
                        </div>

                    </div>
                </div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UserSignUpConnectionString %>" SelectCommand="SELECT * FROM [user_master]"></asp:SqlDataSource>

                <a href="Default.aspx"> <b> << Back to Home </b> 
                
                </a> 
                <br /> <br />

                <asp:Label ID="StatusLabel" runat="server" Text="" style="color:#E1B12C" Font-Bold="True" Font-Italic="True"></asp:Label>
            </div>
        </div>
    </div>

</asp:Content>
