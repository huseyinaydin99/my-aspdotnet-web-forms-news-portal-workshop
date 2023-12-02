<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="YazarYonetimi.aspx.cs" Inherits="Admin_YazarYonetimi" %>

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
            <td class="ekle">Yazar Ekle</td>
        </tr>
        <tr>
            <td>
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
                            <asp:Button ID="btnKaydet" runat="server" Text="Kaydet"
                                OnClick="btnKaydet_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="ekle">Yazarlar</td>
        </tr>
        <tr>
            <td>
                <table width="100%" class="normal" cellpadding="1" cellspacing="1">
                    <tr class="menubaslik">
                        <td style="width: 20%">Resmi</td>
                        <td style="width: 20%">Adı Soyadı</td>
                        <td style="width: 20%">Emaili</td>
                        <td style="width: 20%">Kategorisi</td>
                        <td style="width: 20%">İşlem</td>
                    </tr>
                    <asp:Repeater ID="rpYazarlar" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td style="width: 20%">
                                    <img src="../YazarResimleri/<%#Eval("Resmi") %>" width="100px" /></td>
                                <td style="width: 20%"><%#Eval("AdSoyad") %></td>
                                <td style="width: 20%"><%#Eval("Email") %></td>
                                <td style="width: 20%"><%#KategoriAdi(Eval("KategoriId").ToString()) %></td>
                                <td align="right" style="width: 20%">
                                    <a href="YazarGuncelle.aspx?YazarId=<%#Eval("YazarId") %>">
                                        <img border="0" src="Images/edit.png" /></a>
                                    <a href="YazarYonetimi.aspx?YazarId=<%#Eval("YazarId") %>&islem=Sil">
                                        <img border="0" src="Images/stopicon.jpg" /></a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>