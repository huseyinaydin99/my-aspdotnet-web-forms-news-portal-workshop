<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Adminler.aspx.cs" Inherits="Admin_Adminler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 20px;
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <img align="absmiddle" class="style2" src="Images/ekle.gif" />
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="ekle" 
                    NavigateUrl="AdminEkle.aspx">Admin Ekle</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
        <asp:DataList ID="dlAdminler" runat="server" CellPadding="4" 
            ForeColor="#333333" Width="100%">
            <AlternatingItemStyle BackColor="White" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#E3EAEB" />
            <ItemTemplate>
                <table class="normal" width="100%" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="20%"><%#Eval("AdiSoyadi") %></td>
                        <td width="20%"><%#Eval("Gorevi") %></td>
                        <td width="20%"><%#Eval("Kullaniciadi") %></td>
                        <td width="20%"><%#Eval("Sifre") %></td>
                        <td width="20%" align="right">
                        <a href="ADminDuzenle.aspx?AdminId=<%#Eval("AdminId") %>"><img border="0" align="absmiddle" src="Images/edit.png" /></a>
                        <a href="Adminler.aspx?AdminId=<%#Eval("AdminId") %>&islem=Sil"><img border="0" align="absmiddle" src="Images/stopicon.jpg" /></a>
                            </td>
                    </tr>
                </table>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
            </td>
        </tr>
    </table>
</asp:Content>