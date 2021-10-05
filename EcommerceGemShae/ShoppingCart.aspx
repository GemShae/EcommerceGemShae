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
                        <li class="breadcrumb-item active">Shopiing Cart</li>
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
                <div class="col-12 text-center cart-header">
                    <h2> You Have the Following Products in Your Cart. </h2>
                </div>
            </div>

            <div class="row home-subscribe">
                <div class="col-12 text-right">
                    <asp:TextBox ID="SearchTextBox" runat="server" Height="28px" Width="180px" Font-Bold="True" ForeColor="#E1B12C"></asp:TextBox>
                    <asp:ImageButton ID="SearchImageButton" runat="server" Height="25px" ImageUrl="~/images/magnifying-glass.png" Width="25px" OnClick="SearchImageButton_Click" />
                </div>
            </div>
            <br />
            <div class="row">
                
            </div>
        </div>
    </section>

</asp:Content>
