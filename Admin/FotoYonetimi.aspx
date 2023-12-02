<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="FotoYonetimi.aspx.cs" Inherits="Admin_FotoYonetimi" %>

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
            <td>
                <table class="style1">
                    <tr>
                        <td>Resim Adı</td>
                        <td>
                            <asp:TextBox ID="txtResimAdi" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Resim Açıklaması</td>
                        <td>
                            <asp:TextBox ID="txtResimAciklamasi" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Resim</td>
                        <td>
                            <asp:FileUpload ID="fuResim" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnKaydet" runat="server" OnClick="btnKaydet_Click"
                                Text="Kaydet" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="rpResimler" Width="100%" runat="server" RepeatColumns="3">
                    <ItemTemplate>
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <img src="../FotoGaleri/150/<%#Eval("ResimYolu") %>" /></td>
                            </tr>
                            <tr>
                                <td align="center"><%#Eval("ResimAdi") %> </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <a href="FotoYonetimi.aspx?islem=Sil&GaleriId=<%#Eval("GaleriId") %>">
                                        <img border="0" src="Images/stopicon.jpg" /></a> </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>
</asp:Content>