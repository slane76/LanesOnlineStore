using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LanesOnlineStore.Models;

namespace LanesOnlineStore.Controllers
{
    public class StoreController : Controller
    {
        // GET: Store
        public ActionResult Index()
        {
            var category = new List<Category>
            {
                new Category {Name = "Clothing, Footwear, Jewelry"},
                new Category {Name = "Movies, Music & Games"},
                new Category {Name = "Electronics, Computer Office"},
                new Category {Name = "Home and Garden"},
                new Category {Name = "Toys"},
                new Category {Name = "Beauty & Health"},
                new Category {Name = "Sports & Outdoors"},

            };
                    return View(category);

        }

        public ActionResult Browse(string category)
        {
            var categoryModel = new Category { Name = category };
            return View(categoryModel);
        }
        public ActionResult Details(int ID)
        {
            var Item = new Item { Title = "Item" + ID };
            return View(Item);
        }
    }
}