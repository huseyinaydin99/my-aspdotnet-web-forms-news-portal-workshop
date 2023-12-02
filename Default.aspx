<%@ Page Title="" Language="C#" MasterPageFile="~/Kalip.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register src="SolFoto.ascx" tagname="SolFoto" tagprefix="uc1" %>

<%@ Register src="Anket.ascx" tagname="Anket" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="keywords" content="asp.net haber, asp.net haber yapımı, asp.net eğitim seti, haber yapımı, haber, güncel haberler, haberler, spor haberleri, haberin merkezi, haber kaynakları, haber sitesi, haber scripti">
<meta name="description" content="Asp.Net ile yapılmış, görsel eğitim seti içerisinde hazırlanmış haber sitesi.">
<meta name="rating" content="General">
<meta name="expires" content="no">
<meta name="language" content="turkish, TR">
<meta name="charset" content="windows-1254">
<meta name="distribution" content="Global">
<meta name="robots" content="all">
<meta name="ROBOTS" CONTENT="FOLLOW">
<meta name="ROBOTS" CONTENT="INDEX">
<meta name="revisit-after" content="1 Day">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script language="javascript" type="text/javascript">
    function mansetcek(Baslik, Ozet, Resmi, Tarih) {
        document.getElementById('MansetBaslik').innerHTML = Baslik;
        document.getElementById('MansetResim').innerHTML = "<img src='HaberResimleri/150/" + Resmi + "' align='left' hspace='5' />";
        document.getElementById('MansetOzet').innerHTML = Ozet;
        document.getElementById('MansetTarih').innerHTML = Tarih;
    }
</script>
<table width="98%" height="216" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="59%" valign="top"><table width="702" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td align="left"><table width="267" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="24" valign="bottom" background="Images/mansetbaslik.jpg" class="bolumbaslik">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Manşet Haberler</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td height="346" valign="top" background="Images/mansethaber.jpg"><br />
                <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="29" colspan="3" valign="top" class="mansetbaslik">
                        <div id="MansetBaslik"><%Response.Write(Baslik); %></div>
                    </td>
                    </tr>
                  <tr>
                    <td width="53%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><p class="normal">
                            <span id="MansetResim"><%Response.Write(Resmi); %></span><span id="MansetOzet"><%Response.Write(Ozet); %></span>
                        </td>
                      </tr>
                      <tr>
                        <td height="31" class="tarih">
                            <div id="MansetTarih"><%Response.Write(Tarih); %></div>
                        </td>
                      </tr>
                    </table></td>
                    <td width="5%" align="center"><img src="Images/dikline.jpg" width="1" height="221" /></td>
                    <td width="42%" valign="top"><table width="100%" border="0" cellspacing="1" cellpadding="1">
                      
                        <asp:Repeater ID="rpMansetler" runat="server">
                        <ItemTemplate>
                            <tr>
                            <td class="mansethaberler">
                                <a href="<%#Ayarlar.UrlSeo(Eval("Baslik").ToString().ToLower()) %>_haberi_<%#Eval("HaberId") %>.html" class="mansethaberler" onmouseover="mansetcek('<%#Eval("Baslik").ToString().Replace("'","").Trim() %>','<%#Eval("Ozet").ToString().Replace("'","").Trim() %>','<%#Eval("Resmi") %>','<%#Eval("EklenmeTarihi") %>');"><%#Eval("Baslik") %></a>
                            </td>
                          </tr>
                          <tr>
                            <td><img src="Images/yanline.jpg" width="225" height="5" /></td>
                          </tr>
                        </ItemTemplate>
                        </asp:Repeater>
                      
                    </table>                      <p>&nbsp;</p></td>
                  </tr>
                </table></td>
            </tr>
          </table></td>
          <td width="41%" valign="top"><table width="253" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="199" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="24" valign="bottom" background="Images/yazarbaslik.jpg" class="bolumbaslik">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Son Eklenen Yazılar</td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td height="346" valign="top" background="Images/yazaricerik.jpg"><br />
                <br />
                  <asp:Repeater ID="rpYazilar" runat="server">
                  <ItemTemplate>
                    <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="36%" rowspan="3" valign="top"><img src="YazarResimleri/<%#Eval("Resmi") %>" width="72" height="71" /></td>
                  <td width="64%" height="26" valign="top" class="yazaradi"><%#Eval("AdSoyad") %></td>
                </tr>
                <tr>
                  <td valign="top" class="yazaryazi"><a href="<%#Ayarlar.UrlSeo(Eval("Baslik").ToString()) %>_yazisi_<%#Eval("YaziId") %>.html" class="yazaryazi"><%#Eval("Baslik") %></a></td>
                </tr>
                <tr>
                  <td valign="bottom" class="tarih"><%#Eval("Tarih") %></td>
                </tr>
                </table>
                  </ItemTemplate>
                  <SeparatorTemplate>
                  <table width="85%" align="center">
                    <tr>
                        <td><hr /></td>
                    </tr>
                  </table>
                  </SeparatorTemplate>
                  </asp:Repeater>
                <br />
                </td>
            </tr>
          </table></td>
        </tr>
    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="120" align="center"><img src="Images/reklam.jpg" width="728" height="90" /></td>
        </tr>
    </table>
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="22%" valign="top">
              <uc1:SolFoto ID="SolFoto1" runat="server" />
              <uc2:Anket ID="Anket1" runat="server" />
            </td>
          <td width="78%" valign="top">
              <asp:Repeater ID="rpKat" OnItemDataBound="altHaber" runat="server">
              <ItemTemplate>
               <table width="747" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="Images/panelust.jpg" width="747" height="15" /></td>
            </tr>
            <tr>
              <td background="Images/panelorta.jpg"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="34" valign="top" class="katbaslik"><%#Eval("KategoriAdi") %></td>
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
                  </td>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td><img src="Images/panelalt.jpg" width="747" height="19" /></td>
            </tr>
          </table> 
              </ItemTemplate>
              </asp:Repeater>
            </td>
        </tr>
    </table>
</asp:Content>