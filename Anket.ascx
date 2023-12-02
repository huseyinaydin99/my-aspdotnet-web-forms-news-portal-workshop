<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Anket.ascx.cs" Inherits="Anket" %>
<style type="text/css">
    .style1
    {
        width: 32px;
        height: 32px;
    }
</style>
<table width="200" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="Images/kpanelust.jpg" width="200" height="15" /></td>
              </tr>
              <tr>
                <td valign="top" background="Images/kpanelorta.jpg">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                <ProgressTemplate>
                                    <center><img class="style1" src="Images/loading.gif" /></center>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                            <table align="center" border="0" cellpadding="0" cellspacing="0" width="85%">
                                <tr>
                                    <td class="bolumbaslik">
                                        Günün Sorusu</td>
                                </tr>
                                <tr>
                                    <td height="10">
                                        <img src="Images/bolumline.jpg" width="158" 
                            height="1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="normal">
                                        <asp:Literal ID="ltrlBilgi" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="normal" height="29">
                                        <b>
                                        <asp:Literal ID="ltrlSoru" runat="server"></asp:Literal>
                                        </b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="normal">
                                        <asp:RadioButton ID="radioSecenek1" runat="server" GroupName="Secenekler" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="normal">
                                        <asp:RadioButton ID="radioSecenek2" runat="server" GroupName="Secenekler" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="normal">
                                        <asp:RadioButton ID="radioSecenek3" runat="server" GroupName="Secenekler" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="normal">
                                        <asp:RadioButton ID="radioSecenek4" runat="server" GroupName="Secenekler" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="normal">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="normal">
                                        <asp:ImageButton ID="imgbtnOyla" runat="server" ImageUrl="Images/oylabtn.jpg" 
                                            onclick="imgbtnOyla_Click" />
                                        &nbsp;<a href="AnketSonuc.aspx"><img border="0" src="Images/sonuclarbtn.jpg" width="76" height="22" /></a></td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                  </td>
              </tr>
              <tr>
                <td><img src="Images/kpanelalt.jpg" width="200" height="19" /></td>
              </tr>
          </table>