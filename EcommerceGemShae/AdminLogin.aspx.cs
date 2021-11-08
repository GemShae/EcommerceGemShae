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
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsSecureConnection)
            {
                string url = ConfigurationManager.AppSettings["SecurePath"] + "AdminLogin.aspx";
                Response.Redirect(url);
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AdminLoginConnectionString"].ConnectionString);

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                string checkuser = "select * from admin_login_master where username='" + AdminUsernameTextBox.Text.Trim() + "' and password='" +
                    AdminPasswordTextBox.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(checkuser, conn);

                SqlDataReader dataReader = cmd.ExecuteReader();

                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        //Response.Write("<script>alert('" + dataReader.GetValue(0).ToString() + "');</script>");
                        Session["username"] = dataReader.GetValue(0).ToString();
                        Session["fullname"] = dataReader.GetValue(2).ToString();
                        Session["role"] = "admin";
                    }

                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Admin Credentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('"+ ex.Message +"');</script>");
            }
        }
    }
}