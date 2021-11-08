<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="EcommerceGemShae.ProductsTwo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <%--START PRODUCTS PAGE FIRST SECTION - BREADCRUMPS--%>
    <section class="breadcrumbs-section">
        <div class="container pt-2">
            <div class="row">
                <div class="col-md-10 pl-3">
                    <br /> <br />
                    <h2> <%: Title %> </h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"> <a href="Default.aspx">Home</a> </li>
                        <li class="breadcrumb-item active">Products</li>
                    </ol>
                </div>
                <div class="col-md-2 text-center pt-3">
                    <br /> <br />
                    <img class="img-fluid image-size" alt="Gem Logo" src="images/GEM logo.png" width="80" />
                </div>
            </div>
        </div>
    </section>
    <%--END PRODUCTS PAGE FIRST SECTION - BREADCRUMPS--%>

      <%--START PRODUCTS PAGE 2ND SECTION - PRODUCTS--%>
    <section class="products-section">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <p>
                        We offer a range of products from photography to motivational speaking to help you achieve the results you're after. 
                        Not sure what you need, or what it costs? We can explain what services are right for you and tell you more about our fees. 
                        <a href="Contact.aspx"> Get in touch &raquo; </a>
                    </p>
                    <hr />
                </div>
            </div>
        </div>
    </section>

    <section class="products-section">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 text-center">
                    <h3> Our Products </h3>
                </div>
            </div>

            <div class="row home-subscribe">
                <div class="col-md-6 text-right">
                    Sort By:&nbsp; 
                    <asp:DropDownList ID="CategoryDropDownList" runat="server" OnSelectedIndexChanged="CategoryDropDownList_SelectedIndexChanged" AutoPostBack="True" Font-Bold="True" Font-Size="Medium" ForeColor="#E1B12C">
                        <asp:ListItem>Select Category</asp:ListItem>
                        <asp:ListItem>Photography</asp:ListItem>
                        <asp:ListItem>Audio</asp:ListItem>
                        <asp:ListItem>Entertainment Unit</asp:ListItem>
                        <asp:ListItem>Videography</asp:ListItem>
                        <asp:ListItem>Motivational Speaking</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-6 text-right">
                    <asp:TextBox ID="SearchTextBox" runat="server" Height="28px" Width="180px" Font-Bold="True" ForeColor="#E1B12C"></asp:TextBox>
                    <asp:ImageButton ID="SearchImageButton" runat="server" Height="25px" ImageUrl="~/images/magnifying-glass.png" Width="25px" OnClick="SearchImageButton_Click" />
                </div>
            </div>
            <br />
            <div class="row">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProductTableConnectionString %>" SelectCommand="SELECT [product_id], [product_name], [category], [product_cost], [product_description], [current_stock], [product_img_link] FROM [product_master]"></asp:SqlDataSource>

                <div class="col">
                    <asp:DataList ID="ProductDataList" runat="server" DataKeyField="product_id" DataSourceID="SqlDataSource1" Width="900px" RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="5" CellSpacing="10" OnItemCommand="ProductDataList_ItemCommand" OnCancelCommand="ProductDataList_CancelCommand1">
                        
                        <ItemTemplate>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-12 text-center product-polaroid">

                                        <div class="polaroid-container">
                                             <div class="row">
                                                 <div class="col-12 text-center">
                                                     <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("product_id") %>' Font-Bold="True" Font-Names="Forte" ForeColor="#E1B12C" Font-Size="Large"></asp:Label> &nbsp;|
                                                     <asp:Label ID="ProductName" runat="server" Text='<%# Eval("product_name") %>' Font-Bold="True" Font-Names="Forte" ForeColor="#E1B12C" Font-Size="Large"></asp:Label>            
                                                 </div>
                                             </div>
                                            <div class="row">
                                                 <div class="col-12">
                                                     <asp:Image ID="ProductImage1" runat="server" class="img-fluid image-size p-2 p-sm-3 product-image" ImageUrl='<%# Eval("product_img_link") %>'/> 
                                                 </div>
                                                <div class="col-md-4 current-stock">
                                                     Stock:
                                                     <asp:Label ID="StockLabel" runat="server" Text='<%# Eval("current_stock") %>'></asp:Label>
                                                </div>
                                             </div>
                                            <div class="row">
                                                 <div class="col-12 text-center">
                                                     <asp:Label ID="ProductCategoryLabel" runat="server" Text='<%# Eval("category") %>' Font-Bold="True" Font-Names="Copperplate Gothic Bold" ForeColor="#CC00CC" Font-Italic="True" Font-Size="Large"></asp:Label> <br />
                                                     <asp:TextBox ID="ProductDescriptionTextBox" runat="server" Text='<%# Eval("product_description") %>' TextMode="MultiLine" Font-Bold="True" ForeColor="#E1B12C" ReadOnly="True" BorderStyle="Outset" class="image-size" Height="100px" Width="330px" BorderColor="#0000CC"></asp:TextBox> <br /> 
                                                     <asp:Label ID="ProductCostLabel" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="White" Text="Price: $" Font-Size="Medium"></asp:Label>
                                                     <asp:Label ID="ProductCostLabelDatabase" runat="server" Text='<%# Eval("product_cost") %>' Font-Bold="True" Font-Names="Arial" ForeColor="White" Font-Size="Medium"></asp:Label>            
                                                 </div>
                                             </div>
                                            <div class="row">
                                                 <div class="col-12">
                                                     <asp:Label ID="QuantityLabel" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="White" Text="Quantity:" Font-Size="Medium"></asp:Label>
                                                     <asp:DropDownList ID="QuantityDropDownList" runat="server">

                                                         <asp:ListItem>1</asp:ListItem>
                                                         <asp:ListItem>2</asp:ListItem>
                                                         <asp:ListItem>3</asp:ListItem>
                                                         <asp:ListItem>4</asp:ListItem>
                                                         <asp:ListItem>5</asp:ListItem>

                                                     </asp:DropDownList>                
                                                 </div>
                                             </div>
                                            <div class="row">
                                                 <div class="col-12">
                                                     <asp:ImageButton ID="CartImageButton" runat="server" ImageUrl="~/images/shopping-basket.png" Width="60px" CommandArgument='<%# Eval("product_id") %>' CommandName="AddToCart"/>              
                                                 </div>
                                             </div>

                                        </div>

                                    </div>
                                </div>
                            </div>

                        
                        </ItemTemplate>

                    </asp:DataList>
                </div> 
                
            </div>
        </div>


    </section>




</asp:Content>
