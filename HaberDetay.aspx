<%@ Page Title="" Language="C#" MasterPageFile="~/Kalip.master" AutoEventWireup="true" CodeFile="HaberDetay.aspx.cs" Inherits="HaberDetay" %>

<%@ Register Src="Anket.ascx" TagName="Anket" TagPrefix="uc2" %>
<%@ Register Src="SolFoto.ascx" TagName="SolFoto" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style2 {
            width: 100%;
        }

        .style3 {
            width: 134px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td width="22%" valign="top">
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
                                        <h1 class="katbaslik" title="<%Response.Write(HaberAdi); %>">
                                            <asp:Literal runat="server" ID="ltrlBaslik"></asp:Literal></h1>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="normal">
                                        <asp:Literal ID="ltrlDetay" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="normal">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="normal">Eklenme Tarihi :
                                                <asp:Literal ID="ltrlEklenmeTarihi" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="normal">Okunma Sayısı :
                                                <asp:Literal ID="ltrlHit" runat="server"></asp:Literal>
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
                                        <h1 class="katbaslik" title="<%Response.Write(HaberAdi); %>">Yorumlar</h1>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="normal">
                                        <asp:DataList ID="dlYorumlar" runat="server" CellPadding="4"
                                            ForeColor="#333333" Width="100%">
                                            <AlternatingItemStyle BackColor="White" />
                                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle BackColor="#E3EAEB" />
                                            <ItemTemplate>
                                                <table class="style2">
                                                    <tr>
                                                        <td class="mansethaberler"><%#Eval("AdSoyad") %></td>
                                                        <td align="right"><%#Eval("Tarih") %></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2"><%#Eval("Yorumu") %></td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataList>
                                        <asp:Literal ID="ltrlBilgi" runat="server"></asp:Literal>
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
                                        <h1 class="katbaslik" title="<%Response.Write(HaberAdi); %>">Yorum Yaz</h1>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="normal">
                                        <asp:Label ID="lblYorumBilgi" runat="server" CssClass="baslik"></asp:Label>
                                        <asp:Panel ID="pnlYorumYaz" runat="server">
                                            <table class="style2">
                                                <tr>
                                                    <td class="style3">Adınız Soyadınız</td>
                                                    <td>
                                                        <asp:TextBox ID="txtAdSoyad" runat="server"
                                                            Width="150px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style3">Yorumunuz</td>
                                                    <td>
                                                        <asp:TextBox ID="txtYorumu" runat="server" Height="84px"
                                                            TextMode="MultiLine" Width="272px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style3">&nbsp;</td>
                                                    <td>
                                                        <asp:Button ID="btnGonder" runat="server" OnClick="btnGonder_Click" Text="Gönder" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
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