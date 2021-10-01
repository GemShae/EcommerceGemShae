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
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignUpButton_Click(object sender, EventArgs e)
        {
            if (checkIfUserExists())
            {
                Response.Write("<script>alert('User ID taken. Try another ID');</script>");
            }
            else
            {
                signUpNewUser();
            }
        }

        // My Methods / Functions
        bool checkIfUserExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("select * from user_master where user_id='"+IDTextBox.Text.Trim()+"';", con);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable();
                dataAdapter.Fill(dataTable);

                if (dataTable.Rows.Count >= 1)
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


        void signUpNewUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("insert into user_master" + "(full_name,dob,contact_num,email,country,city,zipcode,address," +
                    "user_id,password,account_status) values (@full_name,@dob,@contact_num,@email,@country,@city,@zipcode,@address,@user_id,@password," +
                    "@account_status)", con);

                cmd.Parameters.AddWithValue("(@full_name", FullNameTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", DOBTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_num", ContNumTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@email", EmailTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@country", CountryDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", CityTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@zipcode", ZipCodeTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@address", AddressTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@user_id", IDTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@password", ConfirmPasswordTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "active");

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Write("<script>alert('Sign up Successful. Go to User Login to login');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}