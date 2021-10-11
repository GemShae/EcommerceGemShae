<%@ Page Title="Admin User Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminUserManagement.aspx.cs" Inherits="EcommerceGemShae.AdminUserManagement" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /> <br />
    <div class="container-fluid">
        <div class="row">
            <br /> <br />
            <div class="col-md-5 ">

                <div class="card card-border product-polaroid">
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
                            <div class="col-md-5">
                                <label>User ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="USerIDTextBox" runat="server" CssClass="form-control" placeholder="User ID"></asp:TextBox>
                                        <asp:LinkButton ID="GoSearchLinkButton" runat="server" Text="Go" class="btn btn-primary" OnClick="GoSearchLinkButton_Click"></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-7">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="FullNameTextBox" runat="server" CssClass="form-control" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%--COL 6 - ACCOUNT STATUS & DOB ROW--%>
                        <div class="row">
                            <div class="col-md-7">
                                <label>Account Status</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="AccStatusTextBox" runat="server" CssClass="form-control" placeholder="Account Status" ReadOnly="True"></asp:TextBox>
                                        <asp:LinkButton ID="ActiveLinkButton" runat="server" Text="S" class="btn btn-success" OnClick="ActiveLinkButton_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:LinkButton ID="DeactivateLinkButton" runat="server" Text="D" class="btn btn-danger" OnClick="DeactivateLinkButton_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox ID="DOBTextBox" runat="server" CssClass="form-control" placeholder="dd-mm-yyyy" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <%--COL 6 - CONTACT # & EMAIL ROW--%>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox ID="ContNumTextBox" runat="server" CssClass="form-control" placeholder="Contact #" TextMode="Number" ReadOnly="True"></asp:TextBox>
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
                        <div class="row ">
                            <div class="col-8 mx-auto"> 
                                    <center>
                                        <asp:Button ID="DeletePermButton" runat="server" Text="Delete User Permanently" class="btn btn-danger btn-block btn-lg" OnClick="DeletePermButton_Click" />
                                    </center>
                            </div>
                        </div>
                        <a href="Default.aspx"> <b> << Back to Home </b> </a> 

                    </div>
                </div>

            </div>

            <div class="col-md-7 ">

                <div class="card">
                    <div class="card-body card-border product-polaroid">

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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UserTableConnectionString %>" SelectCommand="SELECT * FROM [user_master]"></asp:SqlDataSource>
                            <div class="col-md-12">
                                <asp:GridView ID="UserListGridView" runat="server" class="table table-bordered thead-dark table-hover table-responsive-md" AutoGenerateColumns="False" DataKeyNames="user_id" DataSourceID="SqlDataSource1" AllowSorting="True">
                                    <Columns>
                                        <asp:BoundField DataField="user_id" HeaderText="User ID" ReadOnly="True" SortExpression="user_id" />
                                        <asp:BoundField DataField="full_name" HeaderText="Full Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
                                        <asp:BoundField DataField="contact_num" HeaderText="Contact Num." SortExpression="contact_num" />
                                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                        <asp:BoundField DataField="country" HeaderText="Country" SortExpression="country" />
                                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
