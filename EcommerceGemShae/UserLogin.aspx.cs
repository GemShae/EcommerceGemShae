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
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    Response.Redirect("Default.aspx");
                } 
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserLoginConnectionString"].ConnectionString);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                string checkuser = "select * from user_master where user_id='" + UserIDTextBox.Text.Trim() + "' and password='" +
                    UserPasswordTextBox.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(checkuser, conn);

                SqlDataReader dataReader = cmd.ExecuteReader();

                if (dataReader.HasRows)
                {
                    StatusLabel.Text = "Login Successful";
                    StatusLabel.ForeColor = System.Drawing.Color.Green;
                    
                    while (dataReader.Read())
                    { 
                        Response.Write("<script>alert('Login Successful');</script>");
                        Session["username"] = dataReader.GetValue(0).ToString();
                        Session["fullname"] = dataReader.GetValue(1).ToString();
                        Session["role"] = "user";
                    }

                    Session["buyitems"] = null;
                    FillSavedCart();
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    StatusLabel.Text = "Login Unsuccessful";
                    StatusLabel.ForeColor = System.Drawing.Color.Red;
                    Response.Write("<script>alert('Invalid User Credentials');</script>");
                }

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        private void FillSavedCart()
        {
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

            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CartDetailsConnectionString"].ConnectionString);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                string selectQuery = "select * from cartdetails_master where username='" + Session["username"].ToString() + "'";
                SqlCommand cmd = new SqlCommand(selectQuery, conn);

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataSet dataSet = new DataSet();
                da.Fill(dataSet);

                if (dataSet.Tables[0].Rows.Count > 0)
                {
                    int i = 0;
                    int counter = dataSet.Tables[0].Rows.Count;

                    while (i < counter)
                    {
                        dataRow = dataTable.NewRow();
                        dataRow["Num"] = i + 1;
                        dataRow["PID"] = dataSet.Tables[0].Rows[i]["product_id"].ToString();
                        dataRow["PName"] = dataSet.Tables[0].Rows[i]["product_name"].ToString();
                        dataRow["PImage"] = dataSet.Tables[0].Rows[i]["product_img_link"].ToString();
                        dataRow["PDesc"] = dataSet.Tables[0].Rows[i]["product_description"].ToString();
                        dataRow["PPrice"] = dataSet.Tables[0].Rows[i]["product_cost"].ToString();
                        dataRow["PQuantity"] = dataSet.Tables[0].Rows[i]["quantity"].ToString();
                        dataRow["PCategory"] = dataSet.Tables[0].Rows[i]["category"].ToString();

                        int price = Convert.ToInt32(dataRow["PPrice"].ToString());
                        int quantity = Convert.ToInt32(dataRow["PQuantity"].ToString());
                        int subtotalPrice = price * quantity;
                        dataRow["PSTotal"] = subtotalPrice;

                        dataTable.Rows.Add(dataRow);
                        i++;
                    }
                }
                else
                {
                    Session["buyitems"] = null;
                }

                Session["buyitems"] = dataTable;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
    }
}