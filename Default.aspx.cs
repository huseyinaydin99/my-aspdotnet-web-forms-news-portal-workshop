using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    Fonksiyon system = new Fonksiyon();
    public static string Baslik = "";
    public static string Ozet = "";
    public static string Resmi = "";
    public static string Tarih = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        Mansetler();
        Kategoriler();
        SonYazilar();
    }

    void Mansetler()
    {
        DataTable dt = system.GetDataTable("Select top 10 HaberId,Baslik,Ozet,Resmi,EklenmeTarihi from Haberler Where Onay=1 and Vitrin=1");
        DataRow dr = dt.Rows[0];

        if(dr!=null)
        {
            Baslik = dr["Baslik"].ToString();
            Ozet = dr["Ozet"].ToString();
            Resmi = "<img src='HaberResimleri/150/" + dr["Resmi"].ToString() + "' align='left' hspace='5' /> ";
            Tarih = dr["EklenmeTarihi"].ToString();
        }
        rpMansetler.DataSource = dt;
        rpMansetler.DataBind();
    }
    void Kategoriler()
    {
        rpKat.DataSource = system.GetDataTable("Select * from Kategoriler");
        rpKat.DataBind();
    }

    protected void altHaber(object sender, RepeaterItemEventArgs e)
    {
        DataList dl = (DataList)e.Item.FindControl("dlHaberler");
        dl.DataSource = system.GetDataTable("Select * from Haberler Where KategoriId=" + DataBinder.Eval(e.Item.DataItem, "KategoriId"));
        dl.DataBind();
    }

    void SonYazilar()
    {
        DataTable dtYazilar = system.GetDataTable("SELECT top 3 dbo.Yazilar.YaziId, dbo.Yazilar.Baslik, dbo.Yazilar.Tarih, dbo.Yazarlar.AdSoyad, dbo.Yazarlar.Resmi " +
        "FROM dbo.Yazilar INNER JOIN " +
        "dbo.Yazarlar ON dbo.Yazilar.YazarId = dbo.Yazarlar.YazarId");
        rpYazilar.DataSource = dtYazilar;
        rpYazilar.DataBind();
    }
}