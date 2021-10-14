<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PdfGenerate.aspx.cs" Inherits="EcommerceGemShae.PdfGenerate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <br /> <br />
    <div class="container">

        <div class="row">
            <br /> <br />
            <div class ="col-md-12">

                <div class="card product-polaroid card-border">
                    <div class="card-body">

                        <asp:Panel ID="Panel1" runat="server">

                            <%--TITLE ROW--%>
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h3>Retail Invoice</h3>
                                    </center>
                                </div>
                            </div>

                            <%--HR ROW--%>
                            <div class="row">
                                <div class="col">
                                    <hr class="rounded-hr" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    Order Number:
                                    <asp:Label ID="OrderNumLabel" runat="server" Text="Label"></asp:Label>
                                    <br /><br />
                                    Order Date:
                                    <asp:Label ID="OrderDTLabel" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    Buyer's Address:
                                    <br />
                                    <asp:Label ID="BuyerAddLabel" runat="server" Text="Label"></asp:Label>
                                </div>

                                <div class="col-md-6">
                                    Seller's Address:
                                    <br />
                                    Water Ln, Montego Bay
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <asp:GridView ID="GridView1" runat="server" class="table table-bordered thead-dark table-hover table-responsive-md" AutoGenerateColumns="False">

                                        <Columns>
                                            <asp:BoundField DataField="item_num" HeaderText="#">
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="product_id" HeaderText="Product ID">
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="product_name" HeaderText="Product Name">
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="quantity" HeaderText="Quantity">
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="product_cost" HeaderText="Price">
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="subtotal" HeaderText="Sub Total">
                                            <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                        </Columns>

                                    </asp:GridView>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col text-center">
                                    Grand Total: $
                                    <asp:Label ID="GrandTLabel" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col text-center">
                                    THIS IS A COMPUTER GENERATED INVOICE.
                                </div>
                            </div>

                        </asp:Panel>

                         <%--COL 12 -BUTTON ROW--%>
                        <div class="row text-center">
                            <div class="col-md-12 text-center"> 
                                <center>
                                    <asp:Button ID="DownloadButton" runat="server" Text="Download Invoice" Font-Bold="True" class="btn btn-info btn-lg" OnClick="DownloadButton_Click"/>
                                </center>
                             </div>
                        </div>
                        
                        <a href="Default.aspx"> <b> << Back to Home </b> </a> 

                    </div>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
