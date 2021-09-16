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

        }

        protected void HomeToProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx");
        }

        protected void HomeToAbout_Click(object sender, EventArgs e)
        {
            Response.Redirect("About.aspx");
        }
    }
}