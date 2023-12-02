<%@ Page Title="" Language="C#" MasterPageFile="~/Kalip.master" AutoEventWireup="true" CodeFile="YazarGirisi.aspx.cs" Inherits="YazarGirisi" %>

<%@ Register Src="Anket.ascx" TagName="Anket" TagPrefix="uc2" %>
<%@ Register Src="SolFoto.ascx" TagName="SolFoto" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style2 {
        }

        .style3 {
            width: 104px;
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
                                        <%#Eval("KategoriAdi") %>Yazar Girişi</td>
                                </tr>
                                <tr>
                                    <td>
                                        <table class="normal" width="100%" cellpadding="2" cellspacing="2">
                                            <tr>
                                                <td class="style2" colspan="2">
                                                    <asp:Literal ID="ltrlBilgi" runat="server"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style3">Kullanıcı Adı</td>
                                                <td>
                                                    <asp:TextBox ID="txtKullaniciAdi" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style3">Şifre</td>
                                                <td>
                                                    <asp:TextBox ID="txtSifre" runat="server" TextMode="Password"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style3">&nbsp;</td>
                                                <td>
                                                    <asp:Button ID="Button1" runat="server" Text="Giriş" OnClick="Button1_Click" />
                                                </td>
                                            </tr>
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
