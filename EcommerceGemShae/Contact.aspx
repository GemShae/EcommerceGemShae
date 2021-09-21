<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="EcommerceGemShae.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--START CONTACT PAGE FIRST SECTION - BREADCRUMPS--%>
    <section class="breadcrumbs-section">
        <div class="container pl-3 p-sm-3">
            <div class="row">
                <div class="col-12 pl-2">
                    <h2> <%: Title %> Us</h2>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"> <a href="Default.aspx">Home</a> </li>
                        <li class="breadcrumb-item active">Contact Us</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>
    <%--END CONTACT PAGE FIRST SECTION - BREADCRUMPS--%>

   <%--START CONTACT PAGE 2ND SECTION - INTRO--%>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <p>
                        Would you like to ask a question regarding our products? Gem-Shae Specialists are here to advise and assist you. 
                        Send us your questions below and be sure to include your email address so we can reply to your request. 
                        One of our specialists will contact you within 1 business day. <br /> <br />
                         
                        Thank you for your interest in Gem-Shae Enterprise!
                    </p>
                    <hr />
                </div>
            </div>
        </div>
    </section>
   <%--END CONTACT PAGE 2NDT SECTION - INTRO--%>

    <%--START CONTACT PAGE 3RD SECTION - FORMS--%>
    <section class="form-section">
        <div class="container">
            <div class="row">
                 <%--LEFT SIDE FORM--%>
                <div class="col-md-6">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <input id="FullNameText" type="text" class="form-control" placeholder="Full name *" required="required" />
                        </div> 
                        <div class="form-group col-md-6">
                            <input id="EmailText" type="email" class="form-control" placeholder="Email *" required="required" />
                        </div> 
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <input id="SubjectText" type="text" class="form-control" placeholder="Subject *" />
                        </div>  
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <textarea id="TextAreaBody" rows="5" class="form-control" placeholder="Type your message here..." required="required"></textarea>
                        </div>  
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12 text-center">
                            <button type="submit" class="btn btn-primary"> <i class="fas fa-paper-plane"></i> Send Message </button>
                        </div>  
                    </div>
                </div>

                <%--RIGHT SIDE FORM--%>
                <div class="col-md-6 address">
                    <h5>Call Us / Whatsapp</h5>
                    <p> <a href="tel:18764680474"> <i class="fas fa-phone"></i> 18764680474 </a> <br /> </p>

                    <h5>Email</h5>
                    <p> <a href="mailto:shanyaconnell@gmail.com"> <i class="fas fa-envelope"></i> shanyaconnell@gmail.com </a> <br /> </p>

                    <h5>Address</h5>
                    <p>
                        19 Water Lane, <br />
                        Montego Bay, St James. <br />
                        Jamaica, West Indies.
                    </p>
                </div>
            </div>
        </div>
    </section>
    <%--END CONTACT PAGE 3RD SECTION - FORMS--%>

    <%--START CONTACT PAGE 4TH SECTION - MAP--%>
    <section>
        <div class="container-fluid text-center embed-responsive embed-responsive-16by9">
            <iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3784.246374233627!2d-77.92225418528!3d18.472496087437!2m3!1f0!2f0!3f0!3m
                2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8eda2a7b84c83d7f%3A0x568386f55f010d9d!2s18%20Water%20Ln%2C%20Montego%20Bay!5e0!3m2!1sen!2sjm!4v163168
                1147545!5m2!1sen!2sjm" frameborder="0" style="border:0" width="1200" height="400"> </iframe>
        </div>
    </section>
    <%--END CONTACT PAGE 4TH SECTION - MAP--%>
    
</asp:Content>
