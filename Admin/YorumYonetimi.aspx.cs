using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_YorumYonetimi : System.Web.UI.Page
{
    Fonksiyon system = new Fonksiyon();
    string islem = "";
    string YorumId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        islem = Request.QueryString["islem"];
        YorumId = Request.QueryString["YorumId"];

        if (islem == "Sil")
            system.cmd("Delete from Yorumlar Where YorumId=" + YorumId);
        else if (islem == "Onay")
            system.cmd("Update Yorumlar set Onay=1 Where YorumId=" + YorumId);

        Label lbl1 = (Label)Master.FindControl("lblSayfaBaslik");
        lbl1.Text = "Yorum Yönetimi";
        if (Page.IsPostBack == false)
        {
            DataTable dtOnaysiz = system.GetDataTable("SELECT dbo.Yorumlar.YorumId, dbo.Yorumlar.AdSoyad, dbo.Yorumlar.Yorumu, dbo.Yorumlar.Tarih, dbo.Haberler.Baslik " +
            "FROM .Yorumlar LEFT OUTER JOIN " +
            "dbo.Haberler ON dbo.Yorumlar.HaberId = dbo.Haberler.HaberId Where dbo.Yorumlar.Onay=0");
            dlOnaysiz.DataSource = dtOnaysiz;
            dlOnaysiz.DataBind();
        }
    }
    protected void dropGorunum_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (dropGorunum.SelectedValue == "Onaysiz")
        {
            DataTable dtOnaysiz = system.GetDataTable("SELECT dbo.Yorumlar.YorumId, dbo.Yorumlar.AdSoyad, dbo.Yorumlar.Yorumu, dbo.Yorumlar.Tarih, dbo.Haberler.Baslik " +
            "FROM .Yorumlar LEFT OUTER JOIN " +
            "dbo.Haberler ON dbo.Yorumlar.HaberId = dbo.Haberler.HaberId Where dbo.Yorumlar.Onay=0");
            dlOnaysiz.DataSource = dtOnaysiz;
            dlOnaysiz.DataBind();
            dlOnayli.Visible = false;
            dlOnaysiz.Visible = true;
        }
        else if(dropGorunum.SelectedValue=="Onayli")
        {
            DataTable dtOnayli = system.GetDataTable("SELECT dbo.Yorumlar.YorumId, dbo.Yorumlar.AdSoyad, dbo.Yorumlar.Yorumu, dbo.Yorumlar.Tarih, dbo.Haberler.Baslik " +
            "FROM .Yorumlar LEFT OUTER JOIN " +
            "dbo.Haberler ON dbo.Yorumlar.HaberId = dbo.Haberler.HaberId Where dbo.Yorumlar.Onay=1");
            dlOnayli.DataSource = dtOnayli;
            dlOnayli.DataBind();
            dlOnaysiz.Visible = false;
            dlOnayli.Visible = true;
        }
    }
}