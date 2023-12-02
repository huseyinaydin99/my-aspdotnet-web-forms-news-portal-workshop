using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HaberAra : System.Web.UI.Page
{
    Fonksiyon system = new Fonksiyon();
    string Str = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Str = Ayarlar.Temizle(RouteData.Values["Str"].ToString());
        ltrlBaslik.Text = Str + " Arama Sonuçları";

        DataTable dtArama = system.GetDataTable("Select * from Haberler Where Baslik like '%" + Str + "%' or Detay like '%" + Str + "%'");
        if (dtArama.Rows.Count > 0)
        {
            dlHaberler.DataSource = dtArama;
            dlHaberler.DataBind();
            lblBilgi.Text = dtArama.Rows.Count + " adet sonuç bulunmuştur";
        }
        else lblBilgi.Text = Str + " kelimesi için sonuç bulunamadı";

    }
}