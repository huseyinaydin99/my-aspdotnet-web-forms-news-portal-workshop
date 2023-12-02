<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td style="text-align:center;" class="ekle">
                <asp:Label ID="lblAdmin" runat="server"></asp:Label>
&nbsp;Sol tarafdaki menüleri kullanarak siteyi yönetebilirsiniz.</td>
        </tr>
    </table>
</asp:Content>