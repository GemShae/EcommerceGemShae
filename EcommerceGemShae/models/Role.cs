using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcommerceGemShae.models
{
    public class Role
    {
        public Role()
        {
            Roles = new HashSet<Role>(); 
        }

        public string Id { get; set; }

        public string Name { get; set; }

        public string Status { get; set; }

        public virtual ICollection<Role> Roles { get; set; }
    }
}