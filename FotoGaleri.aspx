<%@ Page Title="" Language="C#" MasterPageFile="~/IcerikKalip.master" AutoEventWireup="true" CodeFile="FotoGaleri.aspx.cs" Inherits="FotoGaleri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table style="width: 100%">
        <tr>
            <td class="katbaslik">Fotoğraf Galerisi</td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="dlFotolar" runat="server" RepeatColumns="4" Width="100%">
                    <ItemTemplate>
                        <table width="150px">
                            <tr>
                                <td><a href="FotoGaleri/800/<%#Eval("ResimYolu") %>" title="<%#Eval("ResimAdi") %>" rel="lightbox">
                                    <img border="0" src="FotoGaleri/150/<%#Eval("ResimYolu") %>" /></a></td>
                            </tr>
                            <tr>
                                <td style="height: 25px; text-align: center;"><%#Eval("ResimAdi") %></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>
</asp:Content>
