<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="HaberGuncelle.aspx.cs" Inherits="Admin_HaberGuncelle" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            width: 142px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table class="style1">
        <tr>
            <td class="style2">Haber Kategorisi</td>
            <td>
                <asp:DropDownList ID="dropKategoriId" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">Başlık</td>
            <td>
                <asp:TextBox ID="txtBaslik" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">Özet</td>
            <td>
                <asp:TextBox ID="txtOzet" runat="server" Height="59px" TextMode="MultiLine"
                    Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">Detay</td>
            <td>
                <cc1:Editor ID="txtDetay" runat="server" Height="300px" Width="100%" />
            </td>
        </tr>
        <tr>
            <td class="style2">Resim</td>
            <td>
                <asp:FileUpload ID="fuResim" runat="server" />
                <br />
                <asp:Image ID="imgResim" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style2">Onay</td>
            <td>
                <asp:CheckBox ID="chckOnay" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style2">Vitrin</td>
            <td>
                <asp:CheckBox ID="chckVitrin" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style2">Hit</td>
            <td>
                <asp:TextBox ID="txtHit" runat="server" Width="55px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="style2">&nbsp;</td>
            <td>
                <asp:Button ID="btnGuncelle" runat="server" OnClick="btnGuncelle_Click"
                    Text="Haberi Güncelle" />
            </td>
        </tr>
    </table>
</asp:Content>