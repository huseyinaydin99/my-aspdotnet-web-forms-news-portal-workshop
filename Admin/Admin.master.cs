using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    Fonksiyon system = new Fonksiyon();

    protected void Page_Load(object sender, EventArgs e)
    {
        string Onaysiz = system.GetDataCell("Select Count(*) as Toplam from Yorumlar Where Onay=0");
        if (Onaysiz == "0")
            hplYorum.Text = "• Yorum Yönetimi";
        else
            hplYorum.Text = "• Yorum Yönetimi <b>(" + Onaysiz + ")</b>";

        hplYorum.NavigateUrl = "YorumYonetimi.aspx";
    }
}
