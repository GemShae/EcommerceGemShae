<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="EcommerceGemShae.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%--START SHOPPING PAGE FIRST SECTION - BREADCRUMPS--%>
    <section class="breadcrumbs-section">
        <div class="container pl-3 pr-3 p-sm-3">
            <div class="row">
                <div class="col-md-9 pl-2">
                    <h2> <%: Title %> </h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"> <a href="Products.aspx">Products</a> </li>
                        <li class="breadcrumb-item active">Shopping Cart</li>
                    </ol>
                </div>
                <div class="col-md-3 text-center">
                    <br /> <br />
                    <img class="img-fluid image-size" alt="Gem Logo" src="images/GEM logo.png" width="120" />
                </div>
            </div>
        </div>
    </section>
    <%--END SHOPPING PAGE FIRST SECTION - BREADCRUMPS--%>

    <section class="products-section">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 text-center cart-header pt-3">
                    <h2> You Have the Following Products in Your Cart. </h2>
                </div>
            </div>

            <div class="row home-subscribe">
                <div class="col-12 text-center">
                    <asp:HyperLink ID="ContinueShopHyperLink" runat="server" Font-Bold="True" Font-Size="X-Large" NavigateUrl="~/Products.aspx" ForeColor="White">Continue Shopping</asp:HyperLink>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-12 card-border product-polaroid text-center">

                    <div class="card"> 
                        <div class="card-body">

                            <div class="row text-center">
                                <asp:GridView ID="CartGridView" runat="server" AutoGenerateColumns="False" EmptyDataText="No Products in Shopping Cart" Font-Bold="True" ShowFooter="True" OnRowDeleting="CartGridView_RowDeleting" class="table-responsive-md table-hover container-fluid">
                                    <Columns>
                                        <asp:BoundField DataField="Num" HeaderText="#">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>

                                        <asp:BoundField DataField="PID" HeaderText="Product ID">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>

                                        <asp:ImageField DataImageUrlField="PImage" HeaderText="Product Image">
                                            <ControlStyle Width="350px" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:ImageField>

                                        <asp:BoundField DataField="PName" HeaderText="Product Name">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>

                                        <asp:BoundField DataField="PPrice" HeaderText="Price">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>

                                        <asp:BoundField DataField="PQuantity" HeaderText="Quantity">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>

                                        <asp:BoundField DataField="PSTotal" HeaderText="Sub Total">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>

                                        <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
                                    </Columns>
                                    <FooterStyle BackColor="#0097E6" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#30336B" ForeColor="#E1B12C" HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>

                        </div>
                    </div>

                    

                    <br />

                    <asp:Button ID="BuyItemsButton" runat="server" Text="Place Order" BackColor="#FC427B" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="45px" Width="135px" OnClick="BuyItemsButton_Click" />
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OrderTableConnectionString %>" SelectCommand="SELECT * FROM [orderdetails_master]"></asp:SqlDataSource>
            </div>
        </div>
    </section>

</asp:Content>
