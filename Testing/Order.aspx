<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  
<head runat="server">
    <title>My Cart</title>
    <link href="HomeStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 250px;
        }
        .style3
        {
            width: 20px;
        }
        .auto-style1 {
            width: 1000px;
            height: 200px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <br />
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:group5ConnectionString %>" 
    SelectCommand="SELECT product.prod_code,product.prod_name, product.prod_price, product.prod_size, product.image_file, product.clearance, product.sale, videoGames.releaseDate, videoGames.rating, videoGames.category FROM product FULL OUTER JOIN videoGames ON product.prod_code = videoGames.prod_code WHERE ([product].[prod_code] = @prod_code)">
     <SelectParameters>
                <asp:QueryStringParameter Name="prod_code" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
      </asp:SqlDataSource>

        
        

        
        <table class="style1">
            <tr>
                <td class="style2">
                    <asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label>
                </td>
                <td class="style3" rowspan="2">
                    &nbsp;</td>
                <td rowspan="2" valign="top">
                    <asp:Image ID="imgProduct" runat="server" Height="200px" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="lblUnitPrice" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label>
&nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" Text="each"></asp:Label>
                </td>
            </tr>
        </table>

        
        <br />
        <asp:Label ID="Label3" runat="server" Text="Quantity:"></asp:Label>
&nbsp;<asp:TextBox ID="txtQuantity" runat="server" Width="40px"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txtQuantity" Display="Dynamic" 
            ErrorMessage="Quantity is a required field." ForeColor="Green"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" 
            ControlToValidate="txtQuantity" Display="Dynamic" 
            ErrorMessage="Quantity must range from 1 to 500." ForeColor="Green" 
            MaximumValue="500" MinimumValue="1" Type="Integer"></asp:RangeValidator>
        <br />
        <br />
        <asp:Button ID="btnAdd" runat="server" onclick="btnAdd_Click" 
            Text="Add to Cart" />
&nbsp;
        <asp:Button ID="btnCart" runat="server" CausesValidation="False" 
            PostBackUrl="~/Cart.aspx" Text="Go to Cart" />

        
    </div>
    </form>
</body>
</html>

