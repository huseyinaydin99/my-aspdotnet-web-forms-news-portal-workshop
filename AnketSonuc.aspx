<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AnketSonuc.aspx.cs" Inherits="AnketSonuc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
            <Series>
                <asp:Series  Name="Series1" XValueMember="Secenek1" YValueMembers="Secenek1Oy">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" Name="Series2" XValueMember="Secenek2" 
                    YValueMembers="Secenek2Oy">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" Name="Series3" XValueMember="Secenek3" 
                    YValueMembers="Secenek3Oy">
                </asp:Series>
                <asp:Series ChartArea="ChartArea1" Name="Series4" XValueMember="Secenek4" 
                    YValueMembers="Secenek4Oy">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:HaberPortaliConnectionString %>" 
            SelectCommand="SELECT * FROM [Anketler]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>