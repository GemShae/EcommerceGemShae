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
    public partial class AdminUserManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsSecureConnection)
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "AdminUserManagement.aspx";
                Response.Redirect(url);
            }

            UserListGridView.DataBind();
        }

        protected void GoSearchLinkButton_Click(object sender, EventArgs e)
        {
            getUserById();
        }

        protected void ActiveLinkButton_Click(object sender, EventArgs e)
        {
            updateUserStatusById("active");
        }

        protected void DeactivateLinkButton_Click(object sender, EventArgs e)
        {
            updateUserStatusById("deactived");
        }

        protected void DeletePermButton_Click(object sender, EventArgs e)
        {
            deleteUserById();
        }

        //My functions
        void getUserById()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserTableConnectionString"].ConnectionString);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                string checkuser = "select * from user_master where user_id='" + USerIDTextBox.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(checkuser, conn);

                SqlDataReader dataReader = cmd.ExecuteReader();

                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        FullNameTextBox.Text = dataReader.GetValue(1).ToString();
                        AccStatusTextBox.Text = dataReader.GetValue(10).ToString();
                        DOBTextBox.Text = dataReader.GetValue(2).ToString();
                        ContNumTextBox.Text = dataReader.GetValue(3).ToString();
                        EmailTextBox.Text = dataReader.GetValue(4).ToString();
                        CountryTextBox.Text = dataReader.GetValue(5).ToString();
                        CityTextBox.Text = dataReader.GetValue(6).ToString();
                        ZipCodeTextBox.Text = dataReader.GetValue(7).ToString();
                        AddressTextBox.Text = dataReader.GetValue(8).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Not found');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updateUserStatusById(string status)
        {
            if (checkIfUserExists())
            {
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserTableConnectionString"].ConnectionString);

                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }

                    string updateuser = "update user_master set account_status='" + status + "' where user_id='" + USerIDTextBox.Text.Trim() + "'";
                    SqlCommand cmd = new SqlCommand(updateuser, conn);

                    cmd.ExecuteNonQuery();
                    conn.Close();

                    UserListGridView.DataBind();

                    Response.Write("<script>alert('Member Status Updated');</script>");
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

        void deleteUserById()
        {
            if (checkIfUserExists())
            {
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserTableConnectionString"].ConnectionString);

                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }

                    string deleteuser = "delete from user_master where user_id='" + USerIDTextBox.Text.Trim() + "'";
                    SqlCommand cmd = new SqlCommand(deleteuser, conn);

                    cmd.ExecuteNonQuery();
                    conn.Close();

                    UserListGridView.DataBind();
                    clearForm();

                    Response.Write("<script>alert('User Deleted Successfully');</script>");
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

        bool checkIfUserExists()
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserTableConnectionString"].ConnectionString);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                string checkuser = "select count(*) from user_master where user_id='" + USerIDTextBox.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                if (temp == 1)
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

        void clearForm()
        {
            USerIDTextBox.Text = "";
            FullNameTextBox.Text = "";
            AccStatusTextBox.Text = "";
            DOBTextBox.Text = "";
            ContNumTextBox.Text = "";
            EmailTextBox.Text = "";
            CountryTextBox.Text = ""; 
            CityTextBox.Text = "";
            ZipCodeTextBox.Text = "";
            AddressTextBox.Text = "";
        }
    }
}