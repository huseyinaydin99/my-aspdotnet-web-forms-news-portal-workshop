<%@ Page Title="" Language="C#" MasterPageFile="~/Kalip.master" AutoEventWireup="true" CodeFile="YaziGuncelle.aspx.cs" Inherits="YaziGuncelle" %>

<%@ Register Src="Anket.ascx" TagName="Anket" TagPrefix="uc2" %>
<%@ Register Src="SolFoto.ascx" TagName="SolFoto" TagPrefix="uc1" %>

<%@ Register Src="YazarPaneli.ascx" TagName="YazarPaneli" TagPrefix="uc3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
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
                                    <td height="34" valign="top" class="katbaslik">Yazı Güncelle</td>
                                </tr>
                                <tr>
                                    <td class="normal">Başlık&nbsp;
                                                <asp:TextBox ID="txtBaslik" runat="server" Width="392px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="normal">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="normal">Yazı
                                    </td>
                                </tr>
                                <tr>
                                    <td class="normal">
                                        <cc1:Editor ID="txtDetay" runat="server" Height="500px" Width="100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="normal">
                                        <asp:Button ID="btnGuncelle" runat="server" OnClick="btnGuncelle_Click"
                                            Text="Güncelle" />
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