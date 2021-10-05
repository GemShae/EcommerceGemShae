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
    }
}