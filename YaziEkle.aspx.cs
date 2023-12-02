using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class YaziEkle : System.Web.UI.Page
{
    Fonksiyon system = new Fonksiyon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["YazarId"] == null || Session["YazarId"] == "")
            Response.Redirect("Default.aspx");
    }
    protected void btnKaydet_Click(object sender, EventArgs e)
    {
        SqlConnection baglanti = system.baglan();
        SqlCommand cmd = new SqlCommand("Insert into Yazilar(YazarId,Baslik,Detay,Tarih,Onay,Hit) " +
            "values(@YazarId,@Baslik,@Detay,@Tarih,@Onay,@Hit)", baglanti);
        cmd.Parameters.Add("YazarId", Session["YazarId"].ToString());
        cmd.Parameters.Add("Baslik", txtBaslik.Text);
        cmd.Parameters.Add("Detay", Editor1.Content);
        cmd.Parameters.Add("Tarih", DateTime.Now.ToString());
        cmd.Parameters.Add("Onay", 1);
        cmd.Parameters.Add("Hit", 1);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        baglanti.Close();
        Response.Redirect("YazarYonetimi.aspx");
    }
}