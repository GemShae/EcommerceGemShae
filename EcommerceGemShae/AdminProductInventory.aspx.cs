using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceGemShae
{
    public partial class AdminProductInventory : System.Web.UI.Page
    {
        static string globalFilePath;
        static int globalActualStock, globalCurrentStock, globalIssuedProducts;

        protected void Page_Load(object sender, EventArgs e)
        {
            ProductListGridView.DataBind();
        }

        protected void GoSearchLinkButton_Click(object sender, EventArgs e)
        {
            GetProductById();
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            if (checkIfProductExists())
            {
                Response.Write("<script>alert('Product already exists.');</script>");
            }
            else
            {
                AddNewBook();
            }

            //AddNewBook();
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            UpdateProductByID();
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            DeleteProductById();
        }

        //My Functions

        bool checkIfProductExists()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductTableConnectionString"].ConnectionString);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                string checkuser = "select * from product_master where product_id='" + ProductIDTextBox.Text.Trim() + "' or " +
                    "product_name='" + ProductNameTextBox.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(checkuser, conn);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void AddNewBook()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductTableConnectionString"].ConnectionString);

                if (ImageFileUpload.HasFile)
                {
                    string filename = ImageFileUpload.PostedFile.FileName;
                    string filepath = "images/" + ImageFileUpload.FileName;
                    ImageFileUpload.PostedFile.SaveAs(Server.MapPath("~/images/") + filename);

                    string category = "";
                    foreach (int i in CategoryListBox.GetSelectedIndices())
                    {
                        category = category + CategoryListBox.Items[i] + ",";
                    }
                    category = category.Remove(category.Length - 1);

                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }

                    string insertQuery = "insert into product_master(product_id,product_name,category,product_cost,product_description,actual_stock,current_stock,product_img_link)" +
                    "values (@productid,@productname,@category,@productcost,@productdescription,@actualstock,@currentstock,@productimglink)";

                    SqlCommand cmd = new SqlCommand(insertQuery, conn);

                    cmd.Parameters.AddWithValue("@productid", ProductIDTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@productname", ProductNameTextBox.Text.Trim());

                    cmd.Parameters.AddWithValue("@category", category);

                    cmd.Parameters.AddWithValue("@productcost", ProductCostTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@productdescription", ProductDesTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@actualstock", ActualStockTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@currentstock", ActualStockTextBox.Text.Trim());

                    cmd.Parameters.AddWithValue("@productimglink", filepath);

                    cmd.ExecuteNonQuery();
                    conn.Close();

                    Response.Write("<script>alert('Product Added Successfully');</script>");
                    ProductListGridView.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void GetProductById()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductTableConnectionString"].ConnectionString);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                string checkuser = "select * from product_master where product_id='" + ProductIDTextBox.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(checkuser, conn);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    ProductNameTextBox.Text = dt.Rows[0]["product_name"].ToString();

                    CategoryListBox.ClearSelection();
                    string[] category = dt.Rows[0]["category"].ToString().Trim().Split(',');
                    for (int i = 0; i < category.Length; i++)
                    {
                        for (int j = 0; j < CategoryListBox.Items.Count; j++)
                        {
                            if (CategoryListBox.Items[j].ToString() == category[i])
                            {
                                CategoryListBox.Items[j].Selected = true;
                            }
                        }
                    }

                    ProductCostTextBox.Text = dt.Rows[0]["product_cost"].ToString().Trim();
                    ActualStockTextBox.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    CurrentStockTextBox.Text = dt.Rows[0]["current_stock"].ToString().Trim();

                    ProductsSoldTextBox.Text = "" + (Convert.ToInt32(CurrentStockTextBox.Text.ToString().Trim()) - Convert.ToInt32(CurrentStockTextBox.Text.ToString().Trim()));

                    ProductDesTextBox.Text = dt.Rows[0]["product_description"].ToString();

                    globalActualStock = Convert.ToInt32(ActualStockTextBox.Text.ToString().Trim());
                    globalCurrentStock = Convert.ToInt32(CurrentStockTextBox.Text.ToString().Trim());
                    globalIssuedProducts = globalActualStock - globalCurrentStock;
                    globalFilePath = dt.Rows[0]["product_img_link"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Product ID');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void UpdateProductByID()
        {
            if (checkIfProductExists())
            {
                try
                {
                    string category = "";
                    foreach (int i in CategoryListBox.GetSelectedIndices())
                    {
                        category = category + CategoryListBox.Items[i] + ",";
                    }
                    category = category.Remove(category.Length - 1);

                    string filename = ImageFileUpload.PostedFile.FileName;
                    string filepath = "images/" + ImageFileUpload.FileName;
                    if (filename =="" || filename==null)
                    {
                        filepath = globalFilePath;
                    }
                    else
                    {
                        ImageFileUpload.PostedFile.SaveAs(Server.MapPath("~/images/") + filename);
                    }

                    int actualStock = Convert.ToInt32(ActualStockTextBox.Text.Trim());
                    int currentStock = Convert.ToInt32(CurrentStockTextBox.Text.Trim());

                    if (globalActualStock == actualStock)
                    {

                    }
                    else
                    {
                        currentStock = actualStock - globalIssuedProducts;
                        CurrentStockTextBox.Text = "" + currentStock;
                    }


                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductTableConnectionString"].ConnectionString);

                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }

                    string updateProduct = "update product_master set product_name=@productname,category=@category,product_cost=@productcost, " +
                        "product_description=@productdescription, actual_stock=@actualstock, current_stock=@currentstock,product_img_link=@productimglink " +
                        "where product_id='" + ProductIDTextBox.Text.Trim() + "'";
                    
                    SqlCommand cmd = new SqlCommand(updateProduct, conn);

                    cmd.Parameters.AddWithValue("@productname", ProductNameTextBox.Text.Trim());

                    cmd.Parameters.AddWithValue("@category", category);

                    cmd.Parameters.AddWithValue("@productcost", ProductCostTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@productdescription", ProductDesTextBox.Text.Trim());
                    cmd.Parameters.AddWithValue("@actualstock", actualStock.ToString());
                    cmd.Parameters.AddWithValue("@currentstock", currentStock.ToString());

                    cmd.Parameters.AddWithValue("@productimglink", filepath);

                    cmd.ExecuteNonQuery();
                    conn.Close();

                    ProductListGridView.DataBind();

                    Response.Write("<script>alert('Product Updated Successfully');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Product ID');</script>");
            }
        }

        void DeleteProductById()
        {
            if (checkIfProductExists())
            {
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductTableConnectionString"].ConnectionString);

                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }

                    string deleteProduct = "delete from product_master where product_id='" + ProductIDTextBox.Text.Trim() + "'";
                    SqlCommand cmd = new SqlCommand(deleteProduct, conn);

                    cmd.ExecuteNonQuery();
                    conn.Close();

                    ProductListGridView.DataBind();
                    ClearForm();

                    Response.Write("<script>alert('Product Deleted Successfully');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid User ID');</script>");
            }
        }

        void ClearForm()
        {

        }

    }
}