using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LanesOnlineStore.Models
{
    public class Item
    {
        public int ItemID { get; set; }
        public int CategoryID { get; set; }
        public int ProducerID { get; set; }
        public string Title { get; set; }
        public decimal Price { get; set; }
        public string ItemURL { get; set; }


        public Category Category { get; set; }
        public Customer Customer { get; set; }
    }
}