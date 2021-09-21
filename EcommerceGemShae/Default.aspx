<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EcommerceGemShae._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--START HOME PAGE FIRST SECTION--%>
    <section class="top-section pt-4 pb-5">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center pt-8">
                    <br /> <br /> 
                    <h4> "Changing Lives One Gem At A Time"</h4>
                    <h1>Best in Media Products</h1>
                    <h5>We specialize in Photography, Videography, Audio including Dj'ing and Mixing of tracks, Motivational Speaking and 
                        Entertainment including Singers and a Dance Unit.</h5>
                    <h4>Always remember that there's a GEM in everyone!</h4> <br />
                    
                    <asp:Button ID="HomeToProducts" runat="server" Text="View Products" BorderStyle="Groove" OnClick="HomeToProducts_Click" ForeColor="#0000CC" />

                </div>
                
                <div class="col-md-6">
                    <br />
                    <img class="rounded img-fluid mx-auto d-block default-image image-size" alt="Drone in Air" src="images/DroneInAir.JPG" height="200"/>
                </div>
            </div>
        </div>
    </section>
    <%--END HOME PAGE FIRST SECTION--%>
    
    <%--START HOME PAGE SECOND SECTION - OUR QUALITIES--%>
    <section class="pt-3 pb-4">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h3> Lots of Media Companies around. Why should you choose us?</h3>
                </div>
                <hr />
            </div>

            <div class="row">
                <div class="col-md-4 text-center p-4">
                    <img class="img-fluid p-5 qualities-img" alt="Quality Assurance" src="images/high-quality.png" />
                    <h4> Quality Assurance </h4>
                    <p> Quality is the central edifice of our products and we make no compromise on it. </p>
                </div>
                <div class="col-md-4 text-center p-4">
                    <img class="img-fluid p-5 qualities-img" alt="On-Time" src="images/actual.png" />
                    <h4> On-Time Service </h4>
                    <p> When you buy our products, you can be rest assured that it will be delivered on time. </p>
                </div>
                <div class="col-md-4 text-center p-4">
                    <img class="img-fluid p-5 qualities-img" alt="Value of Money" src="images/bank.png" />
                    <h4> Value of Money </h4>
                    <p> Get the best service for the money you pay us. We assure to give you the value for money. </p>
                </div>
            </div>
        </div>
    </section>
    <%--END HOME PAGE SECOND SECTION - OUR QUALITIES--%>

    <%--START HOME PAGE 4th SECTION - ABOUT GEM-SHAE E--%>
    <section class="p-2 pb-md-5">
        <div class="container">
            <div class="row">
                <hr class="rounded-hr" />
                <div class="col-md-6 text-center pt-5">
                    <br />
                    <h2>About Gem-Shae Enterprise</h2>
                    <h5>Established in 2017, Gem-Shae Enterprise has developed and evolved to provide our clients with the best service in 
                        the world. So, whether you’re hosting a private party, corporate function, or wedding, let us help you make it one 
                        to remember. 
                    </h5>
                    <asp:Button ID="HomeToAbout" runat="server" class="btn-lg" Text="Read More" BorderStyle="Groove" ForeColor="#0000CC" OnClick="HomeToAbout_Click" />
                </div>
                <div class="col-md-6 pb-4">
                    <asp:Image ID="DroneonStand" runat="server" ImageUrl="~/images/DroneOnStand.JPG" Width="400px" Class="img-fluid image-size rounded default-image p-3" /> 
                </div>
            </div>
        </div>
    </section>
    <%--END HOME PAGE 4th SECTION - ABOUT GEM-SHAE E--%>
    <br /> 
    <%--START HOME PAGE 5th SECTION - Subscribe--%>
        <section class="home-subscribe pt-3">
            <div class="row">
                <div class="col-12 text-center">
                    <h3>Subscribe to get notified of new products </h3>
                </div>
            </div>
            <div class="row">
                <div class="container input-group pb-3">
                        <input type="email" class="form-control" placeholder="Enter your email" aria-label="Enter your email" />
                        <div class="input-group-btn">
                            <button class="btn btn-theme" type="submit"> Subscribe </button>
                        </div>
                </div>
            </div>
        </section>
    <%--END HOME PAGE 5th SECTION - Subscribe--%>

    <%--START HOME PAGE 6th SECTION - PRODUCTS--%>
    <section class="pt-3 pb-4">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h3 style="font-family: 'Commercial Script BT', arial;"> Featured Products... </h3>
                </div>
                <hr />
            </div>

            <div class="row ">
                <div class="col-md-4 text-center p-4">
                    <img class="img-fluid p-5 qualities-img" alt="Photography" src="images/camera.png" />
                    <h4 style="font-family: 'Commercial Script BT', arial;"> Photgraphy </h4>
                    <p> We make sure to offer our cliente with photography packages that are available to them digitally to suit their 
                        unique needs and provide customizable choices they’re sure to love. </p>
                </div>
                <div class="col-md-4 text-center p-4">
                    <img class="img-fluid p-5 qualities-img" alt="On-Time" src="images/dancing.png" />
                    <h4 style="font-family: 'Commercial Script BT', arial;"> Entertainment </h4>
                    <p> You can trust our team to provide you with amazing entertainment at your event. Check out what we’ve got to offer. </p>
                </div>
                <div class="col-md-4 text-center p-4">
                    <img class="img-fluid p-5 qualities-img" alt="Value of Money" src="images/press-conference.png" />
                    <h4 style="font-family: 'Commercial Script BT', arial;"> Motivational Speaking </h4>
                    <p> Professional speaking on topics related to theme of function. </p>
                </div>
            </div>
        </div>
    </section>
    <%--END HOME PAGE SECOND SECTION - PRODUCTS--%>
</asp:Content>
