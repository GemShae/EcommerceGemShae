using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceGemShae
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null)
                {
                    LoginAsLabel.Visible = false;
                    LoginHyperLink.Visible = true;
                    LogoutButton.Visible = false;
                }
                else if (Session["role"].Equals("user"))
                {
                    LoginAsLabel.Text = "Logged in as " + Session["username"].ToString();
                    LoginHyperLink.Visible = false;
                    LogoutButton.Visible = true;
                }
                else if (Session["role"].Equals("admin"))
                {
                    LoginAsLabel.Text = "Logged in as " + Session["username"].ToString();
                    LoginHyperLink.Visible = false;
                    LogoutButton.Visible = true;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void HomeToProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx");
        }

        protected void HomeToAbout_Click(object sender, EventArgs e)
        {
            Response.Redirect("About.aspx");
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
            LoginAsLabel.Text = "Logged Out Successfully";
        }
    }
}