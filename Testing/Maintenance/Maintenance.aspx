﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Maintenance.aspx.cs" Inherits="Maintenance_Maintenance" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Chapter 19: Authentication</title>
    <link href="../HomeStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="page">
        <div id="main">
            <h1>The Halloween Store - Maintenance</h1>
            <p>
            <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="UnderConstruction.aspx">Maintain Categories</asp:HyperLink>
            </p>
            <p>
                <asp:HyperLink ID="HyperLink2" runat="server" 
                    NavigateUrl="UnderConstruction.aspx">Maintain Products</asp:HyperLink>
            </p>
            <p>
                <asp:LoginName ID="LoginName1" runat="server" 
                    FormatString="You are logged in as: {0}" /><br />
                If this isn't your correct user name, please&nbsp;
                <asp:HyperLink ID="HyperLink3"
                    runat="server" NavigateUrl="~/Login.aspx">click here.</asp:HyperLink>
            </p>
            <p>
                <asp:LoginStatus ID="LoginStatus1" runat="server" />
            </p>
        </div>
    </div>
    </form>
</body>
</html>