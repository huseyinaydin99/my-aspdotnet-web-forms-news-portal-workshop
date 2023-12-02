using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminDuzenle : System.Web.UI.Page
{
    string AdminId = "";
    Fonksiyon system = new Fonksiyon();
    protected void Page_Load(object sender, EventArgs e)
    {
        AdminId = Request.QueryString["AdminId"];
        DataRow drAdmin = system.GetDataRow("Select * from Adminler Where AdminId=" + AdminId);
        if (drAdmin != null)
        {
            if (Page.IsPostBack == false)
            {
                txtAdiSoyadi.Text = drAdmin["AdiSoyadi"].ToString();
                txtGorevi.Text = drAdmin["Gorevi"].ToString();
                txtKullaniciAdi.Text = drAdmin["KullaniciAdi"].ToString();
                txtSifre.Text = drAdmin["Sifre"].ToString();
            }
        }
    }
    protected void btnDuzenle_Click(object sender, EventArgs e)
    {
        SqlConnection baglanti = system.baglan();
        SqlCommand cmd = new SqlCommand("Update Adminler set AdiSoyadi=@AdiSoyadi, Gorevi=@Gorevi, Kullaniciadi=@Kullaniciadi, Sifre=@Sifre Where AdminId=" + AdminId, baglanti);
        cmd.Parameters.Add("AdiSoyadi", txtAdiSoyadi.Text);
        cmd.Parameters.Add("Gorevi", txtGorevi.Text);
        cmd.Parameters.Add("KullaniciAdi", Ayarlar.Temizle(txtKullaniciAdi.Text));
        cmd.Parameters.Add("Sifre", Ayarlar.Temizle(txtSifre.Text));
        cmd.ExecuteNonQuery();
        Response.Redirect("Adminler.aspx");
    }
}