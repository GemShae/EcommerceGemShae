<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="EcommerceGemShae.Products" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--START PRODUCTS PAGE FIRST SECTION - BREADCRUMPS--%>
    <section class="breadcrumbs-section">
        <div class="container pl-3 pr-3 p-sm-3">
            <div class="row">
                <div class="col-12 pl-2">
                    <h2> <%: Title %> </h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"> <a href="Default.aspx">Home</a> </li>
                        <li class="breadcrumb-item active">Products</li>
                    </ol>
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
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h3> Our Products </h3>
                </div>
            </div>
            <div class="row">
                <%--FIRST PRODUCT - PHOTOSHOOT--%>
                <div class="col-md-4 text-center product-polaroid">
                    <img class="img-fluid p-2 p-sm-3 product-image" alt="PhotoShoot" src="images/Upendo.JPG" />

                    <div class="polaroid-container">
                        <h4>Photo Shoot</h4>
                        ID: <asp:Label ID="PhotoShootIdLabel" runat="server" Text="0001"></asp:Label> <br />
                        <asp:TextBox ID="PhotoShootDescriptionTextBox" runat="server" ReadOnly="True" Text="Professionally taken photos for any occasion.
Personal or Group. 
Location can be anywhere of your choice. 
Pictures delivered via online mediums of your choice."
                            BorderStyle="Groove" TextMode="MultiLine" Height="100px" OnTextChanged="PhotoShootDescriptionTextBox_TextChanged" Width="330px"></asp:TextBox> <br />

                        Category: <asp:Label ID="CategoryPhotoShootLabel" runat="server" Text="Photography"></asp:Label> <br />
                        Unit Price: JMD $ <asp:Label ID="PhotoShootUnitPriceLabel" runat="server" Text="5000"></asp:Label>
                    </div>
                </div>
                <%--SECOND PRODUCT - DJ--%>
                <div class="col-md-4 text-center product-polaroid">
                    <img class="img-fluid p-2 p-sm-3 product-image" alt="DJ" src="images/Djing.JPG" />
                    <div class="polaroid-container">
                        <h4>Disc Jockey (DJ) </h4>
                        ID: <asp:Label ID="DJIdLabel" runat="server" Text="0002"></asp:Label> <br />
                        <asp:TextBox ID="DJDescriptionTextbox" runat="server" TextMode="MultiLine" ReadOnly="True" Text="Professional music of different genres based on function. 
Location can be anywhere of choice. 
Equipment may be provided for an extra cost." BorderStyle="Groove" Height="100px" Width="330px"></asp:TextBox> <br />

                        Category: <asp:Label ID="CategoryAudioLabel" runat="server" Text="Audio/Music"></asp:Label> <br />
                        Unit Price: JMD $ <asp:Label ID="DJUnitPriceLabel" runat="server" Text="5000"></asp:Label>
                    </div>
                </div> 
                <%--THIRD PRODUCT - DANCERS--%>
                <div class="col-md-4 text-center product-polaroid">
                    <img class="img-fluid p-2 p-sm-3 product-image" alt="Dancer" src="images/Dancer.jpg" />
                    <div class="polaroid-container">
                        <h4>Dancer/s </h4>
                        ID: <asp:Label ID="DancerIdLabel" runat="server" Text="0003"></asp:Label> <br />
                        <asp:TextBox ID="DanceDescriptionTextbox" runat="server" ReadOnly="True" Text="Professional Dancer/s versatile with coming up with routines to various genres."
                            BorderStyle="Groove" TextMode="MultiLine" Height="100px" Width="330px"></asp:TextBox> <br />

                        Category: <asp:Label ID="CategoryEULabel" runat="server" Text="Entertainment Unit"></asp:Label> <br />
                        Unit Price: JMD $ <asp:Label ID="DancerUnitPriceLabel" runat="server" Text="4000"></asp:Label>
                    </div>
                </div> 
            </div>
            <div class="row">
                <%--FOURTH PRODUCT - M.S.--%>
                <div class="col-md-6 text-center product-polaroid">
                    <img class="img-fluid p-2 p-sm-3 product-image" alt="Motivational Speaking" src="images/Shanya MS.jpg" />
                    <div class="polaroid-container">
                        <h4>Motivational Speaking </h4>
                        ID: <asp:Label ID="MSIdLabel" runat="server" Text="0004"></asp:Label> <br />
                        <asp:TextBox ID="MSDescriptionTextbox" runat="server" ReadOnly="True" Text="Professional speaking on topics related to theme of function."
                            BorderStyle="Groove" TextMode="MultiLine" Height="100px" Width="330px"></asp:TextBox> <br />

                        Category: <asp:Label ID="CategoryEUMSLabel" runat="server" Text="Entertainment Unit"></asp:Label> <br />
                        Unit Price: JMD $ <asp:Label ID="MSUnitPriceLabel" runat="server" Text="3000"></asp:Label>
                    </div>
                </div>
                <%--FIFTH PRODUCT - Video Editing--%>
                <div class="col-md-6 text-center product-polaroid">
                    <img class="img-fluid p-2 p-sm-3 product-image" alt="Video Editing" src="images/Videoing.JPG" />
                    <div class="polaroid-container">
                        <h4>Video Editing </h4>
                        ID: <asp:Label ID="VEIdLabel" runat="server" Text="0005"></asp:Label> <br />
                        <asp:TextBox ID="VEDescriptionTextbox" runat="server" ReadOnly="True" Text="Professionally edited videos to create the vision wanted."
                            BorderStyle="Groove" TextMode="MultiLine" Height="100px" Width="330px"></asp:TextBox> <br />

                        Category: <asp:Label ID="CategoryVLabel" runat="server" Text="Videography"></asp:Label> <br />
                        Unit Price: JMD $ <asp:Label ID="VUnitPriceLabel" runat="server" Text="1000"></asp:Label>
                    </div>
                </div> 
            </div>
        </div>
    </section>
    <%--END PRODUCTS PAGE 2ND SECTION - PRODUCTS--%>

</asp:Content>
