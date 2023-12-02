<%@ Page Title="" Language="C#" MasterPageFile="~/Kalip.master" AutoEventWireup="true" CodeFile="Kategori.aspx.cs" Inherits="Kategori" %>
<%@ Register src="Anket.ascx" tagname="Anket" tagprefix="uc2" %>
<%@ Register src="SolFoto.ascx" tagname="SolFoto" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="22%" valign="top">
                <uc1:SolFoto ID="SolFoto1" runat="server" />
                <uc2:Anket ID="Anket1" runat="server" />
            </td>
            <td width="78%" valign="top">
               <table width="747" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="Images/panelust.jpg" width="747" height="15" /></td>
            </tr>
            <tr>
              <td background="Images/panelorta.jpg"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="34" valign="top" class="katbaslik"><%#Eval("KategoriAdi") %>
                      <asp:Literal ID="ltrlKategoriAdi" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                  <td style="margin-left: 40px" class="normal">
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
                      <asp:Literal ID="ltrlBilgi" runat="server"></asp:Literal>
                  </td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><img src="Images/panelalt.jpg" width="747" height="19" /></td>
            </tr>
          </table> 
            </td>
        </tr>
    </table>
</asp:Content>