using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;

public partial class Admin_HaberEkle : System.Web.UI.Page
{
    Fonksiyon system = new Fonksiyon();
    string KategoriId = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        KategoriId = Request.QueryString["KategoriId"];
        Label lbl1 = (Label)Master.FindControl("lblSayfaBaslik");
        lbl1.Text = "Haber Ekle";

        if (Page.IsPostBack == false)
        {
            KategoriCek();
            dropKategoriId.SelectedValue = KategoriId;
        }
    }
    protected void btnEkle_Click(object sender, EventArgs e)
    {
        string resimadi = "";
        string uzanti = "";

        if (fuResim.HasFile)
        {
            uzanti = Path.GetExtension(fuResim.PostedFile.FileName);
            resimadi = Ayarlar.UrlSeo(txtBaslik.Text) + "_haberresim_" + DateTime.Now.Day + uzanti;
            fuResim.SaveAs(Server.MapPath("../HaberResimleri/sahte" + uzanti));

            int Donusturme = 800;

            Bitmap bmp = new Bitmap(Server.MapPath("../HaberResimleri/sahte" + uzanti));
            using (Bitmap OrjinalResim = bmp)
            {
                double ResYukseklik = OrjinalResim.Height;
                double ResGenislik = OrjinalResim.Width;
                double oran = 0;

                if (ResGenislik >= Donusturme)
                {
                    oran = ResGenislik / ResYukseklik;
                    ResGenislik = Donusturme;
                    ResYukseklik = Donusturme / oran;

                    Size yenidegerler = new Size(Convert.ToInt32(ResGenislik), Convert.ToInt32(ResYukseklik));

                    Bitmap yeniresim = new Bitmap(OrjinalResim, yenidegerler);
                    yeniresim.Save(Server.MapPath("../HaberResimleri/800/" + resimadi));

                    yeniresim.Dispose();
                    OrjinalResim.Dispose();
                    bmp.Dispose();
                }
                else
                {
                    fuResim.SaveAs(Server.MapPath("../HaberResimleri/800/" + resimadi));
                }

            }

            Donusturme = 150;

            bmp = new Bitmap(Server.MapPath("../HaberResimleri/sahte" + uzanti));
            using (Bitmap OrjinalResim = bmp)
            {
                double ResYukseklik = OrjinalResim.Height;
                double ResGenislik = OrjinalResim.Width;
                double oran = 0;

                if (ResGenislik >= Donusturme)
                {
                    oran = ResGenislik / ResYukseklik;
                    ResGenislik = Donusturme;
                    ResYukseklik = Donusturme / oran;

                    Size yenidegerler = new Size(Convert.ToInt32(ResGenislik), Convert.ToInt32(ResYukseklik));

                    Bitmap yeniresim = new Bitmap(OrjinalResim, yenidegerler);
                    yeniresim.Save(Server.MapPath("../HaberResimleri/150/" + resimadi));

                    yeniresim.Dispose();
                    OrjinalResim.Dispose();
                    bmp.Dispose();
                }
                else
                {
                    fuResim.SaveAs(Server.MapPath("../HaberResimleri/150/" + resimadi));
                }

            }


            FileInfo fiSahte = new FileInfo(Server.MapPath("../HaberResimleri/Sahte" + uzanti));
            fiSahte.Delete();
            
        }

        int Onay, Vitrin;
        Onay = 0;
        Vitrin = 0;

        if (chckOnay.Checked == true)
            Onay = 1;
        if (chckVitrin.Checked == true)
            Vitrin = 1;

        SqlConnection baglanti = system.baglan();
        SqlCommand cmdKaydet = new SqlCommand();
        cmdKaydet.Connection = baglanti;
        cmdKaydet.CommandType = CommandType.StoredProcedure;
        cmdKaydet.CommandText = "sp_HaberEkle";
        cmdKaydet.Parameters.Add("KategoriId", dropKategoriId.SelectedValue);
        cmdKaydet.Parameters.Add("Baslik", txtBaslik.Text);
        cmdKaydet.Parameters.Add("Ozet", txtOzet.Text);
        cmdKaydet.Parameters.Add("Detay", txtDetay.Content);
        cmdKaydet.Parameters.Add("Resmi", resimadi);
        cmdKaydet.Parameters.Add("EklenmeTarihi", DateTime.Now.ToString());
        cmdKaydet.Parameters.Add("Onay", Onay);
        cmdKaydet.Parameters.Add("Vitrin", Vitrin);
        cmdKaydet.Parameters.Add("Hit", "1");
        cmdKaydet.ExecuteNonQuery();
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
}