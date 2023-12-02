<%@ Page Title="" Language="C#" MasterPageFile="~/IcerikKalip.master" AutoEventWireup="true" CodeFile="HaberAra.aspx.cs" Inherits="HaberAra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table style="width: 100%">
    <tr>
        <td class="katbaslik">
            <asp:Literal runat="server" ID="ltrlBaslik"></asp:Literal>
        </td>
    </tr>
    <tr>
        <td>
                      <asp:DataList ID="dlHaberler" RepeatColumns="2" runat="server">
                      <ItemTemplate>
                        <table width="340" border="0" cellspacing="1" cellpadding="0">
                        <tr>
                          <td width="161" rowspan="2" valign="top"><span class="normal"><img src="HaberResimleri/150/<%#Eval("Resmi") %>" width="150" height="112" hspace="5" vspace="3" align="left" /></span></td>
                          <td width="179" valign="top" class="baslik"> <a href="<%#Ayarlar.UrlSeo(Eval("Baslik").ToString().ToLower()) %>_haberi_<%#Eval("HaberId") %>.html" class="baslik"><%#Eval("Baslik") %></a></td>
                        </tr>
                        <tr>
                          <td valign="middle" class="normal"><%#Ayarlar.OzetCek(Eval("Ozet").ToString(),175) %></td>
                        </tr>
                      </table>
                      </ItemTemplate>
                      </asp:DataList>
                      <br />
                      <asp:Label ID="lblBilgi" runat="server" CssClass="baslik"></asp:Label>
                      </td>
    </tr>
</table>
</asp:Content>