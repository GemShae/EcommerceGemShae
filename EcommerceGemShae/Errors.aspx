<%@ Page Title="Error" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Errors.aspx.cs" Inherits="EcommerceGemShae.Errors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br /> <br />
    <div class="container">
        <div class="row home-subscribe">
            <div class="col-12 text-center">
                <br />
                <h3>An error occured while processing your request. The support team has been notified and are working on the solution.</h3>
                <h4>For further information contact us: </h4>
            </div>
         </div>
        <div id="top-header">
                <div class="container-fluid">
                    <div class="row">
                        <%--On any device always take 12 spaces--%>
                        <div class="col-12 text-center"> 
                            <a class="p-1" href="tel:18764680474"> <i class="fas fa-phone"></i> 18764680474 </a> &nbsp;&nbsp;&nbsp; 
                            <a class="p-1" href="mailto:shanyaconnell@gmail.com"> <i class="fas fa-envelope"></i> shanyaconnell@gmail.com </a>
                        </div>
                    </div>
                </div>
            </div>
    </div>

</asp:Content>
