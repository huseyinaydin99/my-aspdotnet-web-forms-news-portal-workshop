using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AnketYonetimi : System.Web.UI.Page
{
    Fonksiyon system = new Fonksiyon();

    protected void Page_Load(object sender, EventArgs e)
    {
        Label lbl1 = (Label)Master.FindControl("lblSayfaBaslik");
        lbl1.Text = "Admin Yönetimi";

        DataRow drAnket = system.GetDataRow("Select * from Anketler");
        if (Page.IsPostBack == false)
        {
            if (drAnket != null)
            {
                txtSoru.Text = drAnket["Soru"].ToString();
                txtSecenek1.Text = drAnket["Secenek1"].ToString();
                txtSecenek1Oy.Text = drAnket["Secenek1Oy"].ToString();

                txtSecenek2.Text = drAnket["Secenek2"].ToString();
                txtSecenek2Oy.Text = drAnket["Secenek2Oy"].ToString();

                txtSecenek3.Text = drAnket["Secenek3"].ToString();
                txtSecenek3Oy.Text = drAnket["Secenek3Oy"].ToString();

                txtSecenek4.Text = drAnket["Secenek4"].ToString();
                txtSecenek4Oy.Text = drAnket["Secenek4Oy"].ToString();

                txtToplamOy.Text = drAnket["ToplamOy"].ToString();
            }
        }

    }
    protected void btnGuncelle_Click(object sender, EventArgs e)
    {
        SqlConnection baglanti = system.baglan();
        SqlCommand cmd = new SqlCommand("Update Anketler set Soru=@Soru, Secenek1=@Secenek1,Secenek2=@Secenek2,Secenek3=@Secenek3," +
            "Secenek4=@Secenek4,Secenek1Oy=@Secenek1Oy,Secenek2Oy=@Secenek2Oy,Secenek3Oy=@Secenek3Oy,Secenek4Oy=@Secenek4Oy,ToplamOy=@ToplamOy", baglanti);
        cmd.Parameters.Add("Soru", txtSoru.Text);
        cmd.Parameters.Add("Secenek1", txtSecenek1.Text);
        cmd.Parameters.Add("Secenek2", txtSecenek2.Text);
        cmd.Parameters.Add("Secenek3", txtSecenek3.Text);
        cmd.Parameters.Add("Secenek4", txtSecenek4.Text);
        
        cmd.Parameters.Add("Secenek1Oy", txtSecenek1Oy.Text);
        cmd.Parameters.Add("Secenek2Oy", txtSecenek2Oy.Text);
        cmd.Parameters.Add("Secenek3Oy", txtSecenek3Oy.Text);
        cmd.Parameters.Add("Secenek4Oy", txtSecenek4Oy.Text);
        cmd.Parameters.Add("ToplamOy", txtToplamOy.Text);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        baglanti.Close();
    }
}