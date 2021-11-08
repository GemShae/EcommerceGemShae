using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcommerceGemShae.models
{
    public class Account
    {
        public Account()
        {
            RoleAccounts = new HashSet<RoleAccount>();
        }

        public string Id { get; set; }

        public string Username { get; set; }

        public string Password { get; set; }

        public string Status { get; set; }

        public virtual ICollection<RoleAccount> RoleAccounts { get; set; }
    }
}