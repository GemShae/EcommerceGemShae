<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="EcommerceGemShae.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    
    <%--START ABOUT PAGE FIRST SECTION - BREADCRUMPS--%>
    <section class="breadcrumbs-section">
        <div class="container p-1 p-sm-3">
            <div class="row">
                <div class="col-12 pl-2">
                    <h2> <%: Title %> Us</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"> <a href="Default.aspx">Home</a> </li>
                        <li class="breadcrumb-item active">About Us</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>
    <%--END ABOUT PAGE FIRST SECTION - BREADCRUMPS--%>

    <%--START ABOUT PAGE 2ND SECTION - ABOUT THE COMPANY--%>
    <section class="about-company-section">
        <div class="container p-1 p-sm-3">
            <div class="row">
                <div class="col-12 text-center">
                    <h2> <%: Title %> Gem-Shae Enterprise</h2>
                    <hr />
                </div>
                <div class="col-md-3 text-center">
                    <img class="img-fluid image-size" alt="Gem Logo" src="images/GEM logo.png" width="260" />
                </div>
                <div class="col-md-9 text-center">
                    <br /> 
                    <p>
                        Established in 2017, Gem-Shae Enterprise has developed and evolved to provide our clients with the best service in the world. 
                        So, whether you’re hosting a private party, corporate function, or wedding, let us help you make it one to remember. We have 
                        the experience and understanding of the planning and preparation that goes into running a successful event, and that means 
                        we’ll always provide you with the best options possible that fall within your budget. Whatever your event, we can help make 
                        it amazing.
                    </p>
                    <p>
                        We also strive to educate everyone that they are indeed GEMS and they can do and be anything that they want to if they 
                        acknowledge that they are GEMS. 
                    </p>
                    <p>
                        <b> BE A GEM! </b>
                    </p>
                </div>
            </div>
        </div>
    </section>
    <%--END ABOUT PAGE 2ND SECTION - ABOUT THE COMPANY--%>

    <hr class="rounded-hr" />

    <%--START ABOUT PAGE 3RD SECTION - EMPLOYEES--%>
    <section class="pt-3 pb-4">
        <div class="container">
            <div class="row mt-4">
                <div class="col-12 text-center">
                    <h3> Our Awesome Team </h3>
                </div>
                <hr />
            </div>

            <div class="row">
                <div class="col-md-4 text-center p-4">
                    <img class="img-fluid p-5 qualities-img" alt="Ceo" src="images/Shanya.JPG" width="200" />
                    <h5> Ceo </h5>
                    <p>  
                        <i>Shanya Connell</i>
                    </p>
                </div>
                <div class="col-md-4 text-center p-4">
                    <img class="img-fluid p-5 qualities-img" alt="Photographer" src="images/Jaida.JPG" width="200" />
                    <h5> Photographer </h5>
                    <p>  
                        <i>Jaida Walker</i>
                    </p>
                </div>
                <div class="col-md-4 text-center p-4">
                    <img class="img-fluid p-5 qualities-img" alt="Dancer" src="images/Igal.JPG" width="200" height="30"/>
                    <h5> Dancer </h5>
                    <p>  
                        <i>Igal Scott</i>
                    </p>
                </div>
            </div>
        </div>
    </section>
    <%--END ABOUT PAGE 3RD SECTION - EMPLOYEES--%>


</asp:Content>
