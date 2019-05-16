using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LanesOnlineStore.Models
{
    public partial class Category
    {
        public string CategoryID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public List<Item> Items { get; set; }

    }
}