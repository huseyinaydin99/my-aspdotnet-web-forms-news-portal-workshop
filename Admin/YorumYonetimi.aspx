<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="YorumYonetimi.aspx.cs" Inherits="Admin_YorumYonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            height: 29px;
        }

        .style3 {
            width: 16px;
            height: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <asp:DropDownList ID="dropGorunum" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="dropGorunum_SelectedIndexChanged">
                    <asp:ListItem>Seçiniz</asp:ListItem>
                    <asp:ListItem Value="Onaysiz">Onaysız Yorumlar</asp:ListItem>
                    <asp:ListItem Value="Onayli">Onaylı Yorumlar</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="dlOnaysiz" runat="server" BackColor="LightGoldenrodYellow"
                    BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black"
                    Width="100%">
                    <AlternatingItemStyle BackColor="PaleGoldenrod" />
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td class="style2">
                                    <%#Eval("AdSoyad") %>&nbsp; - <%#Eval("Tarih") %></td>
                                <td align="right" class="style2">
                                    <%#Eval("Baslik") %></td>
                            </tr>
                            <tr>
                                <td colspan="2"><%#Eval("Yorumu") %></td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <a href="YorumYonetimi.aspx?islem=Onay&YorumId=<%#Eval("YorumId") %>">
                                        <img class="style3" src="Images/ok.jpg" border="0" /></a>
                                    &nbsp;
                                    <a href="YorumYonetimi.aspx?islem=Sil&YorumId=<%#Eval("YorumId") %>">
                                        <img class="style3" src="Images/stopicon.jpg" border="0" /></a>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                </asp:DataList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="dlOnayli" runat="server" BackColor="LightGoldenrodYellow"
                    BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black"
                    Width="100%">
                    <AlternatingItemStyle BackColor="PaleGoldenrod" />
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td class="style2">
                                    <%#Eval("AdSoyad") %>&nbsp; - <%#Eval("Tarih") %></td>
                                <td align="right" class="style2">
                                    <%#Eval("Baslik") %></td>
                            </tr>
                            <tr>
                                <td colspan="2"><%#Eval("Yorumu") %></td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">&nbsp; <a href="YorumYonetimi.aspx?islem=OnaydanKaldir&YorumId=<%#Eval("YorumId") %>">
                                    <img border="0" src="Images/guncelleicon.jpg" /></a>&nbsp;
                                    <a href="YorumYonetimi.aspx?islem=Sil&YorumId=<%#Eval("YorumId") %>">
                                        <img class="style3" src="Images/stopicon.jpg" border="0" /></a>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                </asp:DataList>
            </td>
        </tr>
    </table>
</asp:Content>