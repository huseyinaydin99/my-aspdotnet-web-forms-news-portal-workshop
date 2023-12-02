<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Haberler.aspx.cs" Inherits="Admin_Haberler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Repeater ID="rpHaberler" runat="server">
    <ItemTemplate>
        <table width="100%" cellpadding="1" cellspacing="1" class="normal">
            <tr>
                <td><input type="checkbox" name="Haberler" value="<%#Eval("HaberId") %>" /> <img src="Images/file.gif" align="absmiddle" /> <%#Eval("Baslik") %></td>
                <td align="right">
                    <a href="HaberGuncelle.aspx?HaberId=<%#Eval("HaberId") %>"><img border="0" src="Images/edit.png" /></a>
                    <a href="Haberler.aspx?HaberId=<%#Eval("HaberId") %>&islem=Sil&KategoriId=<%Response.Write(KategoriId); %>"><img border="0" src="Images/stopicon.jpg" /></a>
                </td>
            </tr>
        </table>
    </ItemTemplate>
    </asp:Repeater>
    <br />
    <br />
    <asp:Button ID="btnSecilenleriSil" runat="server" 
        onclick="btnSecilenleriSil_Click" Text="Seçilenleri Sil" />
</asp:Content>