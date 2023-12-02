using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Admin_YazarYonetimi : System.Web.UI.Page
{
    Fonksiyon system = new Fonksiyon();
    string islem = "";
    string YazarId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        islem = Request.QueryString["islem"];
        YazarId = Request.QueryString["YazarId"];
        if (islem == "Sil")
        {
            try
            {
                string resimadi = system.GetDataCell("Select Resmi from Yazarlar Where YazarId=" + YazarId);
                FileInfo fiyazar = new FileInfo(Server.MapPath("../YazarResimleri/" + resimadi));
                fiyazar.Delete();
            }
            catch
            {}
            system.cmd("Delete from Yazarlar Where YazarId=" + YazarId);
            Response.Redirect("YazarYonetimi.aspx");
        }

        KategoriCek();
        rpYazarlar.DataSource = system.GetDataTable("Select * from Yazarlar order by YazarId desc");
        rpYazarlar.DataBind();
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

    public static string KategoriAdi(string KategoriId)
    { 
        Fonksiyon system = new Fonksiyon();
        string deger = system.GetDataCell("Select KategoriAdi from Kategoriler Where KategoriId=" + KategoriId);
        return deger;
    }
    protected void btnKaydet_Click(object sender, EventArgs e)
    {
        string resimadi = "";
        if (fuResmi.HasFile)
        {
            resimadi = Ayarlar.UrlSeo(txtAdSoyad.Text) + "_" + fuResmi.FileName;
            fuResmi.SaveAs(Server.MapPath("../YazarResimleri/" + resimadi));
        }


        SqlConnection baglanti = system.baglan();
        SqlCommand cmd = new SqlCommand("Insert into Yazarlar(KategoriId,AdSoyad,Email,Resmi,Ozgecmis,KullaniciAdi,Sifre) " +
            "values(@KategoriId,@AdSoyad,@Email,@Resmi,@Ozgecmis,@KullaniciAdi,@Sifre)", baglanti);
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