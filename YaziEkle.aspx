<%@ Page Title="" Language="C#" MasterPageFile="~/Kalip.master" AutoEventWireup="true" CodeFile="YaziEkle.aspx.cs" Inherits="YaziEkle" %>
<%@ Register src="Anket.ascx" tagname="Anket" tagprefix="uc2" %>
<%@ Register src="SolFoto.ascx" tagname="SolFoto" tagprefix="uc1" %>
<%@ Register src="YazarPaneli.ascx" tagname="YazarPaneli" tagprefix="uc3" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 82px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                                                Yazı Ekle</td>
                                        </tr>
                                        <tr>
                                            <td class="normal">
                                                <table class="style2">
                                                    <tr>
                                                        <td class="style3">
                                                            Yazı Başlığı</td>
                                                        <td>
                                                            <asp:TextBox ID="txtBaslik" runat="server" Width="367px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style3">
                                                            Yazı</td>
                                                        <td>
                                                            <cc1:Editor ID="Editor1" runat="server" Height="500px" Width="100%" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style3">
                                                            &nbsp;</td>
                                                        <td>
                                                            <asp:Button ID="btnKaydet" runat="server" onclick="btnKaydet_Click" 
                                                                style="height: 26px" Text="Kaydet" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
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