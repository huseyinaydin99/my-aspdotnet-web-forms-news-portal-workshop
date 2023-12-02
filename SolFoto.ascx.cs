using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SolFoto : System.Web.UI.UserControl
{
    Fonksiyon system = new Fonksiyon();

    public static string ResimYolu = "";
    public static string ResimAdi = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        DataRow drFoto = system.GetDataRow("Select top 1 * from FotoGaleri order by NEWID()");
        if (drFoto != null)
        {
            ResimYolu = drFoto["ResimYolu"].ToString();
            ResimAdi = drFoto["ResimAdi"].ToString();
            ltrlResimAdi.Text = ResimAdi;
            ltrlResimAciklamasi.Text = drFoto["ResimAciklamasi"].ToString();
            imgResimYolu.ImageUrl = "FotoGaleri/150/" + ResimYolu;
        }
    }
}