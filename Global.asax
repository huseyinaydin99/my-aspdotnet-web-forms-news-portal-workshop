<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        RoutingAyarlari(RouteTable.Routes);
    }

    void RoutingAyarlari(RouteCollection routes)
    {
        routes.MapPageRoute("haberdetay", "{Baslik}_haberi_{HaberId}.html", "~/HaberDetay.aspx");
        routes.MapPageRoute("kategori", "kategori_{KategoriAdi}_{KategoriId}.html", "~/Kategori.aspx");
        routes.MapPageRoute("aramasayfasi", "{str}_sonuclari.html", "~/HaberAra.aspx");
        routes.MapPageRoute("yazidetay", "{yazi}_yazisi_{YaziId}.html", "~/YaziDetay.aspx");
        routes.MapPageRoute("fotogaleri", "fotogaleri.html", "~/FotoGaleri.aspx");
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
