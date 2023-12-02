<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Kategoriler.aspx.cs" Inherits="Admin_Kategoriler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            width: 124px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="normal">Kategori Adı</td>
                        <td>
                            <asp:TextBox ID="txtKategoriAdi" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="normal">Sırası</td>
                        <td>
                            <asp:TextBox ID="txtSira" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">&nbsp;</td>
                        <td>
                            <asp:Button ID="btnKategoriEkle" runat="server" OnClick="btnKategoriEkle_Click"
                                Text="Kategori Ekle" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="KategoriId" DataSourceID="SqlDataSource1" ForeColor="#333333"
                    GridLines="None" Width="100%">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="KategoriAdi" HeaderText="KategoriAdi"
                            SortExpression="KategoriAdi">
                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderStyle-HorizontalAlign="Left" DataField="Sira"
                            HeaderText="Sira" SortExpression="Sira">
                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                        </asp:BoundField>
                        <asp:HyperLinkField HeaderStyle-HorizontalAlign="Left" DataNavigateUrlFields="KategoriId"
                            DataNavigateUrlFormatString="HaberEkle.aspx?KategoriId={0}"
                            HeaderText="Haber Ekle" Text="Haber Ekle">
                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                        </asp:HyperLinkField>
                        <asp:HyperLinkField HeaderStyle-HorizontalAlign="Left" HeaderText="Listele"
                            Text="Haberleri Listele" DataNavigateUrlFields="KategoriId"
                            DataNavigateUrlFormatString="Haberler.aspx?KategoriId={0}">
                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                        </asp:HyperLinkField>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:HaberPortaliConnectionString %>"
                    DeleteCommand="DELETE FROM [Kategoriler] WHERE [KategoriId] = @original_KategoriId"
                    InsertCommand="INSERT INTO [Kategoriler] ([KategoriAdi], [Sira]) VALUES (@KategoriAdi, @Sira)"
                    OldValuesParameterFormatString="original_{0}"
                    SelectCommand="SELECT * FROM [Kategoriler] ORDER BY [Sira]"
                    UpdateCommand="UPDATE [Kategoriler] SET [KategoriAdi] = @KategoriAdi, [Sira] = @Sira WHERE [KategoriId] = @original_KategoriId">
                    <DeleteParameters>
                        <asp:Parameter Name="original_KategoriId" Type="Int32" />
                        <asp:Parameter Name="original_KategoriAdi" Type="String" />
                        <asp:Parameter Name="original_Sira" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="KategoriAdi" Type="String" />
                        <asp:Parameter Name="Sira" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="KategoriAdi" Type="String" />
                        <asp:Parameter Name="Sira" Type="Int32" />
                        <asp:Parameter Name="original_KategoriId" Type="Int32" />
                        <asp:Parameter Name="original_KategoriAdi" Type="String" />
                        <asp:Parameter Name="original_Sira" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>