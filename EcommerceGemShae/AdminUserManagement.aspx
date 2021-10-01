<%@ Page Title="Admin User Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminUserManagement.aspx.cs" Inherits="EcommerceGemShae.AdminUserManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">
        <div class="row">
            <br /> <br />
            <div class="col-md-5 card-border product-polaroid">

                <div class="card">
                    <div class="card-body">

                        <%--TITLE ROW--%>
                        <div class="row">
                            <br /> <br />
                            <div class="col">
                                <center>
                                    <h4>User Details</h4>
                                </center>
                            </div>
                        </div>

                        <%--IMAGE ROW--%>
                        <div class="row">
                            <div class="col">
                                <center> <img width="100" alt="User Icon" src="images/user.png" /> </center>
                            </div>
                        </div>

                        <%--HR ROW--%>
                        <div class="row">
                            <div class="col">
                                <hr class="rounded-hr" />
                            </div>
                        </div>

                        <%--COL 4,6 - ID & NAME ROW--%>
                        <div class="row">
                            <div class="col-md-4">
                                <label>User ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="USerIDTextBox" runat="server" CssClass="form-control" placeholder="User ID"></asp:TextBox>
                                        <asp:LinkButton ID="GoSearchLinkButton" runat="server" Text="Go" class="btn btn-primary"></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="FullNameTextBox" runat="server" CssClass="form-control" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%--COL 6 - ACCOUNT STATUS & DOB ROW--%>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Account Status</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="AccStatusTextBox" runat="server" CssClass="form-control mr-1" placeholder="Account Status" ReadOnly="True"></asp:TextBox>
                                        <asp:LinkButton ID="ActiveLinkButton" runat="server" Text="S" class="btn btn-success mr-1"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:LinkButton ID="DeactivateLinkButton" runat="server" Text="D" class="btn btn-danger mr-1"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox ID="DOBTextBox" runat="server" CssClass="form-control" placeholder="dd-mm-yyyy" TextMode="Date" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <%--COL 6 - CONTACT # & EMAIL ROW--%>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox ID="ContNumTextBox" runat="server" CssClass="form-control" placeholder="Contact #" TextMode="Phone" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>Email Address</label>
                                <div class="form-group">
                                    <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control" placeholder="Email Address" TextMode="Email" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%--COL 4 - COUNTRY,CITY & ZIP CODE ROW--%>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Country</label>
                                <div class="form-group">
                                    <asp:TextBox ID="CountryTextBox" runat="server" class="form-control" placeholder="Country" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox ID="CityTextBox" runat="server" class="form-control" placeholder="City/Parish" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Zip Code</label>
                                <div class="form-group">
                                    <asp:TextBox ID="ZipCodeTextBox" runat="server" class="form-control" placeholder="Zip Code" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%--COL 12 - FULL ADDRESS ROW--%>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control" placeholder="Full Address" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%--COL 12 -BUTTON ROW--%>
                        <div class="row text-center">
                            <div class="col-md-12 text-center mx-auto"> 
                                    <center>
                                        <asp:Button ID="DeletePermButton" runat="server" Text="Delete User Permanently" class="btn btn-danger btn-block btn-lg" />
                                    </center>
                            </div>
                        </div>

                    </div>
                </div>

                <br />
                <a href="Default.aspx"> <b> << Back to Home </b> </a> 
                <br /> <br />
            </div>

            <div class="col-md-7 card-border product-polaroid">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <br /> <br />
                            <div class="col">
                                <center>
                                    <h4>User List</h4>
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
                                <asp:GridView ID="UserListGridView" runat="server" class="table table-striped table-bordered"></asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
