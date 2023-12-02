using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HaberDetay : System.Web.UI.Page
{
    Fonksiyon system = new Fonksiyon();
    string HaberId = "";
    public static string HaberAdi = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        HaberId = Ayarlar.sayikontrol(Ayarlar.Temizle(RouteData.Values["HaberId"].ToString()));
        
        DataRow dr = system.GetDataRow("Select * from Haberler Where HaberId=" + HaberId);
        if (dr != null)
        {
            HaberAdi = dr["Baslik"].ToString();
            ltrlBaslik.Text = HaberAdi;
            ltrlDetay.Text = "<img src=\"HaberResimleri/150/" + dr["Resmi"].ToString() + "\" align=\"left\" hspace=\"5\" />" + dr["Detay"].ToString();
            ltrlEklenmeTarihi.Text = dr["EklenmeTarihi"].ToString();
            ltrlHit.Text = dr["Hit"].ToString();

            system.cmd("Update Haberler set Hit=Hit+1 Where HaberId=" + HaberId);

            DataTable dtYorumlar = system.GetDataTable("Select * from Yorumlar Where HaberId=" + HaberId);

            if (dtYorumlar.Rows.Count > 0)
            {
                dlYorumlar.DataSource = dtYorumlar;
                dlYorumlar.DataBind();
            }
            else ltrlBilgi.Text = "Bu habere eklenmiş yorum bulunamadı";
        }
        else
            Response.Redirect("Default.aspx");
    }

    protected void btnGonder_Click(object sender, EventArgs e)
    {
        SqlConnection baglanti = system.baglan();
        SqlCommand cmd = new SqlCommand("Insert into Yorumlar(HaberId,AdSoyad,Yorumu,Tarih,Onay) values(@HaberId,@AdSoyad,@Yorumu,@Tarih,@Onay)", baglanti);
        cmd.Parameters.Add("HaberId", HaberId);
        cmd.Parameters.Add("AdSoyad", txtAdSoyad.Text);
        cmd.Parameters.Add("Yorumu", txtYorumu.Text);
        cmd.Parameters.Add("Tarih", DateTime.Now.ToString());
        cmd.Parameters.Add("Onay", "0");
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        baglanti.Close();

        pnlYorumYaz.Visible = false;
        lblYorumBilgi.Text = "Yorumunuz onaylandıktan sonra görünecektir";
    }
}