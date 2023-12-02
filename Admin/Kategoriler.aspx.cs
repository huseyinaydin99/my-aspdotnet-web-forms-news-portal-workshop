using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Kategoriler : System.Web.UI.Page
{
    Fonksiyon system = new Fonksiyon();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnKategoriEkle_Click(object sender, EventArgs e)
    {
        system.cmd("Insert into Kategoriler(KategoriAdi,Sira) values('" + txtKategoriAdi.Text + "'," + txtSira.Text + ")");
        Response.Redirect("Kategoriler.aspx");
    }
}