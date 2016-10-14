<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="relatorios.aspx.cs" Inherits="IluGis.relatorios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title>IluGIS</title>
</asp:Content>

<asp:Content ID="ContentRelatorio" ContentPlaceHolderID="body" runat="server">
    <form id="form1" runat="server">
    <div>
        <!---------------------------- Titulo--------------------------------------->
        <div class="row" style="margin-bottom: 8px;">
            <h1 style="text-align: center">Relatórios</h1>
        </div>
        <!-----------------------------Fim titulo------------------------------------>

        <!----------------------relatorios---------------------------------------------->
        <div class="row" style="margin-bottom:16px">
            <div class="col-md- col-sm-3 col-md-offset-4 col-sm-offset-4">
                <asp:LinkButton runat="server" ID="btnEmitirTodosRelatorios" class="btn btn-md btn-primary btn-block" type="submit" Text="Emitir Relatório de todas localidades" title="Emitir relatório de todas as localidades"/>
            </div>
        </div>

        <div class="row"  style="margin-bottom:16px">
            <div  id="localidadeRelatorio" class=" col-md-3 col-sm-3 col-md-offset-1 col-sm-offset-1" style="margin-bottom:8px">             
                <asp:DropDownList  Style="width: 100%; height: 34px;" ID="ddllocalidadeRelatorio" class=" form-control input-sm " runat="server" title="Definir localidade" autofocus="true">
                <asp:ListItem Text ="Selecione o local" Value = "-1"></asp:ListItem>
                <asp:ListItem Text ="BARREIRO 01" Value = "BARREIRO01"></asp:ListItem>   
                <asp:ListItem Text ="BARREIRO 02" Value = "BARREIRO02"></asp:ListItem>   
                <asp:ListItem Text ="BARREIRO 03" Value = "BARREIRO03"></asp:ListItem>   
                <asp:ListItem Text ="BARREIRO 04" Value = "BARREIRO04"></asp:ListItem>   
                <asp:ListItem Text ="BARREIRO 05" Value = "BARREIRO05"></asp:ListItem>   
                <asp:ListItem Text ="CENTRO" Value = "CENTRO"></asp:ListItem>   
                <asp:ListItem Text ="CENTRO SUL 01" Value = "CENTROSUL01"></asp:ListItem>
                <asp:ListItem Text ="CENTRO SUL 02" Value = "CENTROSUL02"></asp:ListItem>  
                <asp:ListItem Text ="CENTRO SUL 03" Value = "CENTROSUL03"></asp:ListItem>                                                                       
                <asp:ListItem Text ="LESTE 01" Value = "LESTE01"></asp:ListItem>   
                <asp:ListItem Text ="LESTE 02" Value = "LESTE02"></asp:ListItem>   
                <asp:ListItem Text ="NORDESTE 01" Value = "NORDESTE01"></asp:ListItem>     
                <asp:ListItem Text ="NORDESTE 02" Value = "NORDESTE02"></asp:ListItem>   
                <asp:ListItem Text ="NOROESTE 01" Value = "NOROESTE01"></asp:ListItem>   
                <asp:ListItem Text ="NOROESTE 02" Value = "NOROESTE02"></asp:ListItem>   
                <asp:ListItem Text ="NOROESTE 03" Value = "NOROESTE03"></asp:ListItem>   
                <asp:ListItem Text ="NORTE 01" Value = "NORTE01"></asp:ListItem>   
                <asp:ListItem Text ="NORTE 02" Value = "NORTE02"></asp:ListItem>   
                <asp:ListItem Text ="OESTE 01" Value = "OESTE01"></asp:ListItem>   
                <asp:ListItem Text ="OESTE 02" Value = "OESTE02"></asp:ListItem>   
                <asp:ListItem Text ="OESTE 03" Value = "OESTE03"></asp:ListItem>   
                <asp:ListItem Text ="OESTE 04" Value = "OESTE04"></asp:ListItem>   
                <asp:ListItem Text ="PAMPULHA 01" Value = "PAMPULHA01"></asp:ListItem>
                <asp:ListItem Text ="PAMPULHA 02" Value = "PAMPULHA02"></asp:ListItem> 
                <asp:ListItem Text ="PAMPULHA 02" Value = "PAMPULHA02"></asp:ListItem> 
                <asp:ListItem Text ="VENDA NOVA 01" Value = "VENDANOVA01"></asp:ListItem> 
                <asp:ListItem Text ="VENDA NOVA 02" Value = "VENDANOVA02"></asp:ListItem>          
                </asp:DropDownList>
            </div>
            <div class="col-md-3 col-sm-3">
                <asp:LinkButton runat="server" ID="btnEmitirRelatorio" class="btn btn-md btn-primary btn-block" type="submit" Text="Emitir Relatório" title="Emitir relatório"/>
            </div>
            
        </div>
        <!---------------------Fim relatorios------------------------------------------->

        <!-----------------------------usuário controle---------------------------------------------->
        <div class="row">
            <h2 style="text-align:center">Usuários</h2>
        </div>

        <!-------------------------------fim usuario controle------------------------------------------>
    </div>
    </form>
</asp:Content>