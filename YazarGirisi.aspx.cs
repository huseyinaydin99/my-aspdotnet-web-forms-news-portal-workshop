using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class YazarGirisi : System.Web.UI.Page
{
    Fonksiyon system = new Fonksiyon();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection baglanti = system.baglan();
        SqlCommand cmd = new SqlCommand("Select * from Yazarlar Where KullaniciAdi=@Kullaniciadi and Sifre=@Sifre", baglanti);
        cmd.Parameters.Add("KullaniciAdi", txtKullaniciAdi.Text);
        cmd.Parameters.Add("Sifre", txtSifre.Text);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Session["YazarId"] = dr["YazarId"];
            Session["YazarAdi"] = dr["AdSoyad"];
            Response.Redirect("YazarYonetimi.aspx");

        }
        else
        {
            ltrlBilgi.Text = "Kullanıcı Adı veya Şifre Yanlış";
        }
    }
}