<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AdminEkle.aspx.cs" Inherits="Admin_AdminEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>Adı Soyadı</td>
            <td>
                <asp:TextBox ID="txtAdiSoyadi" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Görevi</td>
            <td>
                <asp:TextBox ID="txtGorevi" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Kullanıcı Adı</td>
            <td>
                <asp:TextBox ID="txtKullaniciAdi" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Şifresi</td>
            <td>
                <asp:TextBox ID="txtSifre" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:RadioButton ID="RadioButton1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnEkle" runat="server" OnClick="btnEkle_Click" Text="Ekle" />
            </td>
        </tr>
    </table>
</asp:Content>