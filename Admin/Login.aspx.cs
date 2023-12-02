using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Login : System.Web.UI.Page
{
    Fonksiyon system = new Fonksiyon();

    protected void Page_Load(object sender, EventArgs e)
    {
        Label lbl1 = (Label)Master.FindControl("lblSayfaBaslik");
        lbl1.Text = "Admin Girişi";
    }

    protected void btnGiris_Click(object sender, EventArgs e)
    {
        DataRow drGiris = system.GetDataRow("Select * from Adminler Where KullaniciAdi='" + Ayarlar.Temizle(txtKulllaniciAdi.Text) + "' and Sifre='" + Ayarlar.Temizle(txtSifre.Text) + "'");
        if (drGiris != null)
        {
            Session["AdiSoyadi"] = drGiris["AdiSoyadi"].ToString();
            Session["AdminId"] = drGiris["AdminId"].ToString();
            Response.Redirect("Default.aspx");
        }
        else
        {
            lblBilgi.Text = "Kullanıcı adı veya şifre hatalı";
        }
    }
}