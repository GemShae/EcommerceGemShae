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
                    while (dataReader.Read())
                    {
                        Response.Write("<script>alert('Login Successful');</script>");
                        Session["username"] = dataReader.GetValue(0).ToString();
                        Session["fullname"] = dataReader.GetValue(1).ToString();
                        Session["role"] = "user";
                    }

                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid User Credentials');</script>");
                }

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}