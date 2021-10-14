<%@ Page Title="OrderPayment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderPayment.aspx.cs" Inherits="EcommerceGemShae.OrderPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br /> <br />


     <div class="container pt-3">
        <div class="row">
            <br /> <br />
            <div class="col-md-6 mx-auto">

                <div class="card product-polaroid card-border">
                    <div class="card-body">

                        <%--TITLE ROW--%>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h3>Card Details</h3>
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
                                    <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" placeholder="Name" BorderColor="Black" BorderWidth="2px" Font-Bold="True" Font-Size="Medium"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server" ErrorMessage="Name is Empty" ControlToValidate="NameTextBox" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="NameRegularExpressionValidator" runat="server" ErrorMessage="Characters only Allowed" ControlToValidate="NameTextBox" ForeColor="Red" ValidationExpression="^[A-Za-z]*$">*</asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>

                        <%--COL 12 - IMAGE ROW--%>
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Image ID="PaymentImage" runat="server" BorderColor="Black" BorderWidth="2px" ImageUrl="~/images/PayMethod.gif" class="img-fluid image-size"/>
                            </div>
                        </div>

                        <%--COL 12 - Card Number ROW--%>
                        <div class="row pt-4">
                            <div class="col-md-12">
                                <label>Card Number</label>
                                <div class="form-group">
                                    <asp:TextBox ID="CardNumberTextBox" runat="server" CssClass="form-control" placeholder="16 Digits" Font-Bold="True" BorderColor="Black" BorderWidth="2px" Font-Size="Medium"></asp:TextBox>   
                                    <asp:RequiredFieldValidator ID="CNRequiredFieldValidator" runat="server" ErrorMessage="Card Number is Empty" ControlToValidate="CardNumberTextBox" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Card Number must be 16 Digits" ControlToValidate="CardNumberTextBox" ForeColor="Red" ValidationExpression="[0-9]{16}">*</asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>

                        <%--COL 6 - EXPIRATION DATE & CVV ROW--%>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Expiration Date</label>
                                <div class="form-group">
                                    <asp:TextBox ID="ExpirationDateTextBox" runat="server" CssClass="form-control" placeholder="MM/YYYY(Eg:142001)" BorderColor="Black" BorderWidth="2px" Font-Bold="True" Font-Size="Medium"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ExpireRequiredFieldValidator" runat="server" ErrorMessage="Expiration Date is Empty" ControlToValidate="ExpirationDateTextBox" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label>CVV</label>
                                <div class="form-group">
                                    <asp:TextBox ID="CVVTextBox" runat="server" CssClass="form-control" placeholder="3 Digits" BorderColor="Black" BorderWidth="2px" Font-Bold="True" Font-Size="Medium"></asp:TextBox>   
                                    <asp:RequiredFieldValidator ID="CVVRequiredFieldValidator" runat="server" ErrorMessage="CVV is Empty" ControlToValidate="CVVTextBox" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="CVVRegularExpressionValidator" runat="server" ErrorMessage="CVV must be 3 Digits" ControlToValidate="CVVTextBox" ForeColor="Red" ValidationExpression="[0-9]{3}">*</asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>

                        <%--COL 12 - BILLING ADDRESS ROW--%>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Billing Address</label>
                                <div class="form-group">
                                    <asp:TextBox ID="BillingAddressTextBox" runat="server" CssClass="form-control" placeholder="Billing Address" TextMode="MultiLine" Rows="2" BorderWidth="2px" Font-Bold="True" Font-Size="Large" BorderColor="Black"></asp:TextBox> 
                                    <asp:RequiredFieldValidator ID="BillingAddressRequiredFieldValidator" runat="server" ErrorMessage="Billing Address is Empty" ControlToValidate="BillingAddressTextBox" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <%--COL 12 -BUTTON ROW--%>
                        <div class="row text-center">
                            <div class="col-md-12 text-center"> 
                                <div class="form-group">
                                    <center>
                                        <asp:Button ID="SubmitButton" runat="server" Text="Submit" class="btn btn-success btn-block btn-lg" Font-Bold="True" OnClick="SubmitButton_Click"/>
                                    </center>
                                </div>

                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" Font-Bold="True" Font-Italic="True" ForeColor="Red" HeaderText="Fix the following errors:" />
                            </div>
                        </div>

                        <asp:Label ID="StatusLabel" runat="server" Text="" style="color:#E1B12C" Font-Bold="True" Font-Italic="True"></asp:Label> 
                        <br />
                        <a href="ShoppingCart.aspx"> <b> << Back to Cart </b> </a> 

                    </div>
                </div>

            </div>
        </div>

         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CardDetailsConnectionString %>" SelectCommand="SELECT * FROM [carddetails_master]"></asp:SqlDataSource>

    </div> 

</asp:Content>
