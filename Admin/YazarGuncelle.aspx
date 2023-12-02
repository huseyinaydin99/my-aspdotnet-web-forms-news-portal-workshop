<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="YazarGuncelle.aspx.cs" Inherits="Admin_YazarGuncelle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="normal" width="100%">
        <tr>
            <td>Kategorisi</td>
            <td>
                <asp:DropDownList ID="dropKategoriId" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Kullanıcı Adı</td>
            <td>
                <asp:TextBox ID="txtKullaniciAdi" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Şifre</td>
            <td>
                <asp:TextBox ID="txtSifre" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Adı Soyadı</td>
            <td>
                <asp:TextBox ID="txtAdSoyad" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Emaili</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Resmi</td>
            <td>
                <asp:FileUpload ID="fuResmi" runat="server" />
                <br />
                <asp:Image ID="imgYazar" runat="server" />
            </td>
        </tr>
        <tr>
            <td>Özgeçmişi</td>
            <td>
                <asp:TextBox ID="txtOzgecmis" runat="server" Height="80px" TextMode="MultiLine"
                    Width="245px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnGuncelle" runat="server" Text="Kaydet"
                    OnClick="btnGuncelle_Click" />
            </td>
        </tr>
    </table>
</asp:Content>