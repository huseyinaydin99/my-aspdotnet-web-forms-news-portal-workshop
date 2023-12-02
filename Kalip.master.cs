using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Kalip : System.Web.UI.MasterPage
{
    Fonksiyon system = new Fonksiyon();

    protected void Page_Load(object sender, EventArgs e)
    {
        KategoriCek();
    }

    void KategoriCek()
    {
        rpKategoriler.DataSource = system.GetDataTable("Select * from Kategoriler order by Sira");
        rpKategoriler.DataBind();
    }


    protected void imgbtnAra_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect(txtStr.Text + "_sonuclari.html");
    }
}
