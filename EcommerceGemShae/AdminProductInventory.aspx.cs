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
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductListGridView.DataBind();
        }

        protected void GoSearchLinkButton_Click(object sender, EventArgs e)
        {

        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            if (checkIfProductExists())
            {
                Response.Write("<script>alert('Product already exists.');</script>");
            }
            else
            {
                addNewBook();
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {

        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {

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
                    "product_name='"+ProductNameTextBox.Text.Trim()+"';";
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

        void addNewBook()
        {
            try
            {
                string category = "";

                foreach (int i in CategoryListBox.GetSelectedIndices())
                {
                    category = category + CategoryListBox.Items[i] + ",";
                }

                category = category.Remove(category.Length - 1);

                string filepath = "~/images/GEM logo (wide).png";
                string filename = Path.GetFileName(ImageFileUpload.PostedFile.FileName);
                ImageFileUpload.SaveAs(Server.MapPath("images/" + filename));
                filepath = "~/images/" + filename;

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductTableConnectionString"].ConnectionString);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                string insertQuery = "insert into product_master(product_id,product_name,category,product_cost,product_description,actual_stock,current_stock,product_img_link)" +
                    "values(@productid,@productname,@category,@productcost,@productdescription,@actualstock,@currentstock,@productimglink)";

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
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}