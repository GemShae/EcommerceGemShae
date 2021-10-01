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
    }
}