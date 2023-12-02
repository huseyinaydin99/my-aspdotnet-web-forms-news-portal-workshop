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

public partial class Admin_FotoYonetimi : System.Web.UI.Page
{
    Fonksiyon system = new Fonksiyon();
    string islem = "";
    string GaleriId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        islem = Request.QueryString["islem"];
        GaleriId = Request.QueryString["GaleriId"];
        if (islem == "Sil")
        {
            string resimadi = system.GetDataCell("Select ResimYolu from FotoGaleri Where GaleriId=" + GaleriId);
            if (resimadi != "" && resimadi != null)
            {
                FileInfo fi = new FileInfo(Server.MapPath("../FotoGaleri/150/" + resimadi));
                fi.Delete();

                FileInfo fix = new FileInfo(Server.MapPath("../FotoGaleri/800/" + resimadi));
                fix.Delete();
            }

            system.cmd("Delete from FotoGaleri Where GaleriId=" + GaleriId);
        }
        Label lbl1 = (Label)Master.FindControl("lblSayfaBaslik");
        lbl1.Text = "Fotoğraf Yönetimi";

        ResimCek();
    }
    protected void btnKaydet_Click(object sender, EventArgs e)
    {
        string resimadi = "";
        string uzanti = "";

        if (fuResim.HasFile)
        {
            uzanti = Path.GetExtension(fuResim.PostedFile.FileName);
            resimadi = Ayarlar.UrlSeo(txtResimAdi.Text) + "_fotoresim_" + DateTime.Now.Day + uzanti;
            fuResim.SaveAs(Server.MapPath("../FotoGaleri/sahte" + uzanti));

            int Donusturme = 800;

            Bitmap bmp = new Bitmap(Server.MapPath("../FotoGaleri/sahte" + uzanti));
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
                    yeniresim.Save(Server.MapPath("../FotoGaleri/800/" + resimadi));

                    yeniresim.Dispose();
                    OrjinalResim.Dispose();
                    bmp.Dispose();
                }
                else
                {
                    fuResim.SaveAs(Server.MapPath("../FotoGaleri/800/" + resimadi));
                }

            }

            Donusturme = 150;

            bmp = new Bitmap(Server.MapPath("../FotoGaleri/sahte" + uzanti));
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
                    yeniresim.Save(Server.MapPath("../FotoGaleri/150/" + resimadi));

                    yeniresim.Dispose();
                    OrjinalResim.Dispose();
                    bmp.Dispose();
                }
                else
                {
                    fuResim.SaveAs(Server.MapPath("../FotoGaleri/150/" + resimadi));
                }

            }


            FileInfo fiSahte = new FileInfo(Server.MapPath("../FotoGaleri/Sahte" + uzanti));
            fiSahte.Delete();
        }

        system.cmd("Insert into FotoGaleri(ResimAdi,ResimAciklamasi,ResimYolu) values('" + txtResimAdi.Text + "','" + txtResimAciklamasi.Text + "','" + resimadi + "')");
        Response.Redirect("FotoYonetimi.aspx");
    }

    void ResimCek()
    {
        DataTable dtResimler = system.GetDataTable("Select * from FotoGaleri");
        rpResimler.DataSource = dtResimler;
        rpResimler.DataBind();
    }
}