using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcommerceGemShae.models
{
    public class RoleAccount
    {
        public string RoleId { get; set; }

        public string AccountId { get; set; }

        public string Status { get; set; }

        public virtual Account Account { get; set; }

        public virtual Role Role { get; set; }
    }
}