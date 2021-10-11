﻿<%@ Page Title="Admin Product Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminProductInventory.aspx.cs" Inherits="EcommerceGemShae.AdminProductInventory" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });

       function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();

               reader.onload = function (e) {
                   $('#product-img').attr('src', e.target.result);
               };

               reader.readAsDataURL(input.files[0]);
           }
       }
    </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /> <br />
    <div class="container-fluid">
        <div class="row">
            <br /> <br />
            <div class="col-md-5">

                <div class="card card-border product-polaroid">
                    <div class="card-body">

                        <%--TITLE ROW--%>
                        <div class="row">
                            <br /> <br />
                            <div class="col">
                                <center>
                                    <h4>Product Details</h4>
                                </center>
                            </div>
                        </div>

                        <%--IMAGE ROW--%>
                        <div class="row">
                            <div class="col">
                                <center> <img id="product-img" width="350" alt="User Icon" src="images/GEM logo (wide).png" /> </center>
                            </div>
                        </div>

                        <%--HR ROW--%>
                        <div class="row">
                            <div class="col">
                                <hr class="rounded-hr" />
                            </div>
                        </div>

                        <%--COL 12 - FILE IMAGE UPLOAD--%>
                        <div class="row">
                            <div class="col-md-12">
                                <asp:FileUpload ID="ImageFileUpload" runat="server" class="form-control" onchange="readURL(this);"/>
                            </div>
                        </div>

                        <br />

                        <%--COL 4,8 - PRODUCT ID & NAME--%>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Product ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="ProductIDTextBox" runat="server" CssClass="form-control" placeholder="Product ID"></asp:TextBox>
                                        <asp:LinkButton ID="GoSearchLinkButton" runat="server" Text="Go" class="btn btn-primary" OnClick="GoSearchLinkButton_Click"></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>Product Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="ProductNameTextBox" runat="server" CssClass="form-control" placeholder="Product Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%--COL 12 - CATEGORY--%>
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
                       
                        <%--COL 12 - PRODUCT COST--%>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Product Cost (Per Unit)</label>
                                <div class="form-group">
                                    <asp:TextBox ID="ProductCostTextBox" runat="server" CssClass="form-control" placeholder="Product Cost (Per Unit)" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <%--COL 4,4,4 - A & C STOCK + SOLD--%>
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

                        <%--COL 12 - BUTTONS--%>
                        <div class="row">
                            <div class="col-md-4"> 
                                <asp:Button ID="AddButton" runat="server" Text="Add" class="btn btn-success btn-block btn-lg" OnClick="AddButton_Click" Font-Bold="True" />
                            </div>
                            <div class="col-md-4"> 
                                <asp:Button ID="UpdateButton" runat="server" Text="Update" class="btn btn-warning btn-block btn-lg" OnClick="UpdateButton_Click" />
                            </div>
                            <div class="col-md-4"> 
                                <asp:Button ID="DeleteButton" runat="server" Text="Delete" class="btn btn-danger btn-block btn-lg" OnClick="DeleteButton_Click" />
                            </div>
                        </div>

                        <asp:Label ID="StatusLabel" runat="server" Text="" style="color:#E1B12C" Font-Bold="True" Font-Italic="True"></asp:Label> <br /><br />

                        <a href="Default.aspx"> <b> << Back to Home </b> </a> 
                        <br /> <br />

                    </div>
                </div>

            </div>

            <div class="col-md-7 ">

                <div class="card card-border product-polaroid">
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProductTableConnectionString %>" SelectCommand="SELECT * FROM [product_master]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView ID="ProductListGridView" runat="server" class="table table-bordered thead-dark table-hover table-responsive-md" AutoGenerateColumns="False" DataKeyNames="product_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="product_id" HeaderText="ID" ReadOnly="True" SortExpression="product_id" >
                                        
                                        <ControlStyle Font-Bold="True" />
                                        <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>
                                        
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-9">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("product_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Category - <asp:Label ID="ProductCategoryLabel" runat="server" Text='<%# Eval("category") %>' Font-Bold="True"></asp:Label>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Cost - $<asp:Label ID="ProductCostLabel" runat="server" Text='<%# Eval("product_cost") %>' Font-Bold="True"></asp:Label>
                                                                    &nbsp;| Actual Stock -
                                                                    <asp:Label ID="ActualStockLabel" runat="server" Font-Bold="True" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                                    &nbsp;| Available Stock -
                                                                    <asp:Label ID="CurrentStockLabel" runat="server" Font-Bold="True" Text='<%# Eval("current_stock") %>'></asp:Label>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Description -
                                                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("product_description") %>'></asp:Label>

                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="col-lg-3">
                                                            <asp:Image class="img-fluid image-size product-image" ID="Image1" runat="server" ImageUrl='<%# Eval("product_img_link") %>' />
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
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
