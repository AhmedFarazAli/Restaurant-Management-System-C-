<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Module 1</title>

    <link rel="stylesheet" href="index.css" />

    <style>
        #rfv1, #rfv2, #rfv3, #rfv4{
            position: relative;
            left: 350px;
        }

        .datagridrow{
            position: absolute;
            top: 120px;
            left: 462px;
        }

        .key{
            position: absolute;
            top: 330px;
            left: 450px;
        }

        .key input{
            width: 150px;
            height: 30px;
        }

        #updatebtn{
            width: 80px;
            font-size: 14px;
            position: absolute;
            top: 434px;
            left: 628px;
        }

        #delbtn{
            width: 80px;
            font-size: 14px;
            position: absolute;
            top: 439px;
            left: 765px;
            background-color: red;
        }

        #rfv5{
            position: relative;
            left: 190px;
        }

        #rfv6{
            position: relative;
            left: 180px;
        }

        #errormsg{
            position: absolute;
            top: 100px;
        }
        .auto-style3 {
            left: 450px;
            top: 330px;
        }
    </style>
</head>

<body>

    <section class="container">

        <header>
            <h2 id="main" class="heading">Suppliers</h2>
        </header>

        <form id="form1" runat="server">
            <div class="row">
                <label for="pname">Product Name</label>
                <asp:RequiredFieldValidator ID="rfv1" ValidationGroup="validate" ErrorMessage="*" ControlToValidate="pname" ForeColor="Red" Font-Bold="true" runat="server" />
                <asp:TextBox type="text" placeholder="Product Name" id="pname" runat="server" />
            </div>

            <div class="row">
                <label for="cat">Category</label>
                <asp:RequiredFieldValidator ID="rfv2" ValidationGroup="validate" ErrorMessage="*" ControlToValidate="cat" ForeColor="Red" Font-Bold="true" runat="server" />
                <asp:TextBox type="text" placeholder="Category" id="cat" runat="server" />
            </div>

            <div class="row">
                <label for="quant">Region</label>
                <asp:RequiredFieldValidator ID="rfv3" ValidationGroup="validate" ErrorMessage="*" ControlToValidate="quant" ForeColor="Red" Font-Bold="true" runat="server" />
                <asp:TextBox type="number" id="quant" runat="server" />
            </div>

            <div class="row">
                <label for="pass">Supplier Name</label>
                <asp:RequiredFieldValidator ID="rfv4" ValidationGroup="validate" ErrorMessage="*" ControlToValidate="sname" ForeColor="Red" Font-Bold="true" runat="server" />
                <asp:TextBox type="text" placeholder="Supplier Name" id="sname" runat="server" />
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button Text="Update" ID="updatebtn" OnClick="Update" ValidationGroup="updatevalidate" runat="server" BackColor="#000066" CssClass="auto-style1" Font-Bold="True" ForeColor="Aqua" />
            &nbsp;<asp:Button Text="Delete" ID="delbtn" OnClick="Delete" ValidationGroup="deletevalidate" runat="server" BackColor="#000066" CssClass="auto-style2" Font-Bold="True" ForeColor="Aqua" />
            </div>

            <div class="row button">
                <asp:Button Text="Save" OnClick="Insert" ValidationGroup="validate" runat="server" BackColor="#000066" Font-Bold="True" ForeColor="Aqua" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>

            <div class="datagridrow" style="max-height:500px;overflow-y:scroll;">
                <asp:GridView ID="datagrid" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows"></asp:GridView>
            </div>

            <div class="auto-style3">
                <label for="quant">Product ID</label>
                <asp:RequiredFieldValidator ID="rfv5" ValidationGroup="updatevalidate" ErrorMessage="*" ControlToValidate="pid" ForeColor="Red" Font-Bold="true" runat="server" />
                <asp:RequiredFieldValidator ID="rfv6" ValidationGroup="deletevalidate" ErrorMessage="*" ControlToValidate="pid" ForeColor="Red" Font-Bold="true" runat="server" />
                <asp:Label Text="" ID="errormsg" ForeColor="Red" Font-Size="13px" runat="server" />
                <asp:TextBox type="number" id="pid" runat="server" />
            </div>

            <div class="row button">
            </div>

            <div class="row button">
            </div>

        </form>

    </section>
    
</body>
</html>
