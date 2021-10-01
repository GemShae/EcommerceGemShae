<%@ Page Title="Admin Product Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminProductInventory.aspx.cs" Inherits="EcommerceGemShae.AdminProductInventory" %>
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
                                <center>
                                    <h4>Product Details</h4>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center> <img width="350" alt="User Icon" src="images/GEM logo (wide).png" /> </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr class="rounded-hr" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <asp:FileUpload ID="ImageFileUpload" runat="server" class="form-control"/>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <label>Product ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="ProductIDTextBox" runat="server" CssClass="form-control" placeholder="Product ID"></asp:TextBox>
                                        <asp:LinkButton ID="GoSearchLinkButton" runat="server" Text="Go" class="btn btn-primary"></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-9">
                                <label>Product Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="ProductNameTextBox" runat="server" CssClass="form-control" placeholder="Product Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <label>Category</label>
                                <div class="form-group">
                                    <asp:ListBox ID="CategoryListBox" runat="server" SelectionMode="Multiple" CssClass="form-control" Rows="2">
                                        <asp:ListItem>Photography</asp:ListItem>
                                        <asp:ListItem>Audio</asp:ListItem>
                                        <asp:ListItem>Entertainment</asp:ListItem>
                                        <asp:ListItem>Videography</asp:ListItem>
                                        <asp:ListItem>Motivational Speaking</asp:ListItem>
                                    </asp:ListBox>
                                </div>
                            </div>
                        </div>
                       
                        <div class="row">
                            <div class="col-md-12">
                                <label>Product Cost (Per Unit)</label>
                                <div class="form-group">
                                    <asp:TextBox ID="ProductCostTextBox" runat="server" CssClass="form-control" placeholder="Product Cost (Per Unit)" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Actual Stock</label>
                                <div class="form-group">
                                    <asp:TextBox ID="ActualStockTextBox" runat="server" class="form-control" placeholder="Actual Stock" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Current Stock</label>
                                <div class="form-group">
                                    <asp:TextBox ID="CurrentStockTextBox" runat="server" class="form-control" placeholder="Current Stock" ReadOnly="True" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label>Products Sold</label>
                                <div class="form-group">
                                    <asp:TextBox ID="ProductsSoldTextBox" runat="server" class="form-control" placeholder="Products Sold" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <label>Product Description</label>
                                <div class="form-group">
                                    <asp:TextBox ID="ProductDesTextBox" runat="server" CssClass="form-control" placeholder="Product Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4"> 
                                <asp:Button ID="AddButton" runat="server" Text="Add" class="btn btn-success btn-block btn-lg" />
                            </div>
                            <div class="col-md-4"> 
                                <asp:Button ID="UpdateButton" runat="server" Text="Update" class="btn btn-warning btn-block btn-lg" />
                            </div>
                            <div class="col-md-4"> 
                                <asp:Button ID="DeleteButton" runat="server" Text="Delete" class="btn btn-danger btn-block btn-lg" />
                            </div>
                        </div>

                    </div>
                </div>

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
                                    <h4>Product Inventory List</h4>
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
                                <asp:GridView ID="ProductListGridView" runat="server" class="table table-striped table-bordered"></asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
