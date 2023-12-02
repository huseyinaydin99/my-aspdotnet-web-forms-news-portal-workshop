<%@ Page Title="" Language="C#" MasterPageFile="~/IcerikKalip.master" AutoEventWireup="true" CodeFile="YaziDetay.aspx.cs" Inherits="YaziDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table style="width: 100%">
        <tr>
            <td class="baslik" height="30" valign="top">
                <asp:Literal ID="ltrlBaslik" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Literal ID="ltrlDetay" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Okunma Sayısı :
                <asp:Literal ID="ltrlHit" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td>Eklenme Tarihi :
                <asp:Literal ID="ltrlTarih" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <table style="width: 100%">
                    <tr>
                        <td rowspan="2" style="width: 106px" valign="top">
                            <asp:Image ID="imgYazar" runat="server" />
                        </td>
                        <td class="baslik" valign="top">
                            <asp:Literal ID="ltrlYazarAdi" runat="server"></asp:Literal>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:Literal ID="ltrlOzgecmis" runat="server"></asp:Literal>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>