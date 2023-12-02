<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AnketYonetimi.aspx.cs" Inherits="Admin_AnketYonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" class="normal">
        <tr>
            <td>Anket Sorusu</td>
            <td>
                <asp:TextBox ID="txtSoru" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Seçenek 1</td>
            <td>
                <asp:TextBox ID="txtSecenek1" runat="server" Width="300px"></asp:TextBox>
                &nbsp;Oy:
                <asp:TextBox ID="txtSecenek1Oy" runat="server" Width="30px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Seçenek 2</td>
            <td>
                <asp:TextBox ID="txtSecenek2" runat="server" Width="300px"></asp:TextBox>
                &nbsp;Oy:
                <asp:TextBox ID="txtSecenek2Oy" runat="server" Width="30px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Seçenek 3</td>
            <td>
                <asp:TextBox ID="txtSecenek3" runat="server" Width="300px"></asp:TextBox>
                &nbsp;Oy:
                <asp:TextBox ID="txtSecenek3Oy" runat="server" Width="30px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Seçenek 4</td>
            <td>
                <asp:TextBox ID="txtSecenek4" runat="server" Width="300px"></asp:TextBox>
                &nbsp;Oy:
                <asp:TextBox ID="txtSecenek4Oy" runat="server" Width="30px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Toplam Oy</td>
            <td>
                <asp:TextBox ID="txtToplamOy" runat="server" Width="30px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnGuncelle" runat="server" Text="Güncelle"
                    OnClick="btnGuncelle_Click" />
            </td>
        </tr>
    </table>
</asp:Content>