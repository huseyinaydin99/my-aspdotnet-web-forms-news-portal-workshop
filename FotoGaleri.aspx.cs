using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FotoGaleri : System.Web.UI.Page
{
    Fonksiyon system = new Fonksiyon();

    protected void Page_Load(object sender, EventArgs e)
    {
        
        dlFotolar.DataSource = system.GetDataTable("Select * from FotoGaleri");
        dlFotolar.DataBind();
    }
}