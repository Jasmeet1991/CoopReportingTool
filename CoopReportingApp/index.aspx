﻿<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CoopReportingApp.index1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-md-8">
                <div class="rotator">
                    <ul>
                        <li class="show">

                            <img src="Images/college.png" alt="campus" />
                        </li>
                        <li>
                            <img src="Images/college1.jpg" alt="pic2" /></li>
                        <li>
                            <img src="Images/college2.jpeg" alt="pic2" />
                        </li>
                        <li>
                            <img src="Images/college3.jpeg" alt="pic2" />
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-xs-6 col-md-4">
                <div class="login">
                    <h3>Login</h3>
                    <asp:TextBox ID="txtusername" CssClass="form-control" placeholder="username" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="User name required"
                         ControlToValidate="txtusername" EnableClientScript="False" Font-Size="Small" ForeColor="#CC0000"
                         SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                    <asp:TextBox ID="txtpassword" CssClass="form-control" placeholder="password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password required"
                         ControlToValidate="txtpassword" EnableClientScript="False" Font-Size="Small" SetFocusOnError="True" ForeColor="#CC0000"></asp:RequiredFieldValidator><br />
                    <asp:DropDownList ID="ddlloginas" CssClass="form-control" runat="server">
                        <asp:ListItem>Login As</asp:ListItem>
                        <asp:ListItem>Co-op Advisor</asp:ListItem>
                        <asp:ListItem>Student</asp:ListItem>
                        <asp:ListItem>Web Admin</asp:ListItem>
                    </asp:DropDownList>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Select any one option" ControlToValidate="ddlloginas" EnableClientScript="False" Font-Size="Small" ForeColor="#CC0000" Operator="NotEqual" SetFocusOnError="True" ValueToCompare="Login As"></asp:CompareValidator><br />
                    <asp:Button ID="btnlogin" runat="server" Text="Login" CssClass="btn btn-primary" />
                    <asp:Button ID="btnforgetpassword" runat="server" Text="Forget Password" CssClass="btn btn-warning" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
