using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Admin_Haberler : System.Web.UI.Page
{
    public static string KategoriId = "";
    string KategoriAdi = "";
    string islem = "";
    string HaberId = "";

    Fonksiyon system = new Fonksiyon();

    protected void Page_Load(object sender, EventArgs e)
    {
        KategoriId = Request.QueryString["KategoriId"];
        islem = Request.QueryString["islem"];
        HaberId = Request.QueryString["HaberId"];

        if (islem == "Sil")
        {
            string resimadi = system.GetDataCell("Select Resmi from Haberler Where HaberId=" + HaberId);

            try
            {
                if (resimadi != "")
                {
                    FileInfo fi150 = new FileInfo(Server.MapPath("../HaberResimleri/150/" + resimadi));
                    fi150.Delete();

                    FileInfo fi800 = new FileInfo(Server.MapPath("../HaberResimleri/800/" + resimadi));
                    fi800.Delete();
                }
            }
            catch
            {}

            system.cmd("Delete from Haberler Where HaberId=" + HaberId);
        }

        KategoriAdi = system.GetDataCell("Select KategoriAdi from Kategoriler Where KategoriId=" + KategoriId);

        Label lbl1 = (Label)Master.FindControl("lblSayfaBaslik");
        lbl1.Text = KategoriAdi + " Haberleri";

        HaberleriCek();
    }

    void HaberleriCek()
    {
        DataTable dtHaberler = system.GetDataTable("Select * from Haberler Where KategoriId=" + KategoriId);
        rpHaberler.DataSource = dtHaberler;
        rpHaberler.DataBind();
    }
    protected void btnSecilenleriSil_Click(object sender, EventArgs e)
    {
        string[] Secilenler = Request.Form["Haberler"].ToString().Split(',');

        for (int i = 0; i < Secilenler.Length; i++)
        {
            string silinecekId = Secilenler[i];

            string resimadi = system.GetDataCell("Select Resmi from Haberler Where HaberId=" + silinecekId);

            try
            {
                if (resimadi != "")
                {
                    FileInfo fi150 = new FileInfo(Server.MapPath("../HaberResimleri/150/" + resimadi));
                    fi150.Delete();

                    FileInfo fi800 = new FileInfo(Server.MapPath("../HaberResimleri/800/" + resimadi));
                    fi800.Delete();
                }
            }
            catch
            { }

            system.cmd("Delete from Haberler Where HaberId=" + silinecekId);
        }
        Response.Redirect("Haberler.aspx?KategoriId=" + KategoriId);
    }
}