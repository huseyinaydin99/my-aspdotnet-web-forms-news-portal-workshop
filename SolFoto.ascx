<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SolFoto.ascx.cs" Inherits="SolFoto" %>
<link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen" />
<script src="js/prototype.js" type="text/javascript"></script>
<script src="js/scriptaculous.js?load=effects" type="text/javascript"></script>
<script src="js/lightbox.js" type="text/javascript"></script>

<table width="200" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td>
            <img src="Images/kpanelust.jpg" width="200" height="15" /></td>
    </tr>
    <tr>
        <td valign="top" background="Images/kpanelorta.jpg">
            <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="bolumbaslik">Fotoğraf Galerisi</td>
                </tr>
                <tr>
                    <td height="10">
                        <img src="Images/bolumline.jpg" width="158" height="1" /></td>
                </tr>
                <tr>
                    <td height="29" class="normal"><b>
                        <asp:Literal ID="ltrlResimAdi" runat="server"></asp:Literal>
                    </b></td>
                </tr>
                <tr>
                    <td height="126">
                        <a href="FotoGaleri/800/<%Response.Write(ResimYolu); %>" title="<%Response.Write(ResimAdi); %>" rel="lightbox">
                            <asp:Image ID="imgResimYolu" runat="server" BorderWidth="0px" /></a>
                    </td>
                </tr>
                <tr>
                    <td><span class="normal">
                        <asp:Literal ID="ltrlResimAciklamasi" runat="server"></asp:Literal>
                    </span></td>
                </tr>
                <tr>
                    <td height="27" align="right" class="baslik">
                        <asp:HyperLink class="baslik" ID="hplTumFoto" runat="server" NavigateUrl="FotoGaleri.html">Tüm Fotoğraflar</asp:HyperLink></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <img src="Images/kpanelalt.jpg" width="200" height="19" /></td>
    </tr>
</table>
