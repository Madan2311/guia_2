<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmEstudiante.aspx.cs" Inherits="WebSIA.frmEstudiante" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Maestro de Estudiante</title>
    <style type="text/css">
        .auto-style1 {
            width: 90%;
            border: 3px solid #006600;
        }
        .auto-style2 {
            text-align: center;
            font-size: x-large;
            color: #FFFFFF;
        }
        .auto-style4 {
            font-size: medium;
            text-align: center;
        }
        .auto-style5 {
            text-align: left;
        }
        .auto-style6 {
            text-align: left;
            font-size: medium;
        }
        .auto-style7 {
            font-size: medium;
        }
        .#339933 {}
        .auto-style8 {
            text-align: center;
            font-size: medium;
        }
        .auto-style9 {
            text-align: right;
            font-size: medium;
            width: 400px;
        }
        .centrarTexto {
            text-align: center
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center" class="auto-style1">
                <tr>
                    <td class="auto-style2" colspan="2" style="background-color: #339966">Maestro de Estudiante</td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">Carné:</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtCodi" runat="server" BackColor="#CCE8BF" BorderColor="#339933" CssClass="auto-style7" ReadOnly="True" Width="180px"></asp:TextBox>
                        <asp:ImageButton ID="ibtBusc" runat="server" BackColor="#CCE8BF" BorderColor="#339933" CssClass="auto-style7" Height="22px" ImageUrl="~/Imagenes/Buscar.jpg" Visible="False" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Programa: </td>
                    <td class="auto-style6">
                        <asp:DropDownList ID="ddlProg" runat="server" AutoPostBack="True" BackColor="#CCE8BF" CssClass="#339933" ForeColor="Black" Height="26px" Width="600px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Nro. Documento: </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtNDoc" runat="server" BackColor="#CCE8BF" BorderColor="#339933" CssClass="auto-style7" ReadOnly="True" Width="180px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Tipo. Documento: </td>
                    <td class="auto-style6">
                        <asp:DropDownList ID="ddlTDoc" runat="server" AutoPostBack="True" BackColor="#CCE8BF" CssClass="#339933" ForeColor="Black" Height="26px" Width="600px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Nombre:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtNomb" runat="server" BackColor="#CCE8BF" BorderColor="#339933" CssClass="auto-style7" ReadOnly="True" Width="593px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Apellido: </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtApel" runat="server" BackColor="#CCE8BF" BorderColor="#339933" CssClass="auto-style7" ReadOnly="True" Width="593px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style6">
                        <asp:CheckBox ID="ChkActi" runat="server" BorderColor="#339933" Checked="True" Text="Activo" TextAlign="Left" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">Observaciones: </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtObse" runat="server" BackColor="#CCE8BF" BorderColor="#339933" CssClass="auto-style7" ReadOnly="True" Rows="3" TextMode="MultiLine" Width="593px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4" colspan="2">
                        <asp:Menu ID="mnuOpci" runat="server" BackColor="#CCE8BF" BorderColor="#339933" BorderStyle="Solid" BorderWidth="2px" CssClass="centrarTexto" DynamicHorizontalOffset="2" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Orientation="Horizontal" RenderingMode="Table" Width="100%" OnMenuItemClick="mnuOpci_MenuItemClick">
                            <Items>
                                <asp:MenuItem Text="Buscar" Value="opcBusc"></asp:MenuItem>
                                <asp:MenuItem Text="Agregar" Value="opcAgre"></asp:MenuItem>
                                <asp:MenuItem Text="Modificar" Value="opcModi"></asp:MenuItem>
                                <asp:MenuItem Text="Grabar" Value="opcGrab"></asp:MenuItem>
                                <asp:MenuItem Text="Cancelar" Value="opcCanc"></asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BackColor="#339966" BorderColor="#006600" BorderStyle="Dotted" BorderWidth="2px" />
                            <StaticMenuItemStyle HorizontalPadding="20px" />
                        </asp:Menu>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;</td>
                    <td class="auto-style6">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style8" colspan="2" style="background-color: #CCE8BF">
                        <asp:Label ID="lblMsj" runat="server" ForeColor="#CC0000" style="text-align: center" Text="[lblMsj]"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
