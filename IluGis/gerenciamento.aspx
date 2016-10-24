<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="gerenciamento.aspx.cs" Inherits="IluGis.gerenciamento1" %>

<asp:Content ID="Content10" ContentPlaceHolderID="head" runat="server">
    <script src="js/d3plus.full.min.js"></script>

<title>IluGIS</title>
</asp:Content>

<asp:Content ID="ContentGerenciamento" ContentPlaceHolderID="body" runat="server">
    <form id="form1" runat="server">
    <div style="display:none;">
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
            <div  id="localidadeRelatorio" class=" col-md-3 col-sm-3 col-md-offset-4 col-sm-offset-4" style="margin-bottom:8px">             
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
            </div>
         <div class="row"  style="margin-bottom:16px">
           <div class="col-md- col-sm-3 col-md-offset-4 col-sm-offset-4">
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
    <div id="viz" style="width:500px; height:500px;"></div>

    <script>
     
        var datagraph;
        var campos = "";
        

        $.ajax({
            url: '<%=ResolveUrl("~/Classes/service.asmx/GetRelatorio") %>',
            type: "POST",
            data: "{ 'campo': 'TIPO_POSTE'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data2) {
                var parsed = $.parseJSON(data2.d);
               
                var count = 0;
                $.each(parsed, function (i, jsondata) {
                    if (count == 0)
                    {
                        campos += '[{"name": "' + jsondata.name + '","value": ' + jsondata.value +' }';
                    }
                    else {
                        campos += ',{"name": "' + jsondata.name + '","value": ' + jsondata.value + '}';
                    }
                    count++;
                   
                            
                      
                })

                campos += "]";
                
                var atributos = groupColor($.parseJSON(campos), ["Concreto Circular", "Madeira", "Metalico", "Concreto"], ["#AEA79F", "#E95420", "#77216F", "#000000"])

                // instantiate d3plus
                var visualization = d3plus.viz()
                  .container("#viz")  // container DIV to hold the visualization
                  .data($.parseJSON(campos))  // data to use with the visualization
                  .type("pie")   // visualization type
                  .id("name")
                  .size("value")                
                 .attrs(atributos)
                 .color("hex")// key for which our data is unique on
                 .draw();             


            },
            failure: function (response) {
                alert(response.d);
            },
            error: function (response) {
                alert(response.d);
            }
        });


        function groupColor(json,listParametres,listColor)
        {
            var result = "[";
            var n = listParametres.length;
            $.each(json, function (i, jsondata) {
              
                for (var j = 0 ; j < n; j++)
           
                    if (jsondata.name.toString() == listParametres[j]) {
                       
                        if (j == 0)
                        {
                            result += '{"name": "' + jsondata.name + '","hex": "' + listColor[j] + '" }';
                        }
                        else
                        {
                            result += ',{"name": "' + jsondata.name + '","hex": "' + listColor[j] + '" }';
                        }
                       
                     
                    }
            });

            result += "]";

            return $.parseJSON(result)
        }




        //// sample data array
        //var sample_data = [
        //  { "value": 100, "name": "alpha" },
        //  { "value": 70, "name": "beta" },
        //  { "value": 40, "name": "gamma" },
        //  { "value": 15, "name": "delta" },
        //  { "value": 5, "name": "epsilon" },
        //  { "value": 1, "name": "zeta" }
        //];


        //var attributes = [
        //  { "name": "alpha", "hex": "#FF0000" },
        //  { "name": "beta", "hex": "#FFCC00" },
        //   { "name": "gamma", "hex": "#0000FF" },
        //]


      
    </script>

</asp:Content>