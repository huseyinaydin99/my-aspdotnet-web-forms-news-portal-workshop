using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class YaziGuncelle : System.Web.UI.Page
{
    string YaziId = "";
    Fonksiyon system = new Fonksiyon();

    protected void Page_Load(object sender, EventArgs e)
    {
        YaziId = Request.QueryString["YaziId"];

        DataRow dr = system.GetDataRow("Select * from Yazilar Where YaziId=" + YaziId);
        if (dr != null)
        {
            if (Page.IsPostBack == false)
            {
                txtBaslik.Text = dr["Baslik"].ToString();
                txtDetay.Content = dr["Detay"].ToString();
            }
        }
    }
    protected void btnGuncelle_Click(object sender, EventArgs e)
    {
        SqlConnection baglanti = system.baglan();
        SqlCommand cmd = new SqlCommand("Update Yazilar set Baslik=@Baslik,Detay=@Detay Where YaziId=" + YaziId,baglanti);
        cmd.Parameters.Add("Baslik", txtBaslik.Text);
        cmd.Parameters.Add("Detay", txtDetay.Content);
        cmd.ExecuteNonQuery();
        Response.Redirect("YazarYonetimi.aspx");
    }
}