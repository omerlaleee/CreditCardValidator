<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HW1.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 477px;
            width: 853px;
        }
    </style>
</head>
<body style="width: 1051px; height: 494px">
    <form id="form1" runat="server" aria-required="False">
        <div>
            <asp:Label ID="lblPaymentDetails" runat="server" Text="Payment Details"></asp:Label>
            <br />
        </div>
        <asp:Image ID="imgVisa" runat="server" Height="45px" ImageUrl="~/Images/visa.png" Width="75px" />
        <asp:Image ID="imgElectron" runat="server" Height="45px" ImageUrl="~/Images/electron.png" Width="75px" />
        <asp:Image ID="imgMasterCard" runat="server" Height="45px" ImageUrl="~/Images/mastercard.png" Width="75px" />
        <asp:Image ID="imgMaestro" runat="server" Height="45px" ImageUrl="~/Images/maestro.png" Width="75px" />
        <asp:Image ID="imgDiscover" runat="server" Height="45px" ImageUrl="~/Images/discover.png" Width="75px" />
        <br />
        <br />
        <asp:Label ID="lblCardNumber" runat="server" Text="Card Number"></asp:Label>
        <br />
        <asp:TextBox ID="txtBoxCardNumber" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblExpiryDate" runat="server" Text="Expiry Date (MM/YY)"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:Label ID="lblCvv" runat="server" Text="CVV"></asp:Label>
        <br />
        <asp:TextBox ID="txtBoxExpiryDate" runat="server"></asp:TextBox>
&nbsp;&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtBoxExpiryDate" ErrorMessage="ANA" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtBoxCvv" runat="server" Width="129px" MaxLength="3"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblNameOnCard" runat="server" Text="Name on Card"></asp:Label>
        <br />
        <asp:TextBox ID="txtBoxNameOnCard" runat="server" Width="449px"></asp:TextBox>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
        </form>
</body>
</html>
