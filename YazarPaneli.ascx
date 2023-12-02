<%@ Control Language="C#" AutoEventWireup="true" CodeFile="YazarPaneli.ascx.cs" Inherits="YazarPaneli" %>
<table width="200" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td>
            <img src="Images/kpanelust.jpg" width="200" height="15" /></td>
    </tr>
    <tr>
        <td valign="top" background="Images/kpanelorta.jpg">
            <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="bolumbaslik">Yazar Menüsü</td>
                </tr>
                <tr>
                    <td height="10">
                        <img src="Images/bolumline.jpg" width="158" height="1" /></td>
                </tr>
                <tr>
                    <td class="normal">
                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="normal"
                            NavigateUrl="YaziEkle.aspx">Yazı Ekle</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="normal">&nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <img src="Images/kpanelalt.jpg" width="200" height="19" /></td>
    </tr>
</table>
