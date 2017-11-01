<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Product</title>
    <link href="HomeStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style3 {
            width: 694px;
        }
        .auto-style4 {
            width: 1000px;
            height: 200px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="page">
        <div id="header" class="auto-style3">
            <img alt="banner" class="auto-style4" longdesc="banner" src="Images/BannerGJCopy.jpg" /></div>
            <div class="topMenu">
            <ul>
                <li class="item1"><a href="Default.aspx">Home</a></li>
                <li class="item2"><a href="AboutUs.aspx">About Us</a></li>
                <li class="item3"><a href="Products.aspx">Inventory</a></li>
                <li class="item4"><a href="ReleaseCalendar.aspx">Calendar</a></li>
                <li class="item5"><a href="MyAccount.aspx">My Account</a></li>
                <li class="item6"><a href="ContactUs.aspx">Contact Us</a></li>
            </ul>
        </div>
        <div id="main">
            <p>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
                    GridLines="None" PageSize="8">
                    <AlternatingRowStyle BackColor="#40E360" />
                    <Columns>
                        <asp:TemplateField HeaderText="Name" SortExpression="prod_name">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("prod_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Bind("prod_code", "Order.aspx?ID={0}") %>' Text='<%# Bind("prod_name") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="prod_price" HeaderText="Price" SortExpression="prod_price" DataFormatString="{0:c}">
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="image_file" SortExpression="image_file" ShowHeader="False">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("image_file") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# Bind("image_file", "Images/{0}") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="clearance" HeaderText="Clearance" SortExpression="clearance" />
                        <asp:CheckBoxField DataField="sale" HeaderText="On Sale" SortExpression="sale" />
                        <asp:BoundField DataField="releaseDate" HeaderText="Release Date" SortExpression="releaseDate" />
                        <asp:BoundField DataField="rating" HeaderText="Rating" SortExpression="rating" />
                        <asp:BoundField DataField="category" HeaderText="Genre" SortExpression="category" />
                    </Columns>
                    <EditRowStyle BackColor="#424445" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:group5ConnectionString %>" SelectCommand="SELECT product.prod_code,product.prod_name, product.prod_price, product.prod_size, product.image_file, product.clearance, product.sale, videoGames.releaseDate, videoGames.rating, videoGames.category FROM product FULL OUTER JOIN videoGames ON product.prod_code = videoGames.prod_code"></asp:SqlDataSource>
            </p>
        </div>
    </div>
    </div>
    </form>
</body>
</html>
