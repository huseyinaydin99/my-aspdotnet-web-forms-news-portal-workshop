using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Adminler : System.Web.UI.Page
{
    Fonksiyon system = new Fonksiyon();

    string AdminId = "";
    string islem = "";

    protected void Page_Load(object sender, EventArgs e)
    {

        AdminId = Request.QueryString["AdminId"];
        islem = Request.QueryString["islem"];

        if (islem == "Sil")
        {
            system.cmd("Delete from Adminler Where AdminId=" + AdminId);
            Response.Redirect("Adminler.aspx");
        }

        Label lbl1 = (Label)Master.FindControl("lblSayfaBaslik");
        lbl1.Text = "Admin Yönetimi";

        AdminCek();
    }

    void AdminCek()
    {
        DataTable dtAdminler = system.GetDataTable("Select * from Adminler");
        dlAdminler.DataSource = dtAdminler;
        dlAdminler.DataBind();
    }
}