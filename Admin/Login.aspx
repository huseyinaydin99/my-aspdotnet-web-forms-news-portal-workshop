<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
        }

        .style3 {
            width: 117px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td class="style2" colspan="2">
                <asp:Label ID="lblBilgi" runat="server" CssClass="ekle"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="normal">Kullanıcı Adı</td>
            <td>
                <asp:TextBox ID="txtKulllaniciAdi" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="normal">Şifre</td>
            <td>
                <asp:TextBox ID="txtSifre" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="style3">&nbsp;</td>
            <td>
                <asp:Button ID="btnGiris" runat="server" OnClick="btnGiris_Click"
                    Text="Giriş" />
            </td>
        </tr>
    </table>
</asp:Content>