<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductsOld.aspx.cs" Inherits="EcommerceGemShae.Products" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <section class="products-section">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h3> Our Products </h3>
                </div>
            </div>

            <div class="row">
                <%--FIRST PRODUCT - CANON EOS 6D MARK II--%>
                <div class="col-md-4 text-center product-polaroid">
                    <img class="img-fluid image-size p-2 p-sm-3 product-image" alt="Canon EOS 6D Mark II" src="images/Canon EOS 6D Mark II.jpg" />

                    <div class="polaroid-container">
                        <asp:Label ID="ProductName1" runat="server" Text="Canon EOS 6D Mark II Digital SLR Camera Body, Wi-Fi Enabled" Font-Bold="True" Font-Size="Medium"></asp:Label> <br />
                        
                        ID: <asp:Label ID="ProductIDLabel1" runat="server" Text="001"></asp:Label> <br />
                        
                        <asp:TextBox ID="ProductDescriptionTextBox1" runat="server" ReadOnly="True" Text="26.2 Megapixel full frame CMOS sensor
Optical viewfinder with a 45 point all cross type AF system. Compatible Lenses: Canon EF lenses (excluding EF S and EF M lenses)
Dual Pixel CMOS AF with phase detection and Full HD 60p
DIGIC 7 Image Processor, GPS, Wi-Fi, NFC and Bluetooth low energy
Vary angle touch screen, 3.0 inch LCD
Standard Power Supply: Battery Pack LP E6N, LP E6"
                            BorderStyle="Outset" TextMode="MultiLine" class="image-size" Height="100px" Width="330px" BorderColor="#0000CC"></asp:TextBox> <br />

                        Category: <asp:Label ID="ProductCategoryLabel1" runat="server" Text="Photography"></asp:Label> <br />
                        Unit Price: USD $ <asp:Label ID="ProductUnitPriceLabel1" runat="server" Text="1799.00"></asp:Label>
                    </div>
                </div>
                <%--SECOND PRODUCT - NUMARK DJ CONTROLLER--%>
                <div class="col-md-4 text-center product-polaroid">
                    <img class="img-fluid image-size p-2 p-sm-3 product-image" alt="Numark DJ Controller" src="images/Numark Party Mix II - DJ Controller with Party Lights.jpg" />
                    
                    <div class="polaroid-container">
                        <asp:Label ID="ProductName2" runat="server" Text="Numark Party Mix II - DJ Controller with Party Lights" Font-Bold="True" Font-Size="Medium"></asp:Label> <br />
                        
                        ID: <asp:Label ID="ProductIDLabel2" runat="server" Text="002"></asp:Label> <br />
                        
                        <asp:TextBox ID="ProductDescriptionTextBox2" runat="server" TextMode="MultiLine" ReadOnly="True" Text="USB DJ Equipment for beginners with 2 DJ decks of control, built-in audio interface and plug and play USB connectivity for Mac, PC and iOS
Built-in LED DJ light show syncs to your DJ mix; Sync, Play/Pause &amp; Cue buttons; 2 DJ decks with large touch-sensitive jog wheels
DJ Headphones output and 1/8-inch main output to connect to DJ speakers; integrated DJ mixer with 2-band EQ channel faders and crossfader
" BorderStyle="Outset" class="image-size" Height="100px" Width="330px" BorderColor="#0000CC"></asp:TextBox> <br />

                        Category: <asp:Label ID="ProductCategoryLabel2" runat="server" Text="Audio"></asp:Label> <br />
                        Unit Price: USD $ <asp:Label ID="ProductUnitPriceLabel2" runat="server" Text="129.00"></asp:Label>
                    </div>
                </div> 
                <%--THIRD PRODUCT - DISCO BALL DISCO LIGHTS--%>
                <div class="col-md-4 text-center product-polaroid">
                    <img class="img-fluid image-size p-2 p-sm-3 product-image" alt="Disco Ball Disco Lights" src="images/Disco Ball Disco Lights.jpg" />
                    
                    <div class="polaroid-container">
                        <asp:Label ID="ProductName3" runat="server" Text="Disco Ball Disco Lights" Font-Bold="True" Font-Size="Medium"></asp:Label> <br />

                        ID: <asp:Label ID="ProductIDLabel3" runat="server" Text="003"></asp:Label> <br />
                        
                        <asp:TextBox ID="ProductDescriptionTextBox3" runat="server" ReadOnly="True" Text="Sound Activated Storbe Light With Remote Control
