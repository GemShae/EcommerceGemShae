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
    public partial class ShoppingCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["buyitems"] == null)
                {
                    BuyItemsButton.Enabled = false;
                }
                else
                {
                    BuyItemsButton.Enabled = true;
                }

                //Adding product to Gridview
                Session["addproduct"] = false;

                DataTable dataTable = new DataTable();
                DataRow dataRow;

                dataTable.Columns.Add("Num");
                dataTable.Columns.Add("PID");
                dataTable.Columns.Add("PName");
                dataTable.Columns.Add("PImage");               
                dataTable.Columns.Add("PPrice");
                dataTable.Columns.Add("PQuantity");
                dataTable.Columns.Add("PSTotal");

                if (Request.QueryString["id"] != null)
                {
                    if (Session["buyitems"] == null)
                    {
                        dataRow = dataTable.NewRow();

                        try
                        {
                            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductTableConnectionString"].ConnectionString);

                            if (conn.State == ConnectionState.Closed)
                            {
                                conn.Open();
                            }

                            SqlDataAdapter da = new SqlDataAdapter("select * from product_master where product_id =" + Request.QueryString["id"], conn);

                            DataSet dataSet = new DataSet();
                            da.Fill(dataSet);

                            dataRow["Num"] = 1;
                            dataRow["PID"] = dataSet.Tables[0].Rows[0]["product_id"].ToString();
                            dataRow["PName"] = dataSet.Tables[0].Rows[0]["product_name"].ToString();
                            dataRow["PImage"] = dataSet.Tables[0].Rows[0]["product_img_link"].ToString();
                            dataRow["PPrice"] = dataSet.Tables[0].Rows[0]["product_cost"].ToString();
                            dataRow["PQuantity"] = Request.QueryString["quantity"];

                            //Response.Write("<script>alert('"+dataRow["PName"].ToString()+"');</script>");

                            //int price = Convert.ToInt32(dataSet.Tables[0].Rows[0]["PPrice"].ToString());
                            int price = Convert.ToInt32(dataRow["PPrice"].ToString());
                            int quantity = Convert.ToInt32(Request.QueryString["quantity"].ToString());
                            int subtotalPrice = price * quantity;
                            dataRow["PSTotal"] = subtotalPrice;

                            //Response.Write("<script>alert('"+ dataRow["PSTotal"].ToString() + "');</script>");

                            dataTable.Rows.Add(dataRow);

                            //Response.Write("<script>alert('Add data Row');</script>");

                            CartGridView.DataSource = dataTable;
                            CartGridView.DataBind();
                            Session["buyitems"] = dataTable;
                            BuyItemsButton.Enabled = true;

                            CartGridView.FooterRow.Cells[5].Text = "Total Cost";
                            CartGridView.FooterRow.Cells[6].Text = GrandTotal().ToString();
                            Response.Redirect("ShoppingCart.aspx");
                        }
                        catch (Exception ex)
                        {
                            Response.Write("<script>alert('" + ex.Message + "');</script>");
                        }
                    }
                    else
                    {
                        dataTable = (DataTable)Session["buyitems"];
                        int numOfItems;
                        numOfItems = dataTable.Rows.Count;

                        dataRow = dataTable.NewRow();

                        try
                        {
                            SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductTableConnectionString"].ConnectionString);

                            if (sconn.State == ConnectionState.Closed)
                            {
                                sconn.Open();
                            }

                            SqlDataAdapter da = new SqlDataAdapter("select * from product_master where product_id =" + Request.QueryString["id"], sconn);

                            DataSet dataSet = new DataSet();
                            da.Fill(dataSet);

                            dataRow["Num"] = numOfItems + 1;
                            dataRow["PID"] = dataSet.Tables[0].Rows[0]["product_id"].ToString();
                            dataRow["PName"] = dataSet.Tables[0].Rows[0]["product_name"].ToString();
                            dataRow["PImage"] = dataSet.Tables[0].Rows[0]["product_img_link"].ToString();
                            dataRow["PPrice"] = dataSet.Tables[0].Rows[0]["product_cost"].ToString();
                            dataRow["PQuantity"] = Request.QueryString["quantity"];

                            int price = Convert.ToInt32(dataRow["PPrice"].ToString());
                            int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                            int subtotalPrice = price * quantity;
                            dataRow["PSTotal"] = subtotalPrice;

                            dataTable.Rows.Add(dataRow);
                            CartGridView.DataSource = dataTable;
                            CartGridView.DataBind();
                            Session["buyitems"] = dataTable;
                            BuyItemsButton.Enabled = true;


                            CartGridView.FooterRow.Cells[5].Text = "Total Cost";
                            CartGridView.FooterRow.Cells[6].Text = GrandTotal().ToString();
                            Response.Redirect("ShoppingCart.aspx");
                        }
                        catch (Exception ex)
                        {
                            Response.Write("<script>alert('" + ex.Message + "');</script>");
                        }
                    }
                }
                else
                {
                    dataTable = (DataTable)Session["buyitems"];
                    CartGridView.DataSource = dataTable;
                    CartGridView.DataBind();

                    if (CartGridView.Rows.Count > 0)
                    {
                        CartGridView.FooterRow.Cells[5].Text = "Total Cost";
                        CartGridView.FooterRow.Cells[6].Text = GrandTotal().ToString();
                    }
                }
            }

            string orderDate = DateTime.Now.ToShortDateString();
            Session["orderdate"] = orderDate;
            OrderId();

        }

        //My Functions

        //Calculating Grand Total or Final Cost
        public int GrandTotal()
        {
            DataTable dataTable = new DataTable();
            dataTable = (DataTable)Session["buyitems"];

            int numOfRows = dataTable.Rows.Count;
            int i = 0;
            int totalCost = 0;

            while (i < numOfRows)
            {
                totalCost = totalCost + Convert.ToInt32(dataTable.Rows[i]["PSTotal"].ToString());
                i++;
            }

            return totalCost;
        }

        //Generating Unique Oder Id
        public void OrderId()
        {
            String alpha = "abCdefghIjklmNopqrStuvwXyz0123456789";
            Random random = new Random();
            char[] charArray = new char[5];

            for (int i=0; i<5; i++)
            {
                charArray[i] = alpha[(int)(15 * random.NextDouble())];
            }

            string orderId;
            orderId = "Order_Id: " + DateTime.Now.Hour.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString() +
                DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(charArray) + DateTime.Now.Minute.ToString() +
                DateTime.Now.Second.ToString();

            Session["orderid"] = orderId;
        }

        //Deleting Row from Cart
        protected void CartGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dataTable = new DataTable();
            dataTable = (DataTable)Session["buyitems"];

            for (int i=0; i<=dataTable.Rows.Count-1; i++)
            {
                int numofItems;
                int numofItems2;
                string qdata;
                string dataTableData;

                numofItems = Convert.ToInt32(dataTable.Rows[i]["Num"].ToString());
                TableCell tableCell = CartGridView.Rows[e.RowIndex].Cells[0];
                qdata = tableCell.Text;
                dataTableData = numofItems.ToString();
                numofItems2 = Convert.ToInt32(qdata);

                if (numofItems == numofItems2)
                {
                    dataTable.Rows[i].Delete();
                    dataTable.AcceptChanges();
                    //Item has been deleted from cart
                    break;
                }
            }

            //Setting Number of Items after deleting a row from cart
            for (int i=1; i<=dataTable.Rows.Count; i++)
            {
                dataTable.Rows[i - 1]["Num"] = i;
                dataTable.AcceptChanges();
            }

            Session["buyitems"] = dataTable;
            Response.Redirect("ShoppingCart.aspx");
        }

        protected void BuyItemsButton_Click(object sender, EventArgs e)
        {
            DataTable dataTable;
            dataTable = (DataTable)Session["buyitems"];

            for (int i=0; i<=dataTable.Rows.Count-1; i++)
            {
                try
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

                    Response.Write("<script>alert('Order Placed Successfully');</script>");

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }

            if (Session["role"] == null)
            {
                Response.Redirect("UserLogin.aspx");
            }
            else
            {
                if (CartGridView.Rows.Count.ToString() == "0")
                {
                    Response.Write("<script>alert('Cart is Empty. Cannot place order');</script>");
                }
                else
                {
                    Response.Redirect("PlaceOrder.aspx");
                }
            }

        }
    }
}