using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_YazarGuncelle : System.Web.UI.Page
{
    Fonksiyon system = new Fonksiyon();
    string YazarId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        YazarId = Request.QueryString["YazarId"];
        DataRow drYazar = system.GetDataRow("Select * from Yazarlar Where YazarId=" + YazarId);
        if (drYazar != null)
        {
            if (Page.IsPostBack == false)
            {
                KategoriCek();
                dropKategoriId.SelectedValue = drYazar["KategoriId"].ToString();
                txtAdSoyad.Text = drYazar["AdSoyad"].ToString();
                txtEmail.Text = drYazar["Email"].ToString();
                txtOzgecmis.Text = drYazar["Ozgecmis"].ToString();
                txtKullaniciAdi.Text = drYazar["KullaniciAdi"].ToString();
                txtSifre.Text = drYazar["Sifre"].ToString();
                imgYazar.ImageUrl = "../YazarResimleri/" + drYazar["Resmi"].ToString();
                imgYazar.Width = 100;
            }
        }
    }

    void KategoriCek()
    {
        DataTable dtKategoriler = system.GetDataTable("Select * from Kategoriler order by Sira");

        dropKategoriId.Items.Add("Seçiniz");
        dropKategoriId.Items[0].Value = "0";

        int sira = 1;
        for (int i = 0; i < dtKategoriler.Rows.Count; i++)
        {
            DataRow drKategori = dtKategoriler.Rows[i];
            dropKategoriId.Items.Add(drKategori["KategoriAdi"].ToString());
            dropKategoriId.Items[sira].Value = drKategori["KategoriId"].ToString();
            sira++;
        }
    }
    protected void btnGuncelle_Click(object sender, EventArgs e)
    {
        string resimadi = "";
        if (fuResmi.HasFile)
        {
            resimadi = Ayarlar.UrlSeo(txtAdSoyad.Text) + "_" + fuResmi.FileName;
            fuResmi.SaveAs(Server.MapPath("../YazarResimleri/" + resimadi));
        }
        else
            resimadi = system.GetDataCell("Select Resmi from Yazarlar Where YazarId=" + YazarId);


        SqlConnection baglanti = system.baglan();
        SqlCommand cmd = new SqlCommand("Update Yazarlar set KategoriId=@KategoriId,AdSoyad=@AdSoyad,Email=@Email,Resmi=@Resmi," +
            "Ozgecmis=@Ozgecmis,KullaniciAdi=@KullaniciAdi,Sifre=@Sifre Where YazarId=" + YazarId, baglanti);
        cmd.Parameters.Add("KategoriId", dropKategoriId.SelectedValue);
        cmd.Parameters.Add("AdSoyad", txtAdSoyad.Text);
        cmd.Parameters.Add("Email", txtEmail.Text);
        cmd.Parameters.Add("Resmi", resimadi);
        cmd.Parameters.Add("Ozgecmis", txtOzgecmis.Text);
        cmd.Parameters.Add("KullaniciAdi", txtKullaniciAdi.Text);
        cmd.Parameters.Add("Sifre", txtSifre.Text);
        cmd.ExecuteNonQuery();
        Response.Redirect("YazarYonetimi.aspx");
    }
}