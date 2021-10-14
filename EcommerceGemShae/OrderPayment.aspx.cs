using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceGemShae
{
    public partial class OrderPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CardDetailsConnectionString"].ConnectionString);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                string insertQuery = "insert into carddetails_master(name,card_num,expiration_date,cvv,billing_address) " +
                    "values (@name,@cardnum,@expirationdate,@cvv,@billingaddress)";

                SqlCommand cmd = new SqlCommand(insertQuery, conn);

                cmd.Parameters.AddWithValue("@name", NameTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@cardnum", CardNumberTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@expirationdate",ExpirationDateTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@cvv", CVVTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@billingaddress", BillingAddressTextBox.Text.Trim());

                cmd.ExecuteNonQuery();

                //Response.Write("<script>alert('Test');</script>");
                conn.Close();

                Response.Write("<script>alert('Payment Made Successfully');</script>");
                StatusLabel.Text = "Payment made Successfully";

                Session["address"] = BillingAddressTextBox.Text.Trim();
                Response.Redirect("PdfGenerate.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}