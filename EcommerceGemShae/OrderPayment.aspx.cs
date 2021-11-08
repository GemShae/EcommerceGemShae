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
        bool isTrue = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsSecureConnection)
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "OrderPayment.aspx";
                Response.Redirect(url);
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            if (Session["buyitems"] != null && Session["orderid"] != null)
            {
                DataTable dataTable = (DataTable)Session["buyitems"];

                for (int i=0; i<=dataTable.Rows.Count-1; i++)
                {
                    string productId = dataTable.Rows[i]["PID"].ToString();
                    int productQuantity = Convert.ToInt16(dataTable.Rows[i]["PQuantity"]);

                    try
                    {
                        SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductTableConnectionString"].ConnectionString);

                        SqlDataAdapter da = new SqlDataAdapter("select current_stock from product_master where product_id ='" + productId + "' ", sconn);

                        DataTable dataTable1 = new DataTable();
                        da.Fill(dataTable1);

                        int quanitiy = Convert.ToInt16(dataTable1.Rows[0][0]);

                        if (quanitiy > 0)
                        {
                            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OrderTableConnectionString"].ConnectionString);

                            if (conn.State == ConnectionState.Closed)
                            {
                                conn.Open();
                            }

                            string insertOrder = "insert into orderdetails_master(order_id,item_num,username,product_id,quantity,subtotal,date_time) " +
                                "values (@orderid,@itemnum,@username,@productid,@quantity,@subtotal,@datetime)";

                            SqlCommand cmd = new SqlCommand(insertOrder, conn);

                            cmd.Parameters.AddWithValue("@orderid", Session["orderid"]);
                            cmd.Parameters.AddWithValue("@itemnum", dataTable.Rows[i]["Num"]);
                            cmd.Parameters.AddWithValue("@username", Session["username"]);
                            cmd.Parameters.AddWithValue("@productid", dataTable.Rows[i]["PID"]);
                            cmd.Parameters.AddWithValue("@quantity", dataTable.Rows[i]["PQuantity"]);
                            cmd.Parameters.AddWithValue("@subtotal", dataTable.Rows[i]["PSTotal"]);
                            cmd.Parameters.AddWithValue("@datetime", DateTime.Now.ToString());

                            cmd.ExecuteNonQuery();

                            conn.Close();                           
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "');</script>");
                    }
                }
                DecreaseQuantity();
                Payment();
                ClearCart();
                Session["buyitems"] = null;

                Response.Write("<script>alert('Payment Made Successfully');</script>");
                StatusLabel.Text = "Payment made Successfully";

                Response.Redirect("PdfGenerate.aspx");
            }
            else
            {
                Response.Redirect("ShoppingCart.aspx");
            }
            
        }

        public void Payment()
        {
            if (isTrue== true)
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
                    cmd.Parameters.AddWithValue("@expirationdate", ExpirationDateTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@cvv", CVVTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@billingaddress", BillingAddressTextBox.Text.Trim());

                    cmd.ExecuteNonQuery();

                    //Response.Write("<script>alert('Test');</script>");
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                } 
            }
            Session["address"] = BillingAddressTextBox.Text;

        }

        public void DecreaseQuantity()
        {
            DataTable dataTable = (DataTable)Session["buyitems"];

            for (int i=0; i<=dataTable.Rows.Count-1; i++)
            {
                int productId = Convert.ToInt16(dataTable.Rows[i]["PID"]);
                int productQuantity = Convert.ToInt16(dataTable.Rows[i]["PQuantity"]);

                try
                {
                    SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductTableConnectionString"].ConnectionString);

                    SqlDataAdapter da = new SqlDataAdapter("select current_stock from product_master where product_id =" + productId + "' ", sconn);

                    DataTable dataTable1 = new DataTable();
                    da.Fill(dataTable1);

                    int quanitiy = Convert.ToInt16(dataTable1.Rows[0][0]);

                    if (quanitiy > 0)
                    {
                        int reducedStock = quanitiy - productQuantity;

                        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductTableConnectionString"].ConnectionString);

                        if (conn.State == ConnectionState.Closed)
                        {
                            conn.Open();
                        }

                        SqlCommand cmd = new SqlCommand("update product_master set current_stock='" + reducedStock + "' where product_id='"
                            + productId + "' ",conn);

                        cmd.ExecuteNonQuery();

                        conn.Close();
                        isTrue = true;
                    }
                    else
                    {
                        isTrue = false;
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        public void ClearCart()
        {
            DataTable dataTable = (DataTable)Session["buyitems"];

            for (int i=0; i<=dataTable.Rows.Count-1; i++)
            {
                int productId = Convert.ToInt16(dataTable.Rows[i]["PID"]);

                try
                {
                    SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["CartDetailsConnectionString"].ConnectionString);

                    if (conn2.State == ConnectionState.Closed)
                    {
                        conn2.Open();
                    }

                    string deleteQuery = "delete from cartdetails_master where username='" + Session["username"] + "' ";

                    SqlCommand cmd = new SqlCommand(deleteQuery, conn2);

                    cmd.ExecuteNonQuery();
                    conn2.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }

        }
    }
}