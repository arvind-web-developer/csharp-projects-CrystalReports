using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using CrystalDecisions.CrystalReports.Engine;

namespace MVCCrystalReport.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";

            return View();
        }

        public ActionResult ReportsInvestment()
        {
            List<Investment> allInvestment = new List<Investment>();

            using(efarmingEntities dc = new efarmingEntities())
            {
                allInvestment = dc.Investments.ToList();
            }
            return View(allInvestment);
        }

        public ActionResult ExportReport()
        {
            List<Investment> allInvestment = new List<Investment>();

            using (efarmingEntities dc = new efarmingEntities())
            {
                allInvestment = dc.Investments.ToList();
            }

            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Reports"), "rpt_InvestmentList.rpt"));
            rd.SetDataSource(allInvestment);

            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();


            try
            {
                Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
                stream.Seek(0, SeekOrigin.Begin);
                return File(stream, "application/pdf", "InvestmentList.pdf");
            }
            catch (Exception)
            {
                
                throw;
            }

        }

        public ActionResult About()
        {
            return View();
        }
    }
}