Bright RGB 7 colours strobe light with remote that has AUTO/FLASH/MUSIC MODE: With Solid Colors Or A Mix (red, green, blue, red/green, red/blue, green/blue, or all the colors together).
Perfectly portable mini LED stage magic light with small (palm size) and exquisite appearance which is super easy to assemble and hang up"
                            BorderStyle="Outset" TextMode="MultiLine" class="image-size" Height="100px" Width="330px" BorderColor="#0000CC"></asp:TextBox> <br />

                        Category: <asp:Label ID="ProductCategoryLabel3" runat="server" Text="Entertainment Unit"></asp:Label> <br />
                        Unit Price: USD $ <asp:Label ID="ProductUnitPriceLabel3" runat="server" Text="13.99"></asp:Label>
                    </div>
                </div> 
            </div>
            <div class="row">
                <%--FOURTH PRODUCT - 4K CAMCORDER--%>
                <div class="col-md-4 text-center product-polaroid">
                    <img class="img-fluid image-size p-2 p-sm-3 product-image" alt="4K Camcorder ZOHULU Vlog Camera" src="images/4K Camcorder ZOHULU.jpg" />
                    
                    <div class="polaroid-container">
                        <asp:Label ID="ProductName4" runat="server" Text="4K Camcorder ZOHULU Vlog Camera" Font-Bold="True" Font-Size="Medium"></asp:Label> <br />

                        ID: <asp:Label ID="ProductIDLabel4" runat="server" Text="004"></asp:Label> <br />
                        
                        <asp:TextBox ID="ProductDescriptionTextBox4" runat="server" ReadOnly="True" Text="4K Ultra HD Video Camera with 3840x2160 (24FPS) video resolution / 13.0MP Sony CMOS sensor / 3.1” Inch IPS touch screen / 30X Digitally enhanced zoom.
Infrared night vision and full spectrum video recorder
External Stereo Microphone uses enhanced X-Y stereo pickup technology, clear and stable sound image localization
0.39X 2 in 1 HD wide-angle lens with macro lens which is great for large scenery
Specially Designed Handheld Stabilizer"
                            BorderStyle="Outset" TextMode="MultiLine" class="image-size" Height="100px" Width="330px" BorderColor="#0000CC"></asp:TextBox> <br />

                        Category: <asp:Label ID="ProductCategoryLabel4" runat="server" Text="Videography"></asp:Label> <br />
                        Unit Price: USD $ <asp:Label ID="ProductUnitPriceLabel4" runat="server" Text="249.88"></asp:Label>
                    </div>
                </div> 
                <%--FIFTH PRODUCT - PODIUM STAND--%>
                <div class="col-md-4 text-center product-polaroid">
                    <img class="img-fluid image-size p-2 p-sm-3 product-image" alt="Podium Stand" src="images/Bonnlo Classic Lectern Podium Stand.jpg" />
                    
                    <div class="polaroid-container">
                        <asp:Label ID="ProductName5" runat="server" Text="Bonnlo Classic Lectern Portable Podium Stand" Font-Bold="True" Font-Size="Medium"></asp:Label> <br />
                        
                        ID: <asp:Label ID="ProductIDLabel5" runat="server" Text="005"></asp:Label> <br />
                        
                        <asp:TextBox ID="ProductDescriptionTextBox5" runat="server" ReadOnly="True" Text="Built with the art high pressure thermal-fused laminate and thickened metal pipe, which makes this stand more stable and durable.
Easy to assemble
Steel frame adjusts with ease using the handy screw on knob handle
his stand is featured by a modern attractive design ,which makes it be suitable for virtually any public speaking venue
"
                            BorderStyle="Outset" TextMode="MultiLine" class="image-size" Height="100px" Width="330px" BorderColor="#0000CC"></asp:TextBox> <br />

                        Category: <asp:Label ID="ProductCategoryLabel5" runat="server" Text="Moticational Speaking"></asp:Label> <br />
                        Unit Price: USD $ <asp:Label ID="ProductUnitPriceLabel5" runat="server" Text="69.99"></asp:Label>
                    </div>
                </div>
                <%--SIXTH PRODUCT - CAMERA TRIPOD--%>
                <div class="col-md-4 text-center product-polaroid">
                    <img class="img-fluid image-size p-2 p-sm-3 product-image" alt="Camera Tripod" src="images/UBeesize Camera Tripod.jpg" />

                    <div class="polaroid-container">
                        <asp:Label ID="ProductName6" runat="server" Text="UBeesize 67” Camera Tripod with Travel Bag" Font-Bold="True" Font-Size="Medium"></asp:Label> <br />

                        ID: <asp:Label ID="ProductIDLabel6" runat="server" Text="006"></asp:Label> <br />

                        <asp:TextBox ID="ProductDescriptionTextBox6" runat="server" BorderStyle="Outset" class="image-size" TextMode="MultiLine" Height="100px" Width="330px" BorderColor="#0000CC">Collapsing to tabeletop height 20.1 inches and expanding to 67.3 inches in only a few seconds, this tripod fully adapts to a range of different user heights and enables you to compose your photos more creatively than ever before
Adjusts to multiple shooting angles in only a few seconds, including Landscape Mode, Portrait Mode, Low Angle Shot, and High Angle Shot
The tripod provides a universal 360° rotating phone holder, extending from 58mm(2.3Inches) to 115mm（4.5Inches) that fits most smartphones.
A Camera Stand for All Cameras(Nikon D3500, Fujifilm X-T200, Canon EOS 250D, Olympus, Panasonic), Cell Phones, Ipad, Projector, Webcam, Gopro and Spotting Scopes.

</asp:TextBox> <br />
                        Category: <asp:Label ID="ProductCategoryLabel6" runat="server" Text="Photography,Videography"></asp:Label> <br />
                        Unit Price: USD $ <asp:Label ID="ProductUnitPriceLabel6" runat="server" Text="37.99"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%--END PRODUCTS PAGE 2ND SECTION - PRODUCTS--%>

</asp:Content>
