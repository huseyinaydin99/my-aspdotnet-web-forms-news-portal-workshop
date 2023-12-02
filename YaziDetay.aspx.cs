using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class YaziDetay : System.Web.UI.Page
{
    Fonksiyon system = new Fonksiyon();
    string YaziId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        YaziId = Ayarlar.Temizle(RouteData.Values["YaziId"].ToString());

        DataRow dr = system.GetDataRow("Select * from Yazilar Where YaziId=" + YaziId);
        if (dr != null)
        {
            ltrlBaslik.Text = dr["Baslik"].ToString();
            ltrlDetay.Text = dr["Detay"].ToString();
            ltrlHit.Text = dr["Hit"].ToString();
            ltrlTarih.Text = dr["Tarih"].ToString();

            DataRow drYazar = system.GetDataRow("Select AdSoyad,Email,Ozgecmis,Resmi from Yazarlar Where YazarId=" + dr["YazarId"].ToString());
            if (drYazar != null)
            {
                imgYazar.ImageUrl = "YazarResimleri/" + drYazar["Resmi"].ToString();
                ltrlYazarAdi.Text = drYazar["AdSoyad"].ToString();
                ltrlOzgecmis.Text = drYazar["Ozgecmis"].ToString();
            }

            system.cmd("Update Yazilar set Hit=Hit+1 Where YaziId=" + YaziId);
        }
    }
}