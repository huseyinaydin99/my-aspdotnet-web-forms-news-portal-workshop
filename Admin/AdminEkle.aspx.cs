using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminEkle : System.Web.UI.Page
{
    Fonksiyon system = new Fonksiyon();

    protected void Page_Load(object sender, EventArgs e)
    {
        Label lbl1 = (Label)Master.FindControl("lblSayfaBaslik");
        lbl1.Text = "Admin Ekle";
    }
    protected void btnEkle_Click(object sender, EventArgs e)
    {
        SqlConnection baglanti = system.baglan();
        SqlCommand cmd = new SqlCommand("Insert into Adminler(AdiSoyadi,Gorevi,KullaniciAdi,Sifre) values(@AdiSoyadi,@Gorevi,@KullaniciAdi,@Sifre)", baglanti);
        cmd.Parameters.Add("AdiSoyadi", txtAdiSoyadi.Text);
        cmd.Parameters.Add("Gorevi", txtGorevi.Text);
        cmd.Parameters.Add("KullaniciAdi",Ayarlar.Temizle(txtKullaniciAdi.Text));
        cmd.Parameters.Add("Sifre",Ayarlar.Temizle(txtSifre.Text));
        cmd.ExecuteNonQuery();
        Response.Redirect("Adminler.aspx");
    }
}