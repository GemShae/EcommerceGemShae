﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EcommerceGemShae._Default" %>

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

</asp:Content>
