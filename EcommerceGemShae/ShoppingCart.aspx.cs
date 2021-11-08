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
            if (!Request.IsSecureConnection)
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "ShoppingCart.aspx";
                Response.Redirect(url);
            }

            if (!IsPostBack)
            {
                if (Session["buyitems"] == null)
                {
                    BuyItemsButton.Enabled = false;
                    //Response.Redirect("UserLogin.aspx");
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
                dataTable.Columns.Add("PDesc");
                dataTable.Columns.Add("PPrice");
                dataTable.Columns.Add("PQuantity");
                dataTable.Columns.Add("PCategory");
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
                            dataRow["PDesc"] = dataSet.Tables[0].Rows[0]["product_description"].ToString();
                            dataRow["PPrice"] = dataSet.Tables[0].Rows[0]["product_cost"].ToString();
                            dataRow["PQuantity"] = Request.QueryString["quantity"];
                            dataRow["PCategory"] = dataSet.Tables[0].Rows[0]["category"].ToString();

                            //Response.Write("<script>alert('"+dataRow["PName"].ToString()+"');</script>");

                            //int price = Convert.ToInt32(dataSet.Tables[0].Rows[0]["PPrice"].ToString());
                            int price = Convert.ToInt32(dataRow["PPrice"].ToString());
                            int quantity = Convert.ToInt32(Request.QueryString["quantity"].ToString());
                            int subtotalPrice = price * quantity;
                            dataRow["PSTotal"] = subtotalPrice;

                            //Response.Write("<script>alert('"+ dataRow["PSTotal"].ToString() + "');</script>");

                            dataTable.Rows.Add(dataRow);

                            //Response.Write("<script>alert('Add data Row');</script>");

                            SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["CartDetailsConnectionString"].ConnectionString);

                            if (conn2.State == ConnectionState.Closed)
                            {
                                conn2.Open();
                            }

                            string insertQuery = "insert into cartdetails_master(item_num,product_id,product_name,product_description,product_img_link,product_cost,quantity,category,username) " +
                                "values (@itemnum,@productid,@productname,@productdescription,@productimg,@productcost,@quantity,@category,@username)";

                            SqlCommand cmd = new SqlCommand(insertQuery, conn2);

                            cmd.Parameters.AddWithValue("@itemnum", dataRow["Num"]);
                            cmd.Parameters.AddWithValue("@productid", dataRow["PID"]);
                            cmd.Parameters.AddWithValue("@productname", dataRow["PName"]);
                            cmd.Parameters.AddWithValue("@productdescription", dataRow["PDesc"]);
                            cmd.Parameters.AddWithValue("@productimg", dataRow["PImage"]);
                            cmd.Parameters.AddWithValue("@productcost", dataRow["PPrice"]);
                            cmd.Parameters.AddWithValue("@quantity", dataRow["PQuantity"]);
                            cmd.Parameters.AddWithValue("@category", dataRow["PCategory"]);
                            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());

                            cmd.ExecuteNonQuery();
                            conn2.Close();

                            CartGridView.DataSource = dataTable;
                            CartGridView.DataBind();
                            Session["buyitems"] = dataTable;
                            BuyItemsButton.Enabled = true;

                            CartGridView.FooterRow.Cells[6].Text = "Total Cost";
                            CartGridView.FooterRow.Cells[7].Text = GrandTotal().ToString();
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
                            dataRow["PDesc"] = dataSet.Tables[0].Rows[0]["product_description"].ToString();
                            dataRow["PPrice"] = dataSet.Tables[0].Rows[0]["product_cost"].ToString();
                            dataRow["PQuantity"] = Request.QueryString["quantity"];
                            dataRow["PCategory"] = dataSet.Tables[0].Rows[0]["category"].ToString();

                            int price = Convert.ToInt32(dataRow["PPrice"].ToString());
                            int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                            int subtotalPrice = price * quantity;
                            dataRow["PSTotal"] = subtotalPrice;

                            dataTable.Rows.Add(dataRow);

                            SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["CartDetailsConnectionString"].ConnectionString);

                            if (conn2.State == ConnectionState.Closed)
                            {
                                conn2.Open();
                            }

                            string insertQuery = "insert into cartdetails_master(item_num,product_id,product_name,product_description,product_img_link,product_cost,quantity,category,username) " +
                                "values (@itemnum,@productid,@productname,@productdescription,@productimg,@productcost,@quantity,@category,@username)";

                            SqlCommand cmd = new SqlCommand(insertQuery, conn2);

                            cmd.Parameters.AddWithValue("@itemnum", dataRow["Num"]);
                            cmd.Parameters.AddWithValue("@productid", dataRow["PID"]);
                            cmd.Parameters.AddWithValue("@productname", dataRow["PName"]);
                            cmd.Parameters.AddWithValue("@productdescription", dataRow["PDesc"]);
                            cmd.Parameters.AddWithValue("@productimg", dataRow["PImage"]);
                            cmd.Parameters.AddWithValue("@productcost", dataRow["PPrice"]);
                            cmd.Parameters.AddWithValue("@quantity", dataRow["PQuantity"]);
                            cmd.Parameters.AddWithValue("@category", dataRow["PCategory"]);
                            cmd.Parameters.AddWithValue("@username", Session["username"].ToString());

                            cmd.ExecuteNonQuery();
                            conn2.Close();


                            CartGridView.DataSource = dataTable;
                            CartGridView.DataBind();
                            Session["buyitems"] = dataTable;
                            BuyItemsButton.Enabled = true;


                            CartGridView.FooterRow.Cells[6].Text = "Total Cost";
                            CartGridView.FooterRow.Cells[7].Text = GrandTotal().ToString();
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
                        CartGridView.FooterRow.Cells[6].Text = "Total Cost";
                        CartGridView.FooterRow.Cells[7].Text = GrandTotal().ToString();
                    }
                }
            }

            if (CartGridView.Rows.Count.ToString() == "0")
            {
                ClearCartLinkButton.Enabled = false;
                BuyItemsButton.Enabled = false;
            }
            else
            {
                ClearCartLinkButton.Enabled = true;
                BuyItemsButton.Enabled = true;
            }

            //string orderDate = DateTime.Now.ToShortDateString();
            //Session["orderdate"] = orderDate;
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

        //Generating Unique Order Id
        public void OrderId()
        {
            String alpha = "abCdefghIjklmNopqrStuvwXyz0123456789";
            Random random = new Random();
            char[] charArray = new char[5];

            for (int i=0; i<5; i++)
            {
                charArray[i] = alpha[(int)(10 * random.NextDouble())];
            }

            string orderId;
            orderId = new string(charArray); 

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

                TableCell productId = CartGridView.Rows[e.RowIndex].Cells[1];

                if (numofItems == numofItems2)
                {
                    dataTable.Rows[i].Delete();
                    dataTable.AcceptChanges();

                    try
                    {                       
                        SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["CartDetailsConnectionString"].ConnectionString);

                        if (conn2.State == ConnectionState.Closed)
                        {
                            conn2.Open();
                        }

                        string deleteQuery = "delete top (1) from cartdetails_master where product_id='" + productId.Text + "' and username='" +
                            Session["username"] + "'";

                        SqlCommand cmd = new SqlCommand(deleteQuery, conn2);

                        cmd.ExecuteNonQuery();
                        conn2.Close();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "');</script>");
                    }


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
            bool isTrue = true;
            DataTable dataTable = (DataTable)Session["buyitems"];

            for (int i = 0; i <= dataTable.Rows.Count - 1; i++)
            {
                int productId = Convert.ToInt16(dataTable.Rows[i]["PID"]);
                int productQuantity = Convert.ToInt16(dataTable.Rows[i]["PQuantity"]);

                try
                {
                    SqlConnection sconn = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductTableConnectionString"].ConnectionString);

                    if (sconn.State == ConnectionState.Closed)
                    {
                        sconn.Open();
                    }

                    SqlDataAdapter da = new SqlDataAdapter("select current_stock,product_name from product_master where product_id =" + productId + "' " , sconn);

                    DataTable dataTable1 = new DataTable();
                    da.Fill(dataTable1);
                    int quanitiy = Convert.ToInt16(dataTable1.Rows[0][0]);

                    if (quanitiy == 0)
                    {
                        string productName = dataTable1.Rows[0][1].ToString();
                        string message = "" + productName + " is not in stock";
                        Response.Write("<script>alert('" + message + "');</script>");
                        isTrue = false;
                    }                   
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }

            if (CartGridView.Rows.Count.ToString() == "0")
            {
                Response.Write("<script>alert('Cart is Empty. Cannot place order');</script>");
            }
            else
            {
                if (isTrue == true)
                {
                    Response.Redirect("OrderPayment.aspx"); 
                }
            }
        }

        protected void ClearCartLinkButton_Click(object sender, EventArgs e)
        {
            Session["buyitems"] = null;
            ClearCart();
            Response.Redirect("ShoppingCart.aspx");
        }

        //Function to Clear Cart
        
        public void ClearCart()
        {
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