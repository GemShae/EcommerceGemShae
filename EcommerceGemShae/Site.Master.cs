using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcommerceGemShae
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null)
                {
                    UserLoginLinkButton.Visible = true;
                    SignUpLinkButton.Visible = true;

                    LogoutLinkButton.Visible = false;
                    HelloUserLinkButton.Visible = false;

                    AdminLoginLinkButton.Visible = true;

                    ProductInventoryLinkButton.Visible = false;
                    ManageUsersLinkButton.Visible = false;
                }
                else if (Session["role"].Equals("user"))
                {
                    UserLoginLinkButton.Visible = false;
                    SignUpLinkButton.Visible = false;

                    LogoutLinkButton.Visible = true;
                    HelloUserLinkButton.Visible = true;

                    HelloUserLinkButton.Text = "Hello " + Session["username"].ToString();

                    AdminLoginLinkButton.Visible = true;

                    ProductInventoryLinkButton.Visible = false;
                    ManageUsersLinkButton.Visible = false;
                }
                else if (Session["role"].Equals("admin"))
                {
                    UserLoginLinkButton.Visible = false;
                    SignUpLinkButton.Visible = false;

                    LogoutLinkButton.Visible = true;
                    HelloUserLinkButton.Visible = true;

                    HelloUserLinkButton.Text = "Hello Admin " + Session["username"].ToString();

                    AdminLoginLinkButton.Visible = false;

                    ProductInventoryLinkButton.Visible = true;
                    ManageUsersLinkButton.Visible = true;
                }
            }
            catch(Exception ex)
            {
                
            }
        }

        protected void AdminLoginLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        protected void ProductInventoryLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminProductInventory.aspx");
        }

        protected void ManageUsersLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminUserManagement.aspx");
        }

        protected void UserLoginLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }

        protected void SignUpLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserSignUp.aspx");
        }

        protected void LogoutLinkButton_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";

            UserLoginLinkButton.Visible = true;
            SignUpLinkButton.Visible = true;

            LogoutLinkButton.Visible = false;
            HelloUserLinkButton.Visible = false;

            AdminLoginLinkButton.Visible = true;

            ProductInventoryLinkButton.Visible = false;
            ManageUsersLinkButton.Visible = false;
        }
    }
}