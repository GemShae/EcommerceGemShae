<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EcommerceGemShae._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--START HOME PAGE FIRST SECTION--%>
    <section class="top-section pt-4 pb-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-5">
                    <br />
                    <h4> Changing Lives One Gem At A Time</h4>
                    <h1>Best in Media Products</h1>
                    <h5>We specialize in Photography, Videography, Audio including Dj'ing and Mixing of tracks, Motivational Speaking and 
                        Entertainment including Singers and a Dance Unit.</h5>
                    <h4>Always remember that there's a GEM in everyone!</h4> <br />
                    
                    <asp:Button ID="HomeToProducts" runat="server" Text="View Products" BorderStyle="Groove" OnClick="HomeToProducts_Click" ForeColor="#0000CC" />

                </div>
                
                <div class="col-md-7">
                    <img alt="Drone in Air" src="images/DroneInAir.JPG" height="300"/>
                </div>
            </div>
        </div>
    </section>
    <%--END HOME PAGE FIRST SECTION--%>
    

</asp:Content>
