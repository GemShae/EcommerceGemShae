<%@ Page Title="OrderPayment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderPayment.aspx.cs" Inherits="EcommerceGemShae.OrderPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br /> <br />
    <div class="container pt-3">
        <div class="row">
            <br /> <br />
            <div class="col-md-8 mx-auto">

                <div class="card product-polaroid card-border">
                    <div class="card-body">

                        <%--TITLE ROW--%>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Card Details</h4>
                                </center>
                            </div>
                        </div>

                        <%--HR ROW--%>
                        <div class="row">
                            <div class="col">
                                <hr class="rounded-hr" />
                            </div>
                        </div>

                        <%--COL 12 - NAME ROW--%>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Name on card</label>
                                <div class="form-group">
                                    <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="FullNameRequiredFieldValidator" runat="server" ControlToValidate="FullNameTextBox" ErrorMessage="Name is empty" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="NameRegularExpressionValidator" runat="server" ErrorMessage="Only Characters Allowed" ControlToValidate="NameTextBox" ForeColor="Red" ValidationExpression="^[A-Za-z]*$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>

                        <%--COL 12 - Card Number ROW--%>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Card Number</label>
                                <div class="form-group">
                                    <asp:TextBox ID="CardNumberTextBox" runat="server" CssClass="form-control" placeholder="16 Digits"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FullNameTextBox" ErrorMessage="Card Number is empty" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Idk yet CN" ControlToValidate="CardNumberTextBox" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>

                        <%--COL 6 - EXPIRATION DATE & CVV ROW--%>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Expiration Date</label>
                                <div class="form-group">
                                    <asp:TextBox ID="ExpirationDateTextBox" runat="server" CssClass="form-control" placeholder="MM/YYYY"></asp:TextBox>                                    
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>CVV</label>
                                <div class="form-group">
                                    <asp:TextBox ID="CVVTextBox" runat="server" CssClass="form-control" placeholder="3 Digits"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="CvvRequiredFieldValidator" runat="server" ControlToValidate="CVVTextBox" ErrorMessage="CVV is empty" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <%--COL 12 - BILLING ADDRESS ROW--%>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Billing Address</label>
                                <div class="form-group">
                                    <asp:TextBox ID="BillingAddressTextBox" runat="server" CssClass="form-control" placeholder="Billing Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="BillingAddressRequiredFieldValidator" runat="server" ControlToValidate="BillingAddressTextBox" ErrorMessage="Billing Address is empty" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <%--COL 12 -BUTTON ROW--%>
                        <div class="row text-center">
                            <div class="col-md-12 text-center"> 
                                <div class="form-group">
                                    <center>
                                        <asp:Button ID="SubmitButton" runat="server" Text="Submit" class="btn btn-success btn-block btn-lg"/>
                                    </center>
                                </div>

                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" Font-Bold="True" Font-Italic="True" ForeColor="Red" />
                            </div>
                        </div>

                        <asp:Label ID="StatusLabel" runat="server" Text="" style="color:#E1B12C" Font-Bold="True" Font-Italic="True"></asp:Label> 
                        <br />
                        <a href="ShoppingCart.aspx"> <b> << Back to Cart </b> </a> 

                    </div>
                </div>

            </div>
        </div>

    </div>

</asp:Content>
