using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class YazarYonetimi : System.Web.UI.Page
{
    Fonksiyon system = new Fonksiyon();
    string islem = "";
    string YaziId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["YazarId"] == null || Session["YazarId"] == "")
            Response.Redirect("Default.aspx");
        else
            ltrlyazar.Text = Session["YazarAdi"].ToString();

        islem = Request.QueryString["islem"];
        YaziId = Request.QueryString["YaziId"];
        if (islem == "Sil")
        {
            system.cmd("Delete from Yazilar Where YaziId="+YaziId);
        }        

        rpYazilar.DataSource = system.GetDataTable("Select * from Yazilar Where YazarId=" + Session["YazarId"].ToString());
        rpYazilar.DataBind();
    }
}