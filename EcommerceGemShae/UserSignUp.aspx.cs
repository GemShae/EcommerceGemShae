using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace EcommerceGemShae
{
    public partial class UserSignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsSecureConnection)
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "UserSignUp.aspx";
                Response.Redirect(url);
            }

            if (IsPostBack)
            {
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserSignUpConnectionString"].ConnectionString);

                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }

                    string checkuser = "select count(*) from user_master where user_id='" + IDTextBox.Text.Trim() + "'";
                    SqlCommand cmd = new SqlCommand(checkuser, conn);
                    int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                    if (temp == 1)
                    {
                        Response.Write("<script>alert('User ID taken. Try another ID');</script>");
                    }

                    conn.Close();
                }
                catch(Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        protected void SignUpButton_Click(object sender, EventArgs e)
        {
                signUpNewUser();
        }

        // My Methods / Functions
      

        void signUpNewUser()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserSignUpConnectionString"].ConnectionString);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                string insertQuery = "insert into user_master(user_id,full_name,dob,contact_num,email,country,city,zipcode,address,password,account_status)" +
                    "values (@userid,@fullname,@dob,@contactnum,@email,@country,@city,@zipcode,@address,@password,@accountstatus)";

                SqlCommand cmd = new SqlCommand(insertQuery, conn);

                cmd.Parameters.AddWithValue("@userid", IDTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@fullname", FullNameTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", DOBTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@contactnum", ContNumTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@email", EmailTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@country", CountryDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", CityTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@zipcode", ZipCodeTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@address", AddressTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@password", ConfirmPasswordTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@accountstatus", "active");

                cmd.ExecuteNonQuery();

                //Response.Write("<script>alert('Test');</script>");
                conn.Close();

                Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");
                StatusLabel.Text = "Registered Successfully";
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}