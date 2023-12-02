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

public partial class Admin_HaberGuncelle : System.Web.UI.Page
{
    Fonksiyon system = new Fonksiyon();
    string HaberId = "";
    DataRow drHaber;

    protected void Page_Load(object sender, EventArgs e)
    {
        Label lbl1 = (Label)Master.FindControl("lblSayfaBaslik");
        lbl1.Text = "Haber Güncelle";

        HaberId = Request.QueryString["HaberId"];
        drHaber = system.GetDataRow("Select * from Haberler Where HaberId=" + HaberId);

        KategoriCek();

        if (drHaber != null)
        {
            if (Page.IsPostBack == false)
            {
                dropKategoriId.SelectedValue = drHaber["KategoriId"].ToString();
                txtBaslik.Text = drHaber["Baslik"].ToString();
                txtOzet.Text = drHaber["Ozet"].ToString();
                txtDetay.Content = drHaber["Detay"].ToString();
                txtHit.Text = drHaber["Hit"].ToString();

                if (drHaber["Resmi"].ToString() != "")
                    imgResim.ImageUrl = "../HaberResimleri/150/" + drHaber["Resmi"].ToString();
                else
                    imgResim.Visible = false;

                if (drHaber["Onay"].ToString() == "1")
                    chckOnay.Checked = true;

                if (drHaber["Vitrin"].ToString() == "1")
                    chckVitrin.Checked = true;
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
        int Onay = 0;
        int Vitrin = 0;
        if (chckOnay.Checked == true)
            Onay = 1;
        if (chckVitrin.Checked == true)
            Vitrin = 1;

        string uzanti = "";
        string resimadi = "";

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
        else
        {
            resimadi = system.GetDataCell("Select Resmi from Haberler Where HaberId=" + HaberId);
        }

        SqlConnection baglanti = system.baglan();
        SqlCommand cmd = new SqlCommand("Update Haberler set Baslik=@Baslik,Ozet=@Ozet,Detay=@Detay,Resmi=@Resmi," +
            "Onay=@Onay,Vitrin=@Vitrin,Hit=@Hit Where HaberId=" + HaberId, baglanti);
        cmd.Parameters.Add("Baslik", txtBaslik.Text);
        cmd.Parameters.Add("Ozet", txtOzet.Text);
        cmd.Parameters.Add("Detay", txtDetay.Content);
        cmd.Parameters.Add("Resmi", resimadi);
        cmd.Parameters.Add("Onay", Onay);
        cmd.Parameters.Add("Vitrin", Vitrin);
        cmd.Parameters.Add("Hit", txtHit.Text);
        cmd.ExecuteNonQuery();
        Response.Redirect("HaberGuncelle.aspx?HaberId=" + HaberId);
    }
}