using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Anket : System.Web.UI.UserControl
{
    Fonksiyon system = new Fonksiyon();

    protected void Page_Load(object sender, EventArgs e)
    {
        DataRow dr = system.GetDataRow("Select * from Anketler");
        if (dr != null)
        {
            ltrlSoru.Text = dr["Soru"].ToString();
            radioSecenek1.Text = dr["Secenek1"].ToString();
            radioSecenek2.Text = dr["Secenek2"].ToString();
            radioSecenek3.Text = dr["Secenek3"].ToString();
            radioSecenek4.Text = dr["Secenek4"].ToString();
        }
    }
    protected void imgbtnOyla_Click(object sender, ImageClickEventArgs e)
    {
        string Hucre = "";
        if (radioSecenek1.Checked)
            Hucre = "Secenek1Oy";
        else if (radioSecenek2.Checked)
            Hucre = "Secenek2Oy";
        else if (radioSecenek3.Checked)
            Hucre = "Secenek3Oy";
        else
            Hucre = "Secenek4Oy";

        system.cmd("Update Anketler set " + Hucre + "=" + Hucre + "+1, ToplamOy=ToplamOy+1");
        ltrlBilgi.Text = "Oyunuz Kullanılmıştır";
    }
}