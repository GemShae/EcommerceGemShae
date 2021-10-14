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
    public partial class ProductsTwo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["addproduct"] = "false";
        }

        protected void SearchImageButton_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductTableConnectionString"].ConnectionString);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                string searchProduct = "select * from product_master where (product_name like '%" + SearchTextBox.Text.Trim() + "%') or" +
                    " (product_id like '%" + SearchTextBox.Text.Trim() + "%') or " +
                    "(category like '%" + SearchTextBox.Text.Trim() + "%')";

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(searchProduct,conn);

                DataTable dataTable = new DataTable();

                sqlDataAdapter.Fill(dataTable);

                ProductDataList.DataSourceID = null;
                ProductDataList.DataSource = dataTable;
                ProductDataList.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //Passing Selected ProductID to Cart Page
        protected void ProductDataList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Session["addproduct"] = "true";

            if (e.CommandName == "AddToCart")
            {
                DropDownList dropDownList = (DropDownList)(e.Item.FindControl("QuantityDropDownList"));
                Response.Redirect("ShoppingCart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + dropDownList.SelectedItem.ToString());
            }
        }

        //My Fuctions

        public void ShowProducts()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductTableConnectionString"].ConnectionString);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                string findProduct = "select * from product_master";

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(findProduct, conn);

                DataTable dataTable = new DataTable();

                sqlDataAdapter.Fill(dataTable);

                ProductDataList.DataSourceID = null;
                ProductDataList.DataSource = dataTable;
                ProductDataList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void ProductDataList_CancelCommand1(object source, DataListCommandEventArgs e)
        {
            ProductDataList.EditItemIndex = -1;
            CategoryDropDownList.SelectedValue = "Select Category";
            ShowProducts();
        }

        protected void CategoryDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string category = CategoryDropDownList.SelectedValue.ToString();

            if (category == "Select Category")
            {
                ShowProducts();
            }
            else
            {
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductTableConnectionString"].ConnectionString);

                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }

                    string searchProduct = "select * from product_master where category='" + category + "' ";

                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(searchProduct, conn);

                    DataTable dataTable = new DataTable();

                    sqlDataAdapter.Fill(dataTable);

                    ProductDataList.DataSourceID = null;
                    ProductDataList.DataSource = dataTable;
                    ProductDataList.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }
    }
}