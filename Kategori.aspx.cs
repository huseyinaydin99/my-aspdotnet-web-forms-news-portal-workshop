using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Kategori : System.Web.UI.Page
{
    Fonksiyon system = new Fonksiyon();
    string KategoriId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        KategoriId = Ayarlar.Temizle(RouteData.Values["KategoriId"].ToString());
        ltrlKategoriAdi.Text = system.GetDataCell("Select KategoriAdi from Kategoriler Where KategoriId=" + KategoriId) + " Haberleri";

        DataTable dtHaberler = system.GetDataTable("Select * from Haberler Where KategoriId=" + KategoriId);

        if (dtHaberler.Rows.Count > 0)
        {
            dlHaberler.DataSource = dtHaberler;
            dlHaberler.DataBind();
        }
        else
            ltrlBilgi.Text = "Bu Kategoriye Ait Haber Bulunamadı";
        

    }
}