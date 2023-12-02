<%@ Page Title="" Language="C#" MasterPageFile="~/Kalip.master" AutoEventWireup="true" CodeFile="YazarYonetimi.aspx.cs" Inherits="YazarYonetimi" %>

<%@ Register Src="Anket.ascx" TagName="Anket" TagPrefix="uc2" %>
<%@ Register Src="SolFoto.ascx" TagName="SolFoto" TagPrefix="uc1" %>

<%@ Register Src="YazarPaneli.ascx" TagName="YazarPaneli" TagPrefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="22%" valign="top">
                <uc3:YazarPaneli ID="YazarPaneli1" runat="server" />
                <uc1:SolFoto ID="SolFoto1" runat="server" />
                <uc2:Anket ID="Anket1" runat="server" />
            </td>
            <td width="78%" valign="top">
                <table width="747" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <img src="Images/panelust.jpg" width="747" height="15" />
                        </td>
                    </tr>
                    <tr>
                        <td background="Images/panelorta.jpg">
                            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td height="34" valign="top" class="katbaslik">
                                        <%#Eval("KategoriAdi") %>Yazar Yönetimi</td>
                                </tr>
                                <tr>
                                    <td class="normal">Hoşgeldiniz
                                                <asp:Literal ID="ltrlyazar" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" cellpadding="2" cellspacing="2">
                                            <asp:Repeater ID="rpYazilar" runat="server">
                                                <ItemTemplate>
                                                    <tr class="normal">
                                                        <td><%#Eval("Baslik") %></td>
                                                        <td align="right">
                                                            <a href="YaziGuncelle.aspx?YaziId=<%#Eval("YaziId") %>">
                                                                <img border="0" src="Admin/Images/guncelleicon.jpg" /></a>
                                                            <a href="YazarYonetimi.aspx?islem=Sil&YaziId=<%#Eval("YaziId") %>">
                                                                <img border="0" src="Admin/Images/stopicon.jpg" /></a>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="Images/panelalt.jpg" width="747" height="19" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>