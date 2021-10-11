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
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired. Please Login Again');</script>");
                    Response.Redirect("UserLogin.aspx");
                }
                else
                {
                    GetUserOrderData();

                    if (!Page.IsPostBack)
                    {
                        GetUserPersonalDetails();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Session Expired. Please Login Again');</script>");
                Response.Redirect("UserLogin.aspx");
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            if(Session["username"].ToString() == "" || Session["username"] == null)
            {
                Response.Write("<script>alert('Session Expired. Please Login Again');</script>");
                Response.Redirect("UserLogin.aspx");
            }
            else
            {
                UpdateUserPersonalDetails();
            }
        }

        //My functions

        void GetUserOrderData()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserTableConnectionString"].ConnectionString);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                string checkuser = "select * from orderdetails_master where user_id='" + Session["username"].ToString() + "'";
                SqlCommand cmd = new SqlCommand(checkuser, conn);

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);

                PastPurchasesGridView.DataSource = dataTable;
                PastPurchasesGridView.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void GetUserPersonalDetails()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserTableConnectionString"].ConnectionString);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                string checkuser = "select * from user_master where user_id='" + Session["username"].ToString() + "'";
                SqlCommand cmd = new SqlCommand(checkuser, conn);

                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable();
                dataAdapter.Fill(dataTable);

                FullNameTextBox.Text = dataTable.Rows[0]["full_name"].ToString();
                DOBTextBox.Text = dataTable.Rows[0]["dob"].ToString();
                ContNumTextBox.Text = dataTable.Rows[0]["contact_num"].ToString();
                EmailTextBox.Text = dataTable.Rows[0]["email"].ToString();
                CountryDropDownList.SelectedValue = dataTable.Rows[0]["country"].ToString().Trim();
                CityTextBox.Text = dataTable.Rows[0]["city"].ToString();
                ZipCodeTextBox.Text = dataTable.Rows[0]["zipcode"].ToString();
                AddressTextBox.Text = dataTable.Rows[0]["address"].ToString();
                IDTextBox.Text = dataTable.Rows[0]["address"].ToString();
                PasswordTextBox.Text = dataTable.Rows[0]["password"].ToString();

                AccStatusLabel.Text = dataTable.Rows[0]["account_status"].ToString().Trim();

                if (AccStatusLabel.Text == "active")
                {
                    AccStatusLabel.Attributes.Add("class", "badge badge-pill badge-success");
                }
                else if (AccStatusLabel.Text == "deactived")
                {
                    AccStatusLabel.Attributes.Add("class", "badge badge-pill badge-danger");
                }
                else
                {
                    AccStatusLabel.Attributes.Add("class", "badge badge-pill badge-secondary");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        void UpdateUserPersonalDetails()
        {
            string password = "";

            if (NewPasswordTextBox.Text.Trim() == "")
            {
                password = PasswordTextBox.Text.Trim();
            }
            else
            {
                password = NewPasswordTextBox.Text.Trim();
            }

            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserTableConnectionString"].ConnectionString);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                string updateQuery = "update user_master set user_id=@userid, full_name=@fullname, dob=@dob, contact_num=@contactnum, email=@email, " +
                    "country=@country, city=@city, zipcode=@zipcode, address=@address, password=@password,account_status=@accountstatus where " +
                    "user_id='" + Session["username"].ToString().Trim() + "'";

                SqlCommand cmd = new SqlCommand(updateQuery, conn);

                cmd.Parameters.AddWithValue("@userid", IDTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@fullname", FullNameTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", DOBTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@contactnum", ContNumTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@email", EmailTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@country", CountryDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", CityTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@zipcode", ZipCodeTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@address", AddressTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@accountstatus", "active");

                int result = cmd.ExecuteNonQuery();

                //Response.Write("<script>alert('Test');</script>");
                conn.Close();

                if (result > 0)
                {
                    Response.Write("<script>alert('Details Updated Successfully');</script>");
                    GetUserOrderData();
                    GetUserPersonalDetails();
                }
                else
                {
                    Response.Write("<script>alert('User Id does not exist');</script>");
                }

                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

    }
}