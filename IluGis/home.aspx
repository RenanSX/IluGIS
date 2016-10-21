<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="IluGis.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="AC_OETags.js" language="javascript"></script>
    <script type="text/javascript" src="japi/API.js" language="javascript"></script>
    <script type="text/javascript" src="japi/api-common.js"></script>
    <script type="text/javascript" src="swfobject.js"></script>
    <link href="js/sliderblx/jquery.bxslider.css" rel="stylesheet" />    
    <script src="js/sliderblx/jquery.bxslider.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.3.15/proj4.js"></script>
    <link href="css/button.css" rel="stylesheet" />


    <!----TAB- agora foi---->
 <%--   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js"></script>--%>
    <link rel="stylesheet" type="text/css" href="css/estilo.css" />
    <script type="text/javascript" src="js/abas/javascript.js"></script>

    <!------------------LEAFLET --------->

    <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.css" />
	<link rel="stylesheet" href="../dist/Leaflet.Coordinates-0.1.5.css"/>
    <script src="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.js"></script>
    <%--<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>--%>

    <!-----------------------------LIB LEAFLET--------------------------->

     <script src="https://www.mapquestapi.com/sdk/leaflet/v2.s/mq-map.js?key=Kmjtd%7Cluua2qu7n9%2C7a%3Do5-lzbgq"></script>
        <script src="https://www.mapquestapi.com/sdk/leaflet/v2.s/mq-routing.js?key=Kmjtd%7Cluua2qu7n9%2C7a%3Do5-lzbgq"></script>
    <script type="text/javascript" src="/dist/Leaflet.Coordinates-0.1.5.min.js"></script>

    <script src="/dist/Leaflet-WFST.src.js"></script>
    <script src="src/L.TileLayer.BetterWMS.js"></script>
    <style>
        /*FUNDO RGB: 424263   2A2A3F*/
        /*COLOR GLOBESPOTTER*/
        /*SELECTED  RGB:#394043 27282B*/
        /*NOSELECTED RGB:#858587 555557*/
         /*TRAÇO RGB:#959596 5F5F60*/
         /*PONTO NORMAL RGB:117119114   757772*/
         /*PONTO ESPECIAL RGB: 3274135  204A87*/
         /*GRID RGB:119119119  777777*/
        .tabcontent {
            -webkit-animation: fadeEffect 1s;
            animation: fadeEffect 1s; /* Fading effect takes 1 second */
        }

        @-webkit-keyframes fadeEffect {
            from {opacity: 0;}
            to {opacity: 1;}
        }

        @keyframes fadeEffect {
            from {opacity: 0;}
            to {opacity: 1;}
        }

        .form-control2:focus {
            border-color: red;
            outline: 0;
            -webkit-box-shadow: inset 0 1px 1px rgba(255,0,0,0.3), 0 0 8px rgba(255,0,0,0.3);
            box-shadow: inset 0 1px 1px rgba(255,0,0,0.3), 0 0 8px rgba(255,0,0,0.3);
}
    </style>
    <script type="text/javascript">
       
      // For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection.
      var swfVersionStr = "11.1.0";

      // To use express install, set to playerProductInstall.swf, otherwise the empty string.
      var xiSwfUrlStr = "playerProductInstall.swf";

      var flashvars = {
          globeSpotterConfigurationFilePath: "./config/application/GlobeSpotterConfiguration_Azure_NL.xml",
          globeSpotterConfigurationId: "ortho_nl"
      };

      var params = {
          quality: "high",
          bgcolor: "#888888",
          allowscriptaccess: "always",
          allowfullscreen: "true",
          wmode: "direct"
      };

      var attributes = {
          id: "japi",
          name: "viewer_api",
          align: "middle"
      }

      // Parse key value pairs from the query portion of an URL and append them to the flashvars object.
      // The search property returns the query portion of an URL, including the question mark (?).
      var q = window.location.search;
      // The hash property returns the anchor portion of a URL, including the hash sign (#).
      // The hash portion can contain the search string due to various integrations based on an older version
      // of GlobeSpotter that contained the hash due to flash browser history.
      var h = window.location.hash;
      var s = (q) ? q : (h) ? h : "";

      swfobject.embedSWF(
                "https://globespotter.cyclomedia.com/v31/api/viewer_api.swf" + s.toLowerCase(), "flashContent",   
                "100%", "100%",
                swfVersionStr, xiSwfUrlStr,
                flashvars, params, attributes
            );

      // JavaScript enabled so display the flashContent div in case it is not replaced with a swf object.
      $("#flashContent").css("display", "block");
      

        </script>
     
    <script language='JavaScript' type="text/javascript">


        var shared = "https://globespotter.cyclomedia.com/application/?ImageId=";
        var gimageID = "";
        var gyaw = "";
        var gpitch = "";
        var ghfov = "";
        var api;
        function hst_apiReady(readyState) {

            //alert("API is ready for use.");
            //start();
            showParams();  
            openinicial();
            


            //openImage(globaID)


        }
        function apiReady()//verifica se API esta inicializada
        {
            api = document.getElementById("japi");

            var ready = api && api.getAPIReadyState();

            if (!ready) {
                alert("API not ready.");
            }

            return ready;
        }
        function openinicial() {
            
           
            if (apiReady) {
                openNearestImage("-43.9402314,-19.987048")
            }

        }
        function openNearestImage(value) {//função abrir imagem aparti de uma coordenada
            if (apiReady()) {
                var query = value; //coordenadas
                var maxLocations = 1;

                if (!query || query == "") {
                    alert("aInvalid input.");
                }
                else {
                    try {
                        api.openNearestImage(query, maxLocations);
                        
                    }
                    catch (error) {
                        alert("Error while opening an image: " + error);
                    }
                }
            }
        }
        function hst_openNearestImageResult(request, opened, imageID, position) {//função é chamda após abrir uma imagem atravez de coordenadas openNerestImage()
            gimageID = imageID;

        }
        function hst_viewChanged(viewerID, yaw, pitch, hFov) {//atualizar angulo toda vez que movimenta a view

            gyaw = yaw;
            gpitch = pitch;
            ghfov = hFov;



        }
        function showParams() {         
          
                document.getElementById("japi").setViewerRotationButtonsVisible(false);       
                document.getElementById("japi").setViewerDetailImagesVisible(true);       
                document.getElementById("japi").setRecordingLocationsVisible(true);
                  document.getElementById("japi").setAddressLocationsVisible(false);

                document.getElementById("japi").setViewerCompassVisible(false);
            
         
                     
                document.getElementById("japi").setViewerOverlayDrawDistanceEnabled(true);
                document.getElementById("japi").setViewerOverlayAlphaEnabled(true);
                document.getElementById("japi").setImageInformationEnabled(true);
                document.getElementById("japi").setViewerToolBarVisible(true);
                document.getElementById("japi").setViewerBrightnessEnabled(true);
                document.getElementById("japi").setViewerCycleZoomLevelsEnabled(true);
                document.getElementById("japi").setViewerPrintImageEnabled(true);
                document.getElementById("japi").setViewerSaveImageEnabled(true);
              


        }
        function hst_componentReady() {
            //alert("component ready" );
            try {
                //9931983
                document.getElementById("japi").setSRSNameViewer("EPSG::9931983");
                document.getElementById("japi").setSRSNameAddress("EPSG::9931983");

                document.getElementById("japi").setAddressLanguageCode("br");
                //	document.getElementById("japi").setAddressDatabase("CMDatabase");
                document.getElementById("japi").setAPIKey("SnUhCDkd2L4F6jQtu3olyrYJGzAtGnkpCjMdiv0dyLcl-3Ix2DgZeXQF6_w5KLEZ");
                document.getElementById("japi").setUserNamePassword('<% = Session["User"]%>', '<% = Session["password"]%>');
                document.getElementById("japi").setServiceURL("http://atlas.cyclomedia.com", 256);
                
            }
            catch (Error) // Its A String ...
            {
                alert("Component Ready Error: " + Error);
            }
        }
      

     </script>
    <script src="japi/messurement.js"></script>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width">

      <%--<!-- jQuery -->
      <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>--%>
    
      <!-- Fotorama -->
      <link href="fotorama.css" rel="stylesheet">
      <script src="fotorama.js"></script>

      <!-- Just don’t want to repeat this prefix in every img[src] -->
      
            
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

     <div class="content">
          
       <form autocomplete="off" runat="server" class="form-inline" style="width: 100%;" name="myForm" novalidate>
           <asp:HiddenField ID="hfLoginPK" runat="server" Value="" />
            <asp:HiddenField ID="hfPermissao" runat="server" Value="" />
            <asp:HiddenField ID="hfCodilumPK" runat="server" Value="" />  
            <asp:HiddenField ID="hfkmlID" runat="server" Value="" /> 
           
           
            <asp:ScriptManager ID="ScriptManager1" runat="server"/>
              <!-----------------Inicio Titulo----------------------------------------------------->
<div class="row" style="margin-bottom:5px;">
<div class="col-md-12 col-sm-12">
<h4 style="text-align: center;">Sistema de Cadastro de Iluminação</h4>
</div>
</div>
<!--------------------Fim titulo--------------------------------------------------------->


<!--------------Inicio Row notificacao-------------------------------------------------------------------->	
<div class="row" id="notificacao">
<div runat="server" id="Msucesso" visible="false" class="alert alert-success me" >                                
</div>
<div runat="server" id="Malerta" visible="false" class="alert alert-warning">               
</div>
<div runat="server" id="Merro" visible="false" class="alert alert-danger">                
</div>
</div>
	
<!------------------Inicio Primeira Row, BUSCA (lcalidade/equipe e Código do ponto de iluminação, postes padrões e globespotter com googlemaps---------------->	
<div class="row" id="busca">
<div  ID="localidade" class=" col-md-3 col-sm-3 col-md-offset-1 col-sm-offset-1" style="margin-bottom: 8px">             
<asp:DropDownList  Style="width: 82%;  display:inline-block;" ID="ddllocalidade" class=" form-control input-sm " runat="server" title="Equipe"  autofocus="true">
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
<a runat="server" href="help.aspx#equipe" target="_blank"  >
<span class="glyphicon glyphicon-question-sign" title="Ajuda" style="font-size: 18px" ></span>
</a>
</div>

<div ID="codigo" class="col-md-3 col-sm-3" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtCodIluminacao" title="Codigo da Iluminação" class="form-control" style="width: 70%; display:inline-block;" placeholder="Codigo da Iluminação" ></asp:TextBox>
	
<a href="javascript:prev();">
<span class="glyphicon glyphicon-chevron-left" title="Código anterior" style="font-size: 12px"></span>
</a>
<a href="javascript:next();">
<span class="glyphicon glyphicon-chevron-right" title="Código seguinte" style="font-size: 12px"></span>
</a>
<a id="infolista">
<span class="glyphicon glyphicon-search" title="Buscar" style="font-size: 14px; cursor:pointer;"></span>
</a>
</div>

<div class="col-md-2 col-sm-2" id="globe-spotter">
<button style=" background-color: #A4D3EE;" id="globespotter"  title="Abrir cyclorama no GlobeSpotter" type="button" >
<span class="glyphicon glyphicon-globe globespotter" aria-hidden="true" style="font-size: 16px"></span>
</button>

<button style=" background-color:#9AFF9A; height: 26px;" id="google"  title="Abrir Google Maps" type="button" >
<span class="glyphicon glyphicon-globe google" aria-hidden="true" style="font-size: 16px"></span>
</button>   

<button id="btnclear"  title="Limpar todos os campos" type="button" >
<span class="glyphicon glyphicon-erase " aria-hidden="true" style="font-size: 16px"></span>
</button>    
    
</div>

<div id="padrao" class="col-md-2 col-sm-2" style="margin-bottom: 8px; display:inline-block;">
 
<button  id="btncomuncurto"  title="Ponto mais cadastrado com braço curto" type="button" style=" background-color:#00BFFF" >
<span class="glyphicon glyphicon-import btncomun" aria-hidden="true" style="font-size: 16px"></span>
</button>

<button  id="btncomunmedio"  title="Ponto mais cadastrado com Braço Médio" type="button" style=" background-color:#FFA500" >
<span class="glyphicon glyphicon-import btncomun" aria-hidden="true" style="font-size: 16px"></span>
</button>

<button  id="btncomunlongo"  title="Ponto mais cadastrado com Braço Longo" type="button" style=" background-color:#FF4040">
<span class="glyphicon glyphicon-import btncomun" aria-hidden="true" style="font-size: 16px"></span>
</button>

<button  id="btncomunrodovia"  title="Ponto mais cadastrado em Rodovias" type="button" style=" background-color:#EE7AE9">
<span class="glyphicon glyphicon-import btncomun" aria-hidden="true" style="font-size: 16px"></span>
</button>
<a runat="server" href="help.aspx#postes_padroes" target="_blank" >
<span class="glyphicon glyphicon-question-sign" title="Ajuda"  style="font-size: 18px"></span>
</a>   

</div>

</div>

<!-----------------------Inicio da Row 1 (Tipo de braço, projeção do Braço, tipo de poste, altura poste e quantidade de luminarias)------------------->
<div class="row" id="linha-1">

<div ID="tipobraco" title="Tipo de braço" class="col-md-2 col-sm-2 col-md-offset-1 col-sm-offset-1" style="margin-bottom: 8px">
<asp:DropDownList  Style="width: 82%; display:inline-block;" ID="ddlTipoBraco" class=" form-control input-sm " runat="server"  autofocus="true">
<asp:ListItem Text ="Tipo de braço" Value = "-1"></asp:ListItem>
<asp:ListItem Text ="Curto" Value = "Curto"></asp:ListItem>   
<asp:ListItem Text ="Médio" Value = "Medio"></asp:ListItem>
<asp:ListItem Text ="Médio Pesado" Value = "Medio Pesado"></asp:ListItem>      
<asp:ListItem Text ="Longo" Value = "Longo"></asp:ListItem>   
<asp:ListItem Text ="Especial" Value = "Especial"></asp:ListItem>
<asp:ListItem Text ="Sem Braço" Value = "Sem braco"></asp:ListItem>                                             
</asp:DropDownList> 
<a runat="server" href="help.aspx#tipo_de_braco" target="_blank" >
<span class="glyphicon glyphicon-question-sign" title="Ajuda"  style="font-size: 18px"></span>
</a>                                     
</div>

<div ID="projecaobraco" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtProjBraco" title="Projeção de Braço (em M)" class="form-control  " style="width: 82%; display:inline-block;" placeholder="Projeção de Braço (em M)" ></asp:TextBox>
<a runat="server" href="help.aspx#projecao_do_braco" target="_blank">
<span class="glyphicon glyphicon-question-sign" title="Ajuda"  style="font-size: 18px"></span>
</a>
</div>

<div ID="tipoposte" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:DropDownList  Style="width: 82%; display:inline-block;" ID="ddlTipoPoste" title="TIpo de Poste" class=" form-control input-sm " runat="server"  autofocus="true">
<asp:ListItem Text ="Tipo de poste" Value = "-1"></asp:ListItem>
<asp:ListItem Text ="Metálico" Value = "Metalico"></asp:ListItem>
<asp:ListItem Text ="Concreto Circular" Value = "Concreto Circular"></asp:ListItem>
<asp:ListItem Text ="Madeira" Value = "Madeira"></asp:ListItem>
<asp:ListItem Text ="Concreto Duplo T" Value = "Concreto Duplo T"></asp:ListItem>
</asp:DropDownList>
<a runat="server" href="help.aspx#tipo_de_poste" target="_blank">
<span class="glyphicon glyphicon-question-sign" title="Ajuda" style="font-size: 18px"></span>
</a>                 
</div>

<div ID="alturaposte" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtAltPoste" title="Altura do Poste" class="form-control numerotxt " style="width: 82%; display:inline-block;" placeholder="Altura do Poste"></asp:TextBox>
<a runat="server" href="help.aspx#altura_do_poste" target="_blank" style="font-size: 18px">
<span class="glyphicon glyphicon-question-sign" title="Ajuda" style="font-size: 18px"></span>
</a>
</div>
<div ID="alturainstluminaria" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtAltInstLum" title="Altura dw instalação da Luminária" class="form-control " style="width: 82%; display:inline-block;" placeholder="Altura de instalação da LUMINÁRIA"></asp:TextBox>                
<a runat="server" href="help.aspx#altura_da_instalacao_luminaria" target="_blank">
<span class="glyphicon glyphicon-question-sign" title="Ajuda" style="font-size: 18px"></span>
</a>
</div>
    
</div>

<!----------------------Inicio Row 2 (tipo de luminaria, tipo reator, tipo rele, quantidade fonte luminosa e tipo fonte luminosa)--------------------->
<div class="row" id="linha-2">

<div ID="tipoluminaria" class="col-md-2 col-sm-2 col-md-offset-1 col-sm-offset-1" style="margin-bottom: 8px">
<asp:DropDownList  Style="width: 82%; display:inline-block;" ID="ddlTipoLum" title="Tipo de Luminária" class=" form-control input-sm " runat="server" autofocus="true">
<asp:ListItem Text ="Tipo de luminária" Value = "-1"></asp:ListItem>   
<asp:ListItem Text ="Corpo único aberta" Value = "Corpo unico aberta"></asp:ListItem>   
<asp:ListItem Text ="Corpo único fechada com vidro" Value = "Corpo unico fechada com vidro"></asp:ListItem>   
<asp:ListItem Text ="Corpo único fechada com policarbonato" Value = "Corpo unico fechada com policarbonato"></asp:ListItem>   
<asp:ListItem Text ="Integrada vidro" Value = "Integrada vidro"></asp:ListItem>   
<asp:ListItem Text ="Integrada policarbonato" Value = "Integrada policarbonato"></asp:ListItem>
<asp:ListItem Text ="Decorativa esférica" Value = "Decorativa esferica"></asp:ListItem>
<asp:ListItem Text ="Decorativa semi-esférica" Value = "Decorativa semi-esférica"></asp:ListItem>
<asp:ListItem Text ="Petalar" Value = "Petalar"></asp:ListItem>
<asp:ListItem Text ="Outros" Value = "Outros"></asp:ListItem>                   
</asp:DropDownList>
<a runat="server" href="help.aspx#tipo_de_luminaria" target="_blank">
<span class="glyphicon glyphicon-question-sign" title="Ajuda" style="font-size: 18px"></span>
</a>                                       
</div>

<div ID="tiporele" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:DropDownList  Style="width: 82%; display:inline-block;" ID="ddlTipoRele" title="Tipo de  Relé" class=" form-control input-sm " runat="server"  autofocus="true">
<asp:ListItem Text ="Tipo de relé" Value = "-1"></asp:ListItem>
<asp:ListItem Text ="Integrado na luminária" Value = "Integrado na luminaria"></asp:ListItem>   
<asp:ListItem Text ="No poste" Value = "No poste"></asp:ListItem>   
<asp:ListItem Text ="Comando em grupo" Value = "Comando em grupo"></asp:ListItem>   
<asp:ListItem Text ="Inexistente" Value = "Inexistente"></asp:ListItem>                
</asp:DropDownList>
<a runat="server" href="help.aspx#tipo_de_rele" target="_blank">
<span class="glyphicon glyphicon-question-sign" title="Ajuda" style="font-size: 18px"></span>
</a>
</div>

<div ID="tiporeator" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:DropDownList  Style="width: 82%; display:inline-block;" ID="ddlTipoReator" title="Tipo de Reator" class=" form-control input-sm " runat="server"  autofocus="true">
<asp:ListItem Text ="Tipo de reator" Value = "-1"></asp:ListItem>
<asp:ListItem Text ="Interno" Value = "Interno"></asp:ListItem>   
<asp:ListItem Text ="Externo" Value = "Externo"></asp:ListItem>                                                
</asp:DropDownList>
<a runat="server" href="help.aspx#tipo_de_reator" target="_blank">
<span class="glyphicon glyphicon-question-sign" title="Ajuda" style="font-size: 18px"></span>
</a>
</div>

<div ID="qtdeluminarias" class="col-md-2 col-sm-2">
<asp:DropDownList  Style="width: 82%; display:inline-block;" ID="ddlQtdeLum" title="Quantidade de Luminárias" class=" form-control input-sm " runat="server"  autofocus="true">
<asp:ListItem Text ="Quantidade de Luminárias" Value = "-1"></asp:ListItem>
<asp:ListItem Text ="1" Value = "1"></asp:ListItem>   
<asp:ListItem Text ="2" Value = "2"></asp:ListItem>   
<asp:ListItem Text ="3" Value = "3"></asp:ListItem>   
<asp:ListItem Text ="4" Value = "4"></asp:ListItem>   
<asp:ListItem Text ="5" Value = "5"></asp:ListItem>   
<asp:ListItem Text ="6" Value = "6"></asp:ListItem>
<asp:ListItem Text ="7" Value = "7"></asp:ListItem>
<asp:ListItem Text ="8" Value = "8"></asp:ListItem>
<asp:ListItem Text ="9" Value = "9"></asp:ListItem>
<asp:ListItem Text ="10" Value = "10"></asp:ListItem>                    
</asp:DropDownList>
<a runat="server" href="help.aspx##quantidade_de_luminarias" target="_blank" style="font-size: 18px; text-align: center;">
<span class="glyphicon glyphicon-question-sign" title="Ajuda" style="font-size: 18px"></span>
</a>
</div>   

<div ID="qtdefonteluminosa" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:DropDownList  Style="width: 82%; display:inline-block;" ID="ddlQtdeFonteLum" title="Quantidade de Fontes Luminosas" class=" form-control input-sm " runat="server"  autofocus="true">
<asp:ListItem Text ="Quantidade de Fontes Luminosas" Value = "-1"></asp:ListItem>
<asp:ListItem Text ="1" Value = "1"></asp:ListItem>   
<asp:ListItem Text ="2" Value = "2"></asp:ListItem>   
<asp:ListItem Text ="3" Value = "3"></asp:ListItem>   
<asp:ListItem Text ="4" Value = "4"></asp:ListItem>   
<asp:ListItem Text ="5" Value = "5"></asp:ListItem>   
<asp:ListItem Text ="6" Value = "6"></asp:ListItem>
<asp:ListItem Text ="7" Value = "7"></asp:ListItem>
<asp:ListItem Text ="8" Value = "8"></asp:ListItem>
<asp:ListItem Text ="9" Value = "9"></asp:ListItem>
<asp:ListItem Text ="10" Value = "10"></asp:ListItem>                    
</asp:DropDownList>
<a runat="server" href="help.aspx#quantidade_de_fontes_luminosas" target="_blank">
<span class="glyphicon glyphicon-question-sign" title="Ajuda" style="font-size: 18px"></span>
</a>
</div>

</div>

<!-----------------------------Inicio Row 3 (Medição, altura instalacao luminaria, classe iluminacao, potencia fonte luminosa, tipo alimentacao)---------------->
<div class="row" id="linha-3">
<div ID="tipofontlum" class="col-md-2 col-sm-2 col-md-offset-1 col-sm-offset-1" style="margin-bottom: 8px">
<asp:DropDownList  Style="width: 82%; display:inline-block;" ID="ddlTipoFonteLum" title="Tipo de Fonte Luminosa" class=" form-control input-sm " runat="server"  autofocus="true">
<asp:ListItem Text ="Tipo de Fonte Luminosa" Value = "-1"></asp:ListItem>                
<asp:ListItem Text ="Vapor Sódio" Value = "Sodio"></asp:ListItem>   
<asp:ListItem Text ="Vapor Metálico" Value = "Metalico"></asp:ListItem>   
<asp:ListItem Text ="Vapor Mercúrio" Value = "Mercurio"></asp:ListItem>
<asp:ListItem Text ="Led" Value = "Led"></asp:ListItem>                
</asp:DropDownList>
<a runat="server" href="help.aspx#tipo_de_fonte_luminaria" target="_blank">
<span class="glyphicon glyphicon-question-sign" title="Ajuda" style="font-size: 18px"></span>
</a>
</div>

<div ID="potenciafonteluminosa" class="col-md-2 col-sm-2 " style="margin-bottom: 8px">
<asp:DropDownList  Style="width: 82%; display:inline-block;" ID="ddlPotFonteLum" title="Potência da Fonte Luminosa (W)" class=" form-control input-sm " runat="server"  autofocus="true">
<asp:ListItem Text ="Potência da fonte luminosa (W)" Value = "-1"></asp:ListItem>
<asp:ListItem Text ="6W" Value = "6"></asp:ListItem> 
<asp:ListItem Text ="35W" Value = "35"></asp:ListItem>
<asp:ListItem Text ="40W" Value = "40"></asp:ListItem>
<asp:ListItem Text ="54W" Value = "54"></asp:ListItem>
<asp:ListItem Text ="55W" Value = "55"></asp:ListItem>
<asp:ListItem Text ="58W" Value = "58"></asp:ListItem>   
<asp:ListItem Text ="70W" Value = "70"></asp:ListItem>   
<asp:ListItem Text ="80W" Value = "80"></asp:ListItem>
<asp:ListItem Text ="86W" Value = "86"></asp:ListItem>   
<asp:ListItem Text ="100W" Value = "100"></asp:ListItem>   
<asp:ListItem Text ="125W" Value = "125"></asp:ListItem>
<asp:ListItem Text ="127W" Value = "127"></asp:ListItem>
<asp:ListItem Text ="150W" Value = "150"></asp:ListItem>
<asp:ListItem Text ="250W" Value = "250"></asp:ListItem>
<asp:ListItem Text ="350W" Value = "350"></asp:ListItem>
<asp:ListItem Text ="400W" Value = "400"></asp:ListItem>                                                 
</asp:DropDownList>
<a runat="server" href="help.aspx#potencia_da_fonte_luminosa" target="_blank" >
<span class="glyphicon glyphicon-question-sign" title="Ajuda" style="font-size: 18px"></span>
</a>
</div>
    
<div ID="tipoalimentacao" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:DropDownList  Style="width: 82%; display:inline-block;" title="Tipo de Alimentação" ID="ddlTipoAlimentacao" class=" form-control input-sm " runat="server"  autofocus="true">
<asp:ListItem Text ="Tipo de alimentação" Value = "-1"></asp:ListItem> 
<asp:ListItem Text ="Aéreo" Value = "Aereo"></asp:ListItem>   
<asp:ListItem Text ="Subterrâneo" Value = "Subterraneo"></asp:ListItem>                     
</asp:DropDownList> 
<a runat="server" href="help.aspx#tipo_de_alimentacao" target="_blank">
<span class="glyphicon glyphicon-question-sign" title="Ajuda" style="font-size: 18px"></span>
</a>  
</div>
    
<div ID="classeilum" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:DropDownList  Style="width: 82%; display:inline-block;" ID="ddlClassIlum" title="Classe de iluminação" class=" form-control input-sm " runat="server"  autofocus="true">
<asp:ListItem Text ="Classe de Iluminação" Value = "-1"></asp:ListItem>
<asp:ListItem Text ="V1" Value = "V1"></asp:ListItem>   
<asp:ListItem Text ="V2" Value = "V2"></asp:ListItem>   
<asp:ListItem Text ="V3" Value = "V3"></asp:ListItem>   
<asp:ListItem Text ="V4" Value = "V4"></asp:ListItem>
<asp:ListItem Text ="V5" Value = "V5"></asp:ListItem>
<asp:ListItem Text ="P1" Value = "P1"></asp:ListItem>
<asp:ListItem Text ="P2" Value = "P2"></asp:ListItem>
<asp:ListItem Text ="P3" Value = "P3"></asp:ListItem>
<asp:ListItem Text ="P4" Value = "P4"></asp:ListItem>             
</asp:DropDownList>
<a runat="server" href="help.aspx#classe_de_iluminacao" target="_blank"> 
<span class="glyphicon glyphicon-question-sign" title="Ajuda" style="font-size: 18px"></span>
</a>
</div>

<div ID="medicao" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtMed" title="Medição" class="form-control" style="width: 82%; display:inline-block;" placeholder="Medição"></asp:TextBox>
<a runat="server" href="help.aspx#medicao" target="_blank">
<span class="glyphicon glyphicon-question-sign" title="Ajuda" style="font-size: 18px"></span>
</a>
</div>					
</div>

<!----------------------Inicio Row 4 (Municipio, Regional, Bairro, CEP e Logradouro)----------------------------------------------------->
<div class="row" id="linha-4">

<div ID="municipio" class="col-md-2 col-sm-2 col-md-offset-1 col-sm-offset-1" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtMun" title="Município" class="form-control" style="width: 82%" placeholder="Município">Belo Horizonte</asp:TextBox>                   
</div>

<div ID="regional" class="col-md-2 col-sm-2 " style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtReg" title="Regional" class="form-control" style="width: 82%" placeholder="Regional"></asp:TextBox>
</div>

<div ID="bairro" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtBair" title="Bairro" class="form-control" style="width: 82%" placeholder="Bairro"></asp:TextBox>
</div>

<div ID="CEP" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtCEP" title="CEP" class="form-control cepTxt" style="width: 82%" placeholder="CEP"></asp:TextBox>
</div>

<div ID="logradouro" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtLog" title="Logradouro" class="form-control" style="width: 82%" placeholder="Logradouro"></asp:TextBox>
</div>
</div>

<!------------------Inicio Row 5(Codigo logradouro, iluminacao destaque, nome local destaque, potencia total das fontes e carga instalada total UIP)-------------->
<div class="row" id="linha-5">

<div ID="codlogradouro" class="col-md-2 col-sm-2 col-md-offset-1 col-sm-offset-1" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtCodLog" title="Código do Logradouro" class="form-control numerotxt" style="width: 82%" placeholder="Código do Logradouro"></asp:TextBox>
</div>

<div ID="ilumdestaq" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:DropDownList  Style="width: 82%" id="ddlIlumDest" title="Iluminação de Destaque" class=" form-control input-sm " runat="server"  autofocus="true">
<asp:ListItem Text ="Iluminação de destaque" Value = "-1"></asp:ListItem>
<asp:ListItem Text ="Sim" Value = "2" ></asp:ListItem>
<asp:ListItem Text ="Não" Value = "1" Selected></asp:ListItem>   
</asp:DropDownList>                  
</div>

<div ID="nomelocaldestaq" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtNomeLocDestaq" title="Nome do local de destaque" class="form-control" style="width: 82%" placeholder="Nome do local de destaque"></asp:TextBox>
</div>

<div ID="potenciatotalfontesluminosas" class="col-md-2 col-sm-2" style="margin-bottom: 8px">                        
<asp:TextBox runat="server" type="text" id="txtPotTotFonteLum" title="Potência Total das Fontes Luminosas" class="form-control" style="width: 82%" placeholder="Potência Total das Fontes Luminosas"></asp:TextBox>                     
</div>

<div ID="cargainstaladatotalUIP" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtCargInsTotUIP" title="Carga Instalada Total da UIP em (kW)" class="form-control" style="width: 82%" placeholder="Carga Instalada Total da UIP em (kW)"></asp:TextBox>
</div>
</div>	

<!---------------------------Inicio Row 6(Perda potencia total equipamentos, Tipo de circuito, material do condutor, bitola do condutor, fase do transformador)--------->
<div class="row" id="linha-6" style="display:none">

<div ID="perdapottotequiaux" class="col-md-2 col-sm-2 col-md-offset-1 col-sm-offset-1" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtPerdaPotTotEquipAux" title="Perda da Potência Total dos equipamentos auxiliares" class="form-control " style="width: 82%" placeholder="Perda da Potência Total dos equipamentos auxiliares"></asp:TextBox>
</div>

<div ID="tipocircuito" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtTipoCircuito" title="Tipo de circuito" class="form-control " style="width: 82%" placeholder="Tipo de Circuito"></asp:TextBox>
</div>

<div ID="materialcondutor" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtMaterialCondutor" title="Material do Condutor" class="form-control " style="width: 82%" placeholder="Material do condutor"></asp:TextBox>
</div>

<div ID="bitolacondutor" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtBitolaCondutor" title="Bitola do Condutor" class="form-control " style="width: 82%" placeholder="Bitola do Condutor"></asp:TextBox>
</div>

<div ID="fasetransformador" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="TextBox1" title="Fase do Transformador" class="form-control " style="width: 82%" placeholder="Fase do Transformador"></asp:TextBox>
</div>
</div>

<!-------Inicio Row 7 (UTM, numero poste, precisao, poste no prumo e poste com avaria----------------------------------------------------------------------->

<div class="row" id="linha-7" style="display:none">

<div ID="potenciatransformador" class="col-md-2 col-sm-2   col-md-offset-1 col-sm-offset-1" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtPotTrans" title="Potência do Transformador" class="form-control " style="width: 82%" placeholder="Potência do Transformador"></asp:TextBox>
</div>

<div ID="utm" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:TextBox Style="width: 82%" id="txtGeoUTM" type="text" placeholder="Georeferencial UTM" class="form-control input-sm" title="Georeferencial UTM" runat="server" name="Georeferencial UTM"></asp:TextBox>
</div>

<div ID="prcisao" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtPrecisao" title="Precisão" class="form-control " style="width: 82%" placeholder="Precisão"></asp:TextBox>
</div>

<div ID="numposte" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtNumPoste" title="Número do Poste" class="form-control numerotxt" style="width: 82%" placeholder="Número do Poste"></asp:TextBox>
</div>

<div ID="posteprumo" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:DropDownList  Style="width: 82%; display:inline-block;" title="Poste no Prumo" ID="ddlPostePrumo" class=" form-control input-sm " runat="server"  autofocus="true">
<asp:ListItem Text ="Poste no Prumo" Value = "-1"></asp:ListItem> 
<asp:ListItem Text ="Sim" Value = "sim"></asp:ListItem>   
<asp:ListItem Text ="Não" Value = "nao"></asp:ListItem>                     
</asp:DropDownList>
</div>
</div>

<!-------Inicio Row 8 (UTM, numero poste, precisao, poste no prumo e poste com avaria)----------------------------------------------------------------------->

<div class="row" id="linha-8" style="display:none">
<div ID="postoavaria" class="col-md-2 col-sm-2 col-md-offset-1 col-sm-offset-1" style="margin-bottom: 8px">
<asp:DropDownList  Style="width: 82%; display:inline-block;" title="Posto com avaria" ID="ddlPostoAvaria" class=" form-control input-sm " runat="server"  autofocus="true">
<asp:ListItem Text ="Posto com avaria" Value = "-1"></asp:ListItem> 
<asp:ListItem Text ="Sim" Value = "sim"></asp:ListItem>   
<asp:ListItem Text ="Não" Value = "nao"></asp:ListItem>                     
</asp:DropDownList>
</div>


<div ID="LampadaAcesaDia" class="col-md-2 col-sm-2 " style="margin-bottom: 8px">
<asp:DropDownList  Style="width: 82%; display:inline-block;" title="Lâmpada acesa durante o dia" ID="ddlLampAcesaDia" class=" form-control input-sm " runat="server"  autofocus="true">
<asp:ListItem Text ="Lâmpada acesa durante o dia" Value = "-1"></asp:ListItem> 
<asp:ListItem Text ="Sim" Value = "sim"></asp:ListItem>   
<asp:ListItem Text ="Não" Value = "nao"></asp:ListItem>                     
</asp:DropDownList>
</div>

<div ID="numproximo" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:TextBox runat="server" type="text" id="txtNumeroMaisProx" title="Número mais próximo" class="form-control numerotxt" style="width: 100%" placeholder="Número mais próximo"></asp:TextBox>
</div>

<div ID="SituacaoLuminaria" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:DropDownList  Style="width: 82%; display:inline-block;" title="Situação da Luminária" ID="ddlSituacaoLum" class=" form-control input-sm " runat="server"  autofocus="true">
<asp:ListItem Text ="Situação da Luminária" Value = "-1"></asp:ListItem> 
<asp:ListItem Text ="Lente suja" Value = "lente suja"></asp:ListItem>   
<asp:ListItem Text ="Luminária aberta" Value = "luminaria aberta"></asp:ListItem>
<asp:ListItem Text ="Luminária sem lente" Value = "luminaria sem lente"></asp:ListItem>  
<asp:ListItem Text ="Luminária virada para cima" Value = "luminaria virada para cima"></asp:ListItem>  
<asp:ListItem Text ="Braço em luminária" Value = "braco sem luminaria"></asp:ListItem>  
<asp:ListItem Text ="Luminária danificada" Value = "luminaria danificada"></asp:ListItem>                       
</asp:DropDownList>
</div>

<div ID="obstrucaoilum" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:DropDownList  Style="width: 82%; display:inline-block;" title="obstrução da iluminação" ID="ddlObsIlum" class=" form-control input-sm " runat="server"  autofocus="true">
<asp:ListItem Text ="Obstrução da iluminação" Value = "-1"></asp:ListItem> 
<asp:ListItem Text ="Iluminação não obstruida" Value = "iluminacao nao obstruida"></asp:ListItem>   
<asp:ListItem Text ="Obstrução parcial por arborização" Value = "obstrucao parcial pro arborizacao"></asp:ListItem>
<asp:ListItem Text ="Obstrução total por arborização" Value = "obstrucao total por arborizacao"></asp:ListItem>                  
</asp:DropDownList>
</div>


</div>


<!----------------Inicio Row Geocode (Latitude, Longitude, icone e observãcao)--------------------------------->
<div class="row" id="geocode">

<div ID="latitude" class="col-md-2 col-sm-2 col-md-offset-1 col-sm-offset-1" style="margin-bottom: 8px">
<asp:TextBox Style="width: 82%" type="text" placeholder="Latitude" class="form-control input-sm" ID="txtLat" title="Latitude" runat="server" name="Latitude"></asp:TextBox>
</div>

<div ID="longitude" class="col-md-2 col-sm-2" style="margin-bottom: 8px">
<asp:TextBox Style="width: 82%" type="text" placeholder="Longitude" class="form-control input-sm" ID="txtLng" title="Longitude" runat="server" name="Longitude"></asp:TextBox>
<button type="button" id="openGlobe" style="height: 29px;">
<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
</button>
</div>

 <div ID="observacao" class="col-md-4 col-sm-4" style="margin-bottom: 8px">
<asp:TextBox Style="width: 92%" type="text" placeholder="Observação" class="form-control input-sm" ID="txtObservacao" title="Observação" runat="server" name="Observacao"></asp:TextBox>
</div>

<div class="col-md-2 col-sm-2">
<asp:LinkButton Style="width: 82%; margin-bottom: 8px;" ID="LinkButtonCadastrar" OnClick="bntCadastrar_Click" runat="server"  type="button" class="btn btn-primary btn-sm pull-left cadastrar">
<center> Cadastrar </center>
</asp:LinkButton>

<asp:LinkButton Style="width: 50%; display:none; margin-bottom: 8px;" OnClick="bntAlterar_Click" ID="LinkButtonAlterar"  runat="server"  type="button" class="btn btn-primary btn-sm pull-left cadastrar">
<center> Alterar </center>
</asp:LinkButton>
<button style="width:30%; display:none; float:right; margin-bottom: 8px; margin-left:3%;" id="deletarInfo"   class="btn btn-danger pull-left btn-sm btn-xl" title="Excluir Dados Iluminação" type="button" >
<span class="glyphicon glyphicon-trash delete" aria-hidden="true"></span>
</button>

</div>
</div>

<!---------------Inicio Row Medição------------------------------------------------------>
<div class="row" id="controlmedicao">
    <div class="col-md-10 col-md-offset-1">
       <ul class="tab">
          <li><a href="javascript:void(0)" id="linkpoint" class="tablinks  btn disabled" onclick="openmedicao(event, '1')"><img src="lib/images/point.png" width="8" height="8" /></a></li>
          <li><a href="javascript:void(0)" id="linkline"  class="tablinks  btn disabled" onclick="openmedicao(event, '2')"><img src="lib/images/line.png" width="16" height="16" /></a></li>
          <li><a href="javascript:void(0)" id="linkpoly" class="tablinks  btn disabled" onclick="openmedicao(event, '3')"><img src="lib/images/poly.png" width="16" height="16" /></a></li>
          <li><a href="javascript:void(0)" id="playmedicao" class="tablinks" style="height: 26px;" onclick="enable()"><span class="glyphicon glyphicon-play-circle"></span></a></li>
        </ul>
        

        <div id="featuregeo" class="tabcontent">
            <div style="height:100%; width:100%; margin-bottom:5px;">                            
                                   
            </div>
            <div style="width: 100%; display: inline-block; position: relative;">
                    <div style="width: 50%; float: left">                      
                    <select id="measurementList" onchange="selectMeasurement()" title="Selecionar medição" style="color:Black; width:10%;"></select>                        
                    <a id="btnplus" href="javascript:void(0)" onclick="createPointMeasurement();" class="myButton" title="Iniciar uma nova medição">Nova medição</a>
                    <a id="btnopenponto"href="javascript:void(0)" onclick="openMeasurement();" class="myButton"  title="Abrir medição selecionada">Abrir</a>
                    <a id="btncloseponto" href="javascript:void(0)" onclick="closeMeasurement();" class="myButton"  title="Fechar medição selecionada">Fechar</a>
                    <div style="float:right;  width:22%;">
                         <input style="float:left;  " type="button" id="btnremoveponto" class="btn btn-danger btnMedicao" onclick="removeAllMeasurement();" value="Apagar"  title="Apagar todas as medição"/>
                    </div>
                        <br />
                    <input type="checkbox" id="telaModeToggle" onClick="travar();"/>
                        <label style="color:Black;"  class="tiny-label">Travar tela</label>
                    <input checked="checked" type="checkbox" id="smartClickModeToggle" onClick="toggleSmartClickMode();"/>
                        <label style="color:Black;"  class="tiny-label">Clique inteligente</label>
                    <input checked="checked" type="checkbox" id="seriesModeToggle" onClick="toggleSeriesMode();" />
                        <label style="color:Black;"  title="">Habilitar series  </label><br />
                    </div>
                <div style="width: 50%; float: right">
                   
                </div>
            </div>
            </div>

       <div id="divPontoInfo">

       </div>
        <div id="divLinhaInfo">

       </div>
        <div id="divPoliInfo">

       </div>

    </div>
</div>

           
           
 <!--------Inicio Row Globespotter e fotos-------------------------------------------------->                  
<div id="globespotter_fotos" class="row" style="margin-bottom:2px; overflow:hidden;">
<div class="col-md-5 col-md-offset-1">
<div id="flashDiv"  style="height:530px;width:100%;">

<div id="flashContent">
               
<script type="text/javascript">
document.write(
"<a href='http://www.adobe.com/go/getflashplayer'><img src='"
+ (document.location.protocol == "https:" ? "https:" : "http:") +
"//www.adobe.com/images/shared/download_buttons/get_flash_player.gif' alt='Get Adobe Flash player' /></a>"
);
</script>

</div>                        

</div>
</div>

<div class="col-md-5">
<div id="sliderblx">

<ul class='bxslider' style='height: 100%; width: 100%; position: absolute; padding:0;' >

<li style='float: none; list-style: none; position: absolute; width: 467px; z-index: 0; display: block;'>
<img src="img/logo_arya.jpg"  height="530"/>
                        
</li>
<li style='float: none; list-style: none; position: absolute; width: 467px; z-index: 0; display: block;'>
<img src="img/logo_arya.jpg"  height="530"/>
                        
</li>
</ul>
</div>
                     
</div>
                               

</div>

<!-------------------------------------Mapa----------------------------------------------->
<div class="row" id="mapa" style="margin-top: 5px;">
<div class="col-md-10 col-md-offset-1">
<div id="map" style="width:100%; height:500px; margin: 0;"></div>
</div>
</div>

<input type="hidden" id="_ispostback" value="<%=Page.IsPostBack.ToString()%>" />
</form>
   

</div>
    
    <script>
        
        function travar() {
            if (telaModeToggle.checked) {
                $(document).bind('scroll', function () {
                    window.scroll(0, 410);
                });
            } else {
                $(document).unbind('scroll');
                $('globespotter_fotos').css({ 'overflow': 'visible' });
            }
            }

        function isPostBack() { //function to check if page is a postback-ed one
            return document.getElementById('_ispostback').value;
        }


        var lista=[];
        var pos = -1;
        var marker1 = new Array();
        var ilum = L.layerGroup();


        function enable()
        {
            if (document.getElementById('linkpoint').className == "tablinks  btn disabled")
            {
                document.getElementById('playmedicao').style.backgroundColor = "#27282B";
                document.getElementById('playmedicao').style.height = "26px";
                document.getElementById('linkpoint').className = "tablinks";
                document.getElementById('linkline').className = "tablinks";
                document.getElementById('linkpoly').className = "tablinks";
            }
            else
            {
                var tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                document.getElementById('playmedicao').style.backgroundColor = "#555557";
                document.getElementById('linkpoint').className = "tablinks  btn disabled";
                document.getElementById('linkline').className = "tablinks  btn disabled";
                document.getElementById('linkpoly').className = "tablinks  btn disabled";
            }
            
        }
         

        $("#google").click(function () {
            var lat = $('#<%=txtLat.ClientID%>').val().trim();
            var lng = $('#<%=txtLng.ClientID%>').val().trim();
            if (lat != "" || lng != "") {
                window.open("http://maps.google.com/maps?q=" + lat + "," + lng);
            }
            
        });

        $("#globespotter").click(function () {// icone que habilita opções de medição

            window.open(returnURL(), '_new');

        });  

     


        $("#openGlobe").click(function () {// icone que habilita opções de medição
            
           
            var lat = $('#<%=txtLat.ClientID%>').val();
            var lng = $('#<%=txtLng.ClientID%>').val();
            if(lat != "" && lng!="")
            {
                openNearestImage(lng + ',' + lat);
                $.ajax({
                    type: "POST",
                    url: '<%=ResolveUrl("~/Classes/Service.asmx/Geocode") %>',
                    data: "{ 'lat':'" + lat + "', 'lng':'" + lng + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {


                        var info = data.d;

                        $('#<%=txtLog.ClientID%>').val(info[1]);
                        $('#<%=txtMun.ClientID%>').val(info[3]);
                        $('#<%=txtCEP.ClientID%>').val(info[5]);


                    },
                    error: function (XHR, errStatus, errorThrown) {
                        var err = JSON.parse(XHR.responseText);
                        errorMessage = err.Message;
                        alert(errorMessage);
                    }
                });
            }        
            

        });

        $(document).ready(function () {


        $("#btnclear").click(function () {// icone que habilita opções de medição
             
            limpacampos();
           setDefault();
               

        });
        $("#infolista").click(function () {// icone que habilita opções de medição
            if ($('#<%=txtCodIluminacao.ClientID%>').val())
            {
                var result = -1;
                result = buscaBinariaSimples(lista, lista.length, $('#<%=txtCodIluminacao.ClientID%>').val());
               
                if (result != -1)
                {
                                   
                    var latlong = convertUTM(lista[result][2], lista[result][3]);
                    selectIluminacao(lista[result][0], lista[result][1], latlong[1], latlong[0], lista[result][4])
                }
                else {
                    alert("Codigo não encontrado!")
                }
               
            }
            


        });

        function  buscaBinariaSimples(v, n, x) {
                
                achou = false;
                var L = 1;
                var  R = n;
                var M= 0;
                var ultimo = n-1;
               
                while (!achou && L < R) {
                    if (x == v[0][0])
                    {
                        M = 0;
                        achou = true;
                        return M
                        break;
                    }

                    M = parseInt((L + R) / 2);
                    if (x == v[M][0]) {
                        return M;
                        achou = true;
                    } else if (x < v[M][0]) {
                        R = M
                    } else {
                        L = M + 1
                    }
                }
                return -1;
                   

            }    
/**************************************************************************************************slider**/
            $('.bxslider').bxSlider({
                mode: 'fade',
                captions: true
            });


 /**************************************************************************************************postback**/
            
            if (isPostBack().toString() == "True") {///RELOAD DA PAGINA FAZER
                $.ajax({
                    url: '<%=ResolveUrl("~/Classes/service.asmx/GetLista") %>',
                    type: "POST",
                    data: "{ 'localidade': '" + $("#<%=ddllocalidade.ClientID %>").val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data2) {
                        var parsed = $.parseJSON(data2.d);


                        $.each(parsed, function (i, jsondata) {
                            lista.push([
                                  jsondata.ID_ILUMINACAO_PUBLICA,
                                  jsondata.ILUID,
                                  jsondata.ILU_LAT,
                                  jsondata.ILU_LNG,
                                  jsondata.KMLID,
                                  jsondata.COD_ILUM_FK
                            ])
                        })



                    },
                    failure: function (response) {
                        alert(response.d);
                    },
                    error: function (response) {
                        alert(response.d);
                    }
                });
           
                var latlong = convertUTM($('#<%=txtLat.ClientID%>').val(), $('#<%=txtLng.ClientID%>').val());
                
                selectIluminacaoRefresh($('#<%=txtCodIluminacao.ClientID%>').val(), $('#<%=hfCodilumPK.ClientID%>').val(), latlong[1], latlong[0], $('#<%=hfkmlID.ClientID%>').val())
                

            }
            else {
                
            }

           /*********************************************************************************************mascara*/

            $(".date").mask("00/00/0000", { clearIfNotMatch: true });
            $(".phone").mask("(00) 0000-0000", { clearIfNotMatch: true });
            $(".cepTxt").mask("00000-000", { clearIfNotMatch: true });
            $(".CNPJ").mask("00.000.000/0000-00", { clearIfNotMatch: true });
            $(".numerotxt").mask("000", { clearIfNotMatch: false });
            $(".metros").mask("00.00", { clearIfNotMatch: false });          
            $(".faturamento").maskMoney({ allowNegative: false, thousands: '.', decimal: ',', affixesStay: false });


            
            $("#<%=ddllocalidade.ClientID %>").change(function () {
                lista = [];
                $('#<%=txtCodIluminacao.ClientID%>').css("background", "#FFFFFF");
                $('#<%=txtCodIluminacao.ClientID%>').val("");               
                 if ($("#<%=ddllocalidade.ClientID %>").val() != "-1")
                 {
                     pos = -1;
                     
                     
                        $.ajax({
                            url: '<%=ResolveUrl("~/Classes/service.asmx/GetLista") %>',
                            type: "POST",
                            data: "{ 'localidade': '" + $("#<%=ddllocalidade.ClientID %>").val() + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data2) {
                                var parsed = $.parseJSON(data2.d);
                                        var teste = "";
                    
                                $.each(parsed, function (i, jsondata) {
                                    lista.push([
                                          jsondata.ID_ILUMINACAO_PUBLICA,
                                          jsondata.ILUID,
                                          jsondata.ILU_LAT,
                                          jsondata.ILU_LNG,
                                          jsondata.KMLID,
                                          jsondata.COD_ILUM_FK
                                    ])
                                })
                                ilum.clearLayers();
                                 
                                for (var i = 0; i < lista.length; i++) {
                                 if (lista[i][5] != "" && lista[i][5] != "null" && lista[i][5] != null && lista[i][5].toString() != "NULL" ) {
                                      
                                        var LamMarker = L.marker([lista[i][2], lista[i][3]], { id: i, icon: greenIcon }).on('click', markerOnClick).addTo(map);
                                    }
                                    else {
                                            
                                        var LamMarker = L.marker([lista[i][2], lista[i][3]], { id: i, icon: redIcon }).on('click', markerOnClick).addTo(map);
                                    }

                                    ilum.addLayer(LamMarker);

                                }
                                map.setView([-19.9246, -43.9614], 11)
                                map.addLayer(ilum);
                                
                               
                               
                            },
                            failure: function (response) {
                                alert(response.d);
                            },
                            error: function (response) {
                                alert(response.d);
                            }
                        });
                  
                    

                 }
                
             });

            function valida() {
                if ($("#<%=ddlTipoBraco.ClientID %>").val() == "1" || $("#<%=ddlTipoBraco.ClientID %>").val() == "NULL" || $("#<%=ddlTipoBraco.ClientID %>").val() == null) {

                }
            }

            /*----------------------------------Padrão tipo de braço e projeção do braço------------*/
 
             $("#<%=ddlTipoBraco.ClientID %>").change(function () {
                
                 if ($("#<%=hfCodilumPK.ClientID %>").val() != "")
                 {                   
                     if ($("#<%=ddlTipoBraco.ClientID %>").val() == "Curto") {
                         if ($("#<%=ddlTipoPoste.ClientID %>").val() != "Metalico") {
                             $("#<%=txtProjBraco.ClientID %>").val("1.16");
                             $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                         }else {
                             $("#<%=txtProjBraco.ClientID %>").val("1.16");
                             $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                             $("#<%=ddlTipoPoste.ClientID %>").val("-1");
                         }
                     }
                     else if ($("#<%=ddlTipoBraco.ClientID %>").val() == "Medio") {
                         if ($("#<%=ddlTipoPoste.ClientID %>").val() != "Metalico") {
                             $("#<%=txtProjBraco.ClientID %>").val("2.92");
                             $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                         }else {
                             $("#<%=txtProjBraco.ClientID %>").val("2.92");
                             $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                             $("#<%=ddlTipoPoste.ClientID %>").val("-1");
                         }
                     }
                     else if ($("#<%=ddlTipoBraco.ClientID %>").val() == "Medio Pesado") {
                         if ($("#<%=ddlTipoPoste.ClientID %>").val() != "Metalico") {
                             $("#<%=txtProjBraco.ClientID %>").val("3.85");
                             $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                         }else {
                             $("#<%=txtProjBraco.ClientID %>").val("3.85");
                             $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                             $("#<%=ddlTipoPoste.ClientID %>").val("-1");
                         }
                     }
                     else if ($("#<%=ddlTipoBraco.ClientID %>").val() == "Longo") {
                         if ($("#<%=ddlTipoPoste.ClientID %>").val() != "Metalico") {
                             $("#<%=txtProjBraco.ClientID %>").val("5.60");
                             $("#<%=txtAltPoste.ClientID %>").val("12");
                             $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                         }else {
                             $("#<%=txtProjBraco.ClientID %>").val("5.60");
                             $("#<%=txtAltPoste.ClientID %>").val("12");
                             $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                             $("#<%=ddlTipoPoste.ClientID %>").val("-1");
                         }
                     }
                     else if ($("#<%=ddlTipoBraco.ClientID %>").val() == "Especial") {
                         $("#<%=ddlTipoPoste.ClientID %>").val("Metalico");
                         $("#<%=ddlTipoAlimentacao.ClientID %>").val("Subterraneo");
                         $("#<%=txtProjBraco.ClientID %>").val("");
                     }
                     else if ($("#<%=ddlTipoBraco.ClientID %>").val() == "Sem braco") {
                         $("#<%=ddlTipoPoste.ClientID %>").val("Metalico")
                         $("#<%=txtProjBraco.ClientID %>").val("");
                         $("#<%=ddlTipoAlimentacao.ClientID %>").val("Subterraneo");
                     }
                     else if ($("#<%=ddlTipoBraco.ClientID %>").val() == "-1") {
                         $("#<%=ddlTipoAlimentacao.ClientID %>").val("-1");
                         $("#<%=txtProjBraco.ClientID %>").val("");
                     }
                 }
             });

            function fonteLuminosa(tipofontelum) {
                 if (tipofontelum == "Sodio") {
                    $("#<%=ddlPotFonteLum.ClientID %>").empty().append($("<option></option>").val("-1").html("Potência da fonte luminosa (W)"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("70").html("70W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("100").html("100W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("150").html("150W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("250").html("250W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("400").html("400W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").val("-1");
                } 
                else if (tipofontelum == "Mercurio") {
                    $("#<%=ddlPotFonteLum.ClientID %>").empty().append($("<option></option>").val("-1").html("Potência da fonte luminosa (W)"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("80").html("80W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("125").html("125W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("250").html("250W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("400").html("400W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").val("-1");
                }
                else if (tipofontelum == "Metalico") {
                    $("#<%=ddlPotFonteLum.ClientID %>").empty().append($("<option></option>").val("-1").html("Potência da fonte luminosa (W)"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("35").html("35W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("70W").html("70W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("150W").html("150W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").val("-1");
                } else if (tipofontelum == "Led" || tipofontelum == "-1") {
                    $("#<%=ddlPotFonteLum.ClientID %>").empty().append($("<option></option>").val("-1").html("Potência da fonte luminosa (W)"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("6").html("6W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("35").html("35W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("40").html("40W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("54").html("54W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("55").html("55W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("58").html("58W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("70").html("70W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("80").html("80W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("86").html("86W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("100").html("100W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("125").html("125W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("127").html("127W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("150").html("150W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("250").html("250W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("350").html("350W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("400").html("400W"));
                }
                else {
                    setDefault();
                }
            }

            $("#<%=ddlTipoBraco.ClientID %>").change(function () {
                classe = document.getElementById('txtProjBraco').className;
                if (classe == 'txtProjBraco') {
                    document.getElementById('txtProjBraco').className = 'form-control2';
                }
            });

            /*-------------------------Padrao para o tipo e potencia de fonte luminosa--------------*/
            $("#<%=ddlTipoFonteLum.ClientID %>").change(function () {
                fonteLuminosa($("#<%=ddlTipoFonteLum.ClientID %>").val());
            });

             /*-------------------------------------Tipo relé e tipo reator baseado no tipo de luminária---------------------------*/
             $("#<%=ddlTipoLum.ClientID %>").change(function () {
                 if ($("#<%=ddlTipoLum.ClientID %>").val() == "Integrada policarbonato" || $("#<%=ddlTipoLum.ClientID %>").val() == "Integrada vidro")
                 {
                     $("#<%=ddlTipoReator.ClientID %>").val("Interno");
                     $("#<%=ddlTipoRele.ClientID %>").val("Integrado na luminaria");
                 } else if ($("#<%=ddlTipoLum.ClientID %>").val() == "-1") {
                     $("#<%=ddlTipoReator.ClientID %>").val("-1");
                     $("#<%=ddlTipoRele.ClientID %>").val("-1");
                 }
             });

            $("#<%=ddlTipoLum.ClientID %>").change(function() {
                if ($("#<%=ddlTipoLum.ClientID %>").val() == "Corpo unico aberta" || $("#<%=ddlTipoLum.ClientID %>").val() == "Corpo unico fechada com vidro" || $("#<%=ddlTipoLum.ClientID %>").val() == "Corpo unico fechada com policarbonato") {
                     $("#<%=ddlTipoReator.ClientID %>").val("Externo");
                     $("#<%=ddlTipoRele.ClientID %>").val("No poste");
                }   
            });
 
            $("#<%=ddlTipoLum.ClientID %>").change(function () {
                if ($("#<%=ddlTipoLum.ClientID %>").val() == "Petalar" || $("#<%=ddlTipoLum.ClientID %>").val() == "Outros") {
                    $("#<%=ddlTipoReator.ClientID %>").val("-1");
                    $("#<%=ddlTipoRele.ClientID %>").val("-1");
                } else if ($("#<%=ddlTipoLum.ClientID %>").val() == "Decorativa esferica" || $("#<%=ddlTipoLum.ClientID %>").val() == "Decorativa semi-esférica") {
                    $("#<%=ddlTipoReator.ClientID %>").val("-1");
                    $("#<%=ddlTipoRele.ClientID %>").val("Comando em grupo");
                }
            });


            $("#<%=ddlTipoRele.ClientID %>").change(function () {
                if ($("#<%=ddlTipoRele.ClientID %>").val() != "Integrado na luminaria")
                { 
                   if ($("#<%=ddlTipoReator.ClientID %>").val() == "Interno")
                    {
                        $("#<%=ddlTipoReator.ClientID %>").val("-1");
                    }
                }
                else if ($("#<%=ddlTipoRele.ClientID %>").val() == "Integrado na luminaria")
                { 
                   if ($("#<%=ddlTipoReator.ClientID %>").val() == "Externo")
                    {
                        $("#<%=ddlTipoReator.ClientID %>").val("Interno");
                   }
                else if ($("#<%=ddlTipoRele.ClientID %>").val() == "Integrado na luminaria")
                   {
                       $("#<%=ddlTipoReator.ClientID %>").val("Interno");
                   }
                }
                
            });

            $("#<%=ddlTipoReator.ClientID %>").change(function () {
                if ($("#<%=ddlTipoReator.ClientID %>").val() == "Interno")
                {
                    $("#<%=ddlTipoRele.ClientID %>").val("Integrado na luminaria");
                }
                else if ($("#<%=ddlTipoReator.ClientID %>").val() == "-1") {
                    $("#<%=ddlTipoRele.ClientID %>").val("-1");
                }
                else if ($("#<%=ddlTipoReator.ClientID %>").val() == "Externo") {
                    if ($("#<%=ddlTipoRele.ClientID %>").val() == "Integrado na luminaria")
                    {
                        $("#<%=ddlTipoRele.ClientID %>").val("-1");
                    }
                }
            });

            

            /*-------------------------Padrao para Tipo de braço ou poste com tipo de alimentação-------------------------*/

            

            $("#<%=ddlTipoPoste.ClientID %>").change(function () {
                if ($("#<%=ddlTipoPoste.ClientID %>").val() == "Concreto Duplo T" || $("#<%=ddlTipoPoste.ClientID %>").val() == "Concreto Circular" || $("#<%=ddlTipoPoste.ClientID %>").val() == "Madeira") {
                    $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                } else if ($("#<%=ddlTipoPoste.ClientID %>").val() == "Metalico") {
                    $("#<%=ddlTipoAlimentacao.ClientID %>").val("Subterraneo");
                } else if ($("#<%=ddlTipoPoste.ClientID %>").val() == "-1") {
                    $("#<%=ddlTipoAlimentacao.ClientID %>").val("-1");
                }
            });
      


            /*---------------------------------Quantidade de Luminarias e quantidade de fontes luminosas-------------------------*/

            $("#<%=ddlQtdeLum.ClientID %>").change(function () {
                if ($("#<%=ddlQtdeLum.ClientID %>").val() == "-1") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("-1");
                }else if ($("#<%=ddlQtdeLum.ClientID %>").val() == "1") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("1");
                }else if ($("#<%=ddlQtdeLum.ClientID %>").val() == "2") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("2");
                }else if ($("#<%=ddlQtdeLum.ClientID %>").val() == "3") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("3");
                }else if ($("#<%=ddlQtdeLum.ClientID %>").val() == "4") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("4");
                }else if ($("#<%=ddlQtdeLum.ClientID %>").val() == "5") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("5");
                }else if ($("#<%=ddlQtdeLum.ClientID %>").val() == "6") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("6");
                }else if ($("#<%=ddlQtdeLum.ClientID %>").val() == "7") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("7");
                }else if ($("#<%=ddlQtdeLum.ClientID %>").val() == "8") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("8");
                }else if ($("#<%=ddlQtdeLum.ClientID %>").val() == "9") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("9");
                } else if ($("#<%=ddlQtdeLum.ClientID %>").val() == "10") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("10");
                }
            });
 
            $("#<%=ddlQtdeFonteLum.ClientID %>").change(function () {
                if ($("#<%=ddlQtdeFonteLum.ClientID %>").val() < $("#<%=ddlQtdeLum.ClientID %>").val()) {
                    $("#<%=ddlQtdeLum.ClientID %>").val("-1");
                }
            });

            /*************************************************************************************************************botao de dados padroes*/

 
            $("#btncomuncurto").click(function () {// icone que habilita opções de medição
                setDefault();
                $("#<%=ddlTipoBraco.ClientID %>").val("Curto");
                $("#<%=txtProjBraco.ClientID %>").val("1.65");
                $("#<%=txtAltPoste.ClientID %>").val("11");
                $("#<%=ddlQtdeLum.ClientID %>").val("1");
                $("#<%=ddlTipoPoste.ClientID %>").val("Concreto Circular");
                $("#<%=ddlQtdeFonteLum.ClientID %>").val("1");
                $("#<%=ddlTipoReator.ClientID %>").val("Interno");
                $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                $("#<%=txtAltInstLum.ClientID %>").val("7");
                $("#<%=ddlTipoRele.ClientID %>").val("Integrado na luminaria");
                $("#<%=ddlIlumDest.ClientID %>").val("1");
                $("#<%=ddlTipoLum.ClientID %>").val("Integrada policarbonato");
                $("#<%=ddlTipoFonteLum.ClientID %>").val("Sodio");
                $("#<%=ddlPotFonteLum.ClientID %>").val("100");
                $("#<%=txtMun.ClientID %>").val("Belo Horizonte");
            });

                $("#btncomunmedio").click(function () {// icone que habilita opções de medição
                setDefault();
                $("#<%=ddlTipoBraco.ClientID %>").val("Medio");
                $("#<%=txtProjBraco.ClientID %>").val("2.92");
                $("#<%=txtAltPoste.ClientID %>").val("11");               
                $("#<%=ddlTipoPoste.ClientID %>").val("Concreto Circular");
                $("#<%=ddlQtdeFonteLum.ClientID %>").val("1");
                $("#<%=ddlTipoReator.ClientID %>").val("Interno");
                $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                $("#<%=txtAltInstLum.ClientID %>").val("8");
                $("#<%=ddlTipoRele.ClientID %>").val("Integrado na luminaria");
                $("#<%=ddlIlumDest.ClientID %>").val("1");
                $("#<%=ddlTipoLum.ClientID %>").val("Integrada policarbonato");
                $("#<%=ddlTipoFonteLum.ClientID %>").val("Sodio");
                $("#<%=ddlPotFonteLum.ClientID %>").val("150");
                $("#<%=ddlQtdeLum.ClientID %>").val("1");
                $("#<%=txtMun.ClientID %>").val("Belo Horizonte");
            });

                $("#btncomunlongo").click(function () {// icone que habilita opções de medição
                 setDefault();
                 $("#<%=ddlTipoBraco.ClientID %>").val("Longo");
                $("#<%=txtProjBraco.ClientID %>").val("5.6");
                $("#<%=txtAltPoste.ClientID %>").val("14");
                $("#<%=ddlQtdeLum.ClientID %>").val("1");
                $("#<%=ddlTipoPoste.ClientID %>").val("Concreto Circular");
                $("#<%=ddlQtdeFonteLum.ClientID %>").val("1");
                $("#<%=ddlTipoReator.ClientID %>").val("Interno");
                $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                $("#<%=txtAltInstLum.ClientID %>").val("12");
                $("#<%=ddlTipoRele.ClientID %>").val("Integrado na luminaria");
                $("#<%=ddlIlumDest.ClientID %>").val("1");
                $("#<%=ddlTipoLum.ClientID %>").val("Integrada policarbonato");
                $("#<%=ddlTipoFonteLum.ClientID %>").val("Sodio");
                $("#<%=ddlPotFonteLum.ClientID %>").val("400");
                $("#<%=txtMun.ClientID %>").val("Belo Horizonte");        
            });

            $("#btncomunrodovia").click(function () {// icone que habilita opções de medição
                limpa();
                setDefault();
                $("#<%=ddlTipoBraco.ClientID %>").val("Especial");                
                $("#<%=txtAltPoste.ClientID %>").val("14");
                $("#<%=ddlQtdeLum.ClientID %>").val("2");
                $("#<%=ddlTipoPoste.ClientID %>").val("Metalico");
                $("#<%=ddlQtdeFonteLum.ClientID %>").val("1");
                $("#<%=ddlTipoReator.ClientID %>").val("Interno");
                $("#<%=ddlTipoAlimentacao.ClientID %>").val("Subterraneo");
                $("#<%=txtAltInstLum.ClientID %>").val("12");
                $("#<%=ddlTipoRele.ClientID %>").val("Comando em grupo");
                $("#<%=ddlIlumDest.ClientID %>").val("1");
                $("#<%=ddlTipoLum.ClientID %>").val("Integrada vidro");
                $("#<%=ddlTipoFonteLum.ClientID %>").val("Sodio");
                $("#<%=ddlPotFonteLum.ClientID %>").val("400");
                $("#<%=txtMun.ClientID %>").val("Belo Horizonte");
                 
            });

             

 
            function setDefault()
             {
                 $("#<%=ddlTipoPoste.ClientID %>").empty().append($("<option></option>").val("-1").html("Tipo Poste"));
                $("#<%=ddlTipoPoste.ClientID %>").append($("<option></option>").val("Concreto Duplo T").html("Concreto Duplo T"));
                 $("#<%=ddlTipoPoste.ClientID %>").append($("<option></option>").val("Concreto Circular").html("Concreto Circular"));
                 $("#<%=ddlTipoPoste.ClientID %>").append($("<option></option>").val("Madeira").html("Madeira"));
                 $("#<%=ddlTipoPoste.ClientID %>").append($("<option></option>").val("Metalico").html("Metálico"));
                $("#<%=ddlTipoPoste.ClientID %>").val("-1");
                $("#<%=ddlPotFonteLum.ClientID %>").empty().append($("<option></option>").val("-1").html("Potência da fonte luminosa (W)"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("6").html("6W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("35").html("35W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("40").html("40W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("54").html("54W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("55").html("55W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("58").html("58W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("70").html("70W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("80").html("80W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("86").html("86W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("100").html("100W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("125").html("125W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("127").html("127W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("150").html("150W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("250").html("250W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("350").html("350W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("400").html("400W"));
                $("#<%=ddlPotFonteLum.ClientID %>").val("-1");
             }
 
         
 
 
             /***********************************************************************************auto complete**/

            $("#<%=txtCodIluminacao.ClientID %>").autocomplete({
                source: function (request, response) {

                    $.ajax({
                        url: '<%=ResolveUrl("~/Classes/service.asmx/GetIluminacao") %>',
                        type: "POST",
                        data: "{ 'ilupk': '" + request.term + "','localidade': '"+ $('#<%=ddllocalidade.ClientID %>').val()+"'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data2) {

                          
                          
                            var parsed = $.parseJSON(data2.d);
                            var colunas = [];
                           
                            
                            
                            $.each(parsed, function (i, jsondata) {
                        
                                
                                colunas.push([
                                    jsondata.ID_ILUMINACAO_PUBLICA,
                                    jsondata.ILUID,
                                    jsondata.ILU_LAT,
                                    jsondata.ILU_LNG,
                                    jsondata.KMLID
                                ])
                            })

                          
                       

                            response($.map(colunas, function (item) {
                                return {
                                    label: item[0].toString(),
                                    iluPK: item[1].toString(),
                                    lat: item[2].toString(),
                                    lng: item[3].toString(),
                                    kmlPK: item[4].toString()

                                }
                            }))

                        },
                        error: function (response) {

                            alert(response.responseText);
                        },
                        failure: function (response) {

                            alert(response.responseText);
                        }
                    });
                },

                select: function (e, i) {
                  
                   
                    var latlong = convertUTM(i.item.lat, i.item.lng);
                    selectIluminacao(i.item.label, i.item.iluPK, latlong[1], latlong[0], i.item.kmlPK)



                },
                minLength: 1
            });


            function selectIluminacao(codIlu, objectid, lat, lng, kmlid) {
                pos = -1;
                $('#<%=txtCodIluminacao.ClientID%>').css("background", "#FFFFFF");
                setDefault();
                limpa();
                $('#<%=hfCodilumPK.ClientID%>').val(objectid);
                $('#<%=hfkmlID.ClientID%>').val(kmlid);                  
                $("#<%=txtLat.ClientID %>").val(lat);
                $("#<%=txtLng.ClientID %>").val(lng);                
                

                getinfoilum(codIlu, objectid);              
               
               
                openNearestImage(lng + ',' + lat);
                  

                
                   
                   
            }
            function selectIluminacaoRefresh(codIlu, objectid, lat, lng, kmlid) {
                setDefault();
                limpa();
                $('#<%=hfCodilumPK.ClientID%>').val(objectid);
                $('#<%=hfkmlID.ClientID%>').val(kmlid);
                $("#<%=txtLat.ClientID %>").val(lat);
                $("#<%=txtLng.ClientID %>").val(lng);

                getinfoilum(codIlu, objectid);
                setTimeout(function () {

                    openNearestImage(lng + ',' + lat);

                }, 3500);






            }

               
                
            
            function  getRows(id) {

                $.ajax({
                    url: '<%=ResolveUrl("~/Classes/service.asmx/GetRows") %>',
                    type: "POST",
                    data: "{ 'id': '" + id + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data2) {
                        
                        numrows= data2.d;
                    },
                    failure: function (response) {
                        alert(response.d);
                    },
                    error: function (response) {
                        alert(response.d);
                    }
                });
            }


            function getinfoilum(codIlu,iluPK) {
               
                $.ajax({
                    url: '<%=ResolveUrl("~/Classes/service.asmx/GetInfo") %>',
                    type: "POST",
                    data: "{ 'ilumid': '" + iluPK + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data2) {

                        var parsed2 = $.parseJSON(data2.d);
                        var fotos = ""
                        var cont = 0;
                        var layout = "<div class='bx-wrapper' style='max-width: 100%;'><div class='bx-viewport' style='width: 100%; overflow: hidden; position: relative; height: 530px;'>" +
                                        "<ul class='bxslider' style='height: 467px; width: auto; position: relative;' >"
                        var navegacao = "";

                        $.each(parsed2, function (i, jsondata) {


                              if (jsondata.COD_ILUM_FK != "" && jsondata.COD_ILUM_FK != "NULL" && jsondata.COD_ILUM_FK != null  )
                                {
                                    
                                  selectInfoilu(jsondata.TIPO_BRACO, jsondata.PROJ_BRACO, jsondata.TIPO_LUMINARIA, jsondata.TIPO_FONTE_LUMINARIA, jsondata.POTENCIA_FONTE_LUMI, jsondata.QUANT_FONTES_LUMI, jsondata.POTENCIA_TOTAL_FONTE_LUMI, jsondata.CARGA_INST_TOTAL_UN_ILUM_PUB, jsondata.TIPO_REATOR, jsondata.TIPO_RELE, jsondata.TIPO_ALIMENTACAO, jsondata.TIPO_POSTE, jsondata.ALTURA_POSTE, jsondata.ALTURA_INST_LUMI, jsondata.MUNICIPIO, jsondata.REGIONAL, jsondata.BAIRRO, jsondata.CLASSE_ILUMI, jsondata.LOGRADOURO, jsondata.CEP,jsondata.COD_LOGRADOURO, jsondata.ILUM_DESTAQ, jsondata.NOME_LOCAL_DESTAQ, jsondata.QUANT_LUMINARIAS, jsondata.MEDICAO, jsondata.LAT, jsondata.LONG,jsondata.OBSERVACAO)
                                   $('#<%=LinkButtonCadastrar.ClientID%>').fadeOut();
                                   $('#<%=LinkButtonAlterar.ClientID%>').fadeIn(1000);
                                   $('#deletarInfo').fadeIn(1000);
                                }
                                else
                                {   
                                     
                                    $('#deletarInfo').fadeOut();
                                     $('#<%=LinkButtonAlterar.ClientID%>').fadeOut();
                                    $('#<%=LinkButtonCadastrar.ClientID%>').fadeIn(1000);
                                 }
                            
                           

                            cont = 0;
                            for (var i = jsondata.COD_SEQ_INICIAL; i <= jsondata.COD_SEQ_FINAL; i++) {
                                cont++
                                if (cont == 1) {
                                    fotos = fotos + "<li style='float: none; list-style: none; position: absolute; width: 467px; z-index: 50; display: block;'><a href='img/fotos/" + jsondata.EQUIPE + "/" + jsondata.LOCALIDADE + "/" + codIlu + "_" + cont + ".JPG' target='_blank'>" + "<img width=100% height=467px src=img/fotos/" + jsondata.EQUIPE + "/" + jsondata.LOCALIDADE + "/" + codIlu + "_" + cont + ".JPG></a></li>";

                                }
                                else {
                                    fotos = fotos + "<li style='float: none; list-style: none; position: absolute; width: 467px; z-index: 0; display: block;'><a href=' img/fotos/" + jsondata.EQUIPE + "/" + jsondata.LOCALIDADE + "/" + codIlu + "_" + cont + ".JPG' target='_blank' >" + "<img width=100% height=467px src=img/fotos/" + jsondata.EQUIPE + "/" + jsondata.LOCALIDADE + "/" + codIlu + "_" + cont + ".JPG></a></li>";
                                }
                                navegacao = navegacao + " <div class='bx-pager-item'><a href='' data-slide-index='" + (cont - 1) + "' class='bx-pager-link active'>" + cont + "</a> </div>"

                            }


                            layout = layout + fotos + "</ul></div>" +
                              "</div>";








                        });

                        ///////////////////////////////////////////////////// atualiza o slide

                        document.getElementById('sliderblx').innerHTML = layout;
                        $('.bxslider').bxSlider({
                            mode: 'fade',
                            captions: true
                        });
                        ///////////////////////////////////////////////////// atualiza o slide

                    },
                    failure: function (response) {
                        
                        alert(response.d);
                    },
                    error: function (response) {
                        
                        alert(response.d);
                    }
                });
            }


            
            /////////////////////////////////////////////////////setar dados iluminacao nos campos
           
            function selectInfoilu(tipobraco, projbraco, tipolum, tipofontelum, potfontelum, qtdefontelum, pottotfontelum, carginstotuip, tiporeator, tiporele, tipoalimentacao, tipoposte, altposte, altinstlum, municipio, regional, bairro, classeilum, logradouro, cep, codlog, ilumdest, nomelocdest, qtdelum, medicao, lat, lng, observacao) {

                if (tipobraco != "NULL" && tipobraco != undefined && tipobraco != "undefined" && tipobraco != null) {
                    $('#<%=ddlTipoBraco.ClientID%>').val(tipobraco);
                }

                if (projbraco != "NULL" && projbraco != undefined && projbraco != "undefined" && projbraco != null) {
                    $('#<%=txtProjBraco.ClientID%>').val(projbraco);
                }
                
                if (tipolum != "NULL" && tipolum != undefined && tipolum != "undefined" && tipolum != null) {
                    $('#<%=ddlTipoLum.ClientID%>').val(tipolum);
                }

                if (tipofontelum != "NULL" && tipofontelum != undefined && tipofontelum != "undefined" && tipofontelum != null) {
                    fonteLuminosa(tipofontelum);
                    $('#<%=ddlTipoFonteLum.ClientID%>').val(tipofontelum);
                }

                if (potfontelum != "NULL" && potfontelum != undefined && potfontelum != "undefined" && potfontelum != null) {
                    $('#<%=ddlPotFonteLum.ClientID%>').val(potfontelum);
                }
               
                if (qtdefontelum != "NULL" && qtdefontelum != undefined && qtdefontelum != "undefined" && qtdefontelum != null) {
                    $('#<%=ddlQtdeFonteLum.ClientID%>').val(qtdefontelum);
                }
               
                if (pottotfontelum != "NULL" && pottotfontelum != undefined && pottotfontelum != "undefined" && pottotfontelum != null) {
                    $('#<%=txtPotTotFonteLum.ClientID%>').val(pottotfontelum);
                }

                if (carginstotuip != "NULL" && carginstotuip != undefined && carginstotuip != "undefined" && carginstotuip != null) {
                    $('#<%=txtCargInsTotUIP.ClientID%>').val(carginstotuip);
                }
               
                if (tiporeator != "NULL" && tiporeator != undefined && tiporeator != "undefined" && tiporeator != null) {
                    $('#<%=ddlTipoReator.ClientID%>').val(tiporeator);
                }

                if (tiporele != "NULL" && tiporele != undefined && tiporele != "undefined" && tiporele != null) {
                    $('#<%=ddlTipoRele.ClientID%>').val(tiporele);
                }
                
                if (tipoalimentacao != "NULL" && tipoalimentacao != undefined && tipoalimentacao != "undefined" && tipoalimentacao != null) {
                    $('#<%=ddlTipoAlimentacao.ClientID%>').val(tipoalimentacao);
                }
               
                if (tipoposte != "NULL" && tipoposte != undefined && tipoposte != "undefined" && tipoposte != null) {
                    $('#<%=ddlTipoPoste.ClientID%>').val(tipoposte);
                }
               
                if (altposte != "NULL" && altposte != undefined && altposte != "undefined" && altposte != null) {
                    $('#<%=txtAltPoste.ClientID%>').val(altposte);
                }
              
              
                if (altinstlum != "NULL" && altinstlum != undefined && altinstlum != "undefined" && altinstlum !=null) {
                    $('#<%=txtAltInstLum.ClientID%>').val(altinstlum);
                }
              
                if (municipio != "NULL" && municipio != undefined && municipio != "undefined" && municipio != null) {
                    $('#<%=txtMun.ClientID%>').val(municipio);
                }
               
                if (regional != "NULL" && regional != undefined && regional != "undefined" && regional != null) {
                    $('#<%=txtReg.ClientID%>').val(regional);
                }
              
                if (bairro != "NULL" && bairro != undefined && bairro != "undefined" && bairro != null) {
                    $('#<%=txtBair.ClientID%>').val(bairro);
                }
                if (classeilum != "NULL" && classeilum != undefined && classeilum != "undefined" && classeilum != null) {
                    $('#<%=ddlClassIlum.ClientID%>').val(classeilum);
                }
                if (logradouro != "NULL" && logradouro != undefined && logradouro != "undefined" && logradouro != null) {
                    $('#<%=txtLog.ClientID%>').val(logradouro);
                }
              
                if (cep != "NULL" && cep != undefined && cep != "undefined" && cep != null) {
                    $('#<%=txtCEP.ClientID%>').val(cep);
                }
                if (codlog != "NULL" && codlog != undefined && codlog != "undefined" && codlog != null) {
                    $('#<%=txtCodLog.ClientID%>').val(codlog);
                }
               
                if (ilumdest != "NULL" && ilumdest != undefined && ilumdest != "undefined" && ilumdest != null) {
                    $('#<%=ddlIlumDest.ClientID%>').val(ilumdest);
                }
                else
                {
                     $('#<%=ddlIlumDest.ClientID%>').val("1");
                }
                if (nomelocdest != "NULL" && nomelocdest != undefined && nomelocdest != "undefined" && nomelocdest != null) {
                    $('#<%=txtNomeLocDestaq.ClientID%>').val(nomelocdest);
                }
                if (qtdelum != "NULL" && qtdelum != undefined && qtdelum != "undefined" && qtdelum != null) {
                    $('#<%=ddlQtdeLum.ClientID%>').val(qtdelum);
                }
                if (medicao != "NULL" && medicao != undefined && medicao != "undefined" && medicao != null) {
                    $('#<%=txtMed.ClientID%>').val(medicao);
                }
                if (lat != "NULL" && lat != undefined && lat != "undefined" && lat != null) {
                    $('#<%=txtLat.ClientID%>').val(lat);
                }
                
                if (lng != "NULL" && lng != undefined && lng != "undefined" && lng != null) {
                    $('#<%=txtLng.ClientID%>').val(lng);
                }
                if (observacao != "NULL" && observacao != undefined && observacao != "undefined" && observacao != null) {
                    $('#<%=txtObservacao.ClientID%>').val(observacao);
                }
            }

            /////////////////////////////////////////////////////fim selectinfoilu
            function limpacampos() {

                $('#<%=txtCodIluminacao.ClientID%>').css("background", "#FFFFFF");
                $("#<%=txtProjBraco.ClientID %>").val("");
                $('#<%=ddlTipoBraco.ClientID%>').val("-1");
                $('#<%=ddlTipoLum.ClientID%>').val("-1");
                $('#<%=ddlTipoLum.ClientID%>').val("-1");
                $('#<%=ddlTipoFonteLum.ClientID%>').val("-1");
                $('#<%=ddlPotFonteLum.ClientID%>').val("-1");
                $('#<%=ddlQtdeFonteLum.ClientID%>').val("-1");
                $('#<%=txtPotTotFonteLum.ClientID%>').val("");
                $('#<%=txtCargInsTotUIP.ClientID%>').val("");
                $('#<%=ddlTipoReator.ClientID%>').val("-1");
                $('#<%=ddlTipoRele.ClientID%>').val("-1");
                $('#<%=ddlTipoAlimentacao.ClientID%>').val("-1");
                $('#<%=ddlTipoPoste.ClientID%>').val("-1");
                $('#<%=txtAltPoste.ClientID%>').val("");
                $('#<%=txtAltInstLum.ClientID%>').val("");
                $('#<%=txtReg.ClientID%>').val("");
                $('#<%=txtBair.ClientID%>').val("");
                $('#<%=ddlClassIlum.ClientID%>').val("-1");
                $('#<%=txtLog.ClientID%>').val("");
                $('#<%=txtCEP.ClientID%>').val("");
                $('#<%=txtCodLog.ClientID%>').val("");
                $('#<%=txtNomeLocDestaq.ClientID%>').val("");
                $('#<%=ddlQtdeLum.ClientID%>').val("-1");
                $('#<%=txtMed.ClientID%>').val("");                     
                $("#<%=txtObservacao.ClientID %>").val("");           
            }

        /////////////////////////////////////////////////////////////limpar dados
             function limpa()
             {
                 
                    $("#<%=txtProjBraco.ClientID %>").val("");
                    $('#<%=ddlTipoBraco.ClientID%>').val("-1");               
                    $('#<%=ddlTipoLum.ClientID%>').val("-1");    
                    $('#<%=ddlTipoLum.ClientID%>').val("-1");                
                    $('#<%=ddlTipoFonteLum.ClientID%>').val("-1");                              
                    $('#<%=ddlPotFonteLum.ClientID%>').val("-1");
                    $('#<%=ddlQtdeFonteLum.ClientID%>').val("-1");
                    $('#<%=txtPotTotFonteLum.ClientID%>').val("");
                    $('#<%=txtCargInsTotUIP.ClientID%>').val("");
                    $('#<%=ddlTipoReator.ClientID%>').val("-1");
                    $('#<%=ddlTipoRele.ClientID%>').val("-1");
                    $('#<%=ddlTipoAlimentacao.ClientID%>').val("-1");
                    $('#<%=ddlTipoPoste.ClientID%>').val("-1");
                    $('#<%=txtAltPoste.ClientID%>').val("");
                    $('#<%=txtAltInstLum.ClientID%>').val("");
                    $('#<%=txtMun.ClientID%>').val("");
                    $('#<%=txtReg.ClientID%>').val("");
                    $('#<%=txtBair.ClientID%>').val("");
                    $('#<%=ddlClassIlum.ClientID%>').val("-1");
                    $('#<%=txtLog.ClientID%>').val("");
                    $('#<%=txtCEP.ClientID%>').val("");
                    $('#<%=txtCodLog.ClientID%>').val("");
                    $('#<%=ddlIlumDest.ClientID%>').val("-1");
                    $('#<%=txtNomeLocDestaq.ClientID%>').val("");
                    $('#<%=ddlQtdeLum.ClientID%>').val("");
                    $('#<%=txtMed.ClientID%>').val("");
                    $('#<%=txtLat.ClientID%>').val("");             
                    $('#<%=txtLng.ClientID%>').val("");
                    $('#deletarInfo').fadeOut();
                    $('#<%=LinkButtonAlterar.ClientID%>').fadeOut();
                    $('#<%=LinkButtonCadastrar.ClientID%>').fadeIn(1000);
                    $("#<%=txtObservacao.ClientID %>").val("");
                    $('#<%=hfCodilumPK.ClientID%>').val("");
                 setTimeout(function () {

                     $('#<%=Msucesso.ClientID%>').fadeOut();
                     $('#<%=Malerta.ClientID%>').fadeOut();
                     $('#<%=Merro.ClientID%>').fadeOut();

                 }, 3000);
                     
                  

            }
          

            $(document).on('click', '#deletarInfo', function (e) {///FUNÇÃO PARA DELETAR DADOS DO POSTE
                if ($('#<%=hfPermissao.ClientID%>').val() != "1")
                {
                    if(confirm("Tem certeza que deseja excluir esses dados?"))
                    $.ajax({
                        type: "POST",
                        url: '<%=ResolveUrl("~/Classes/Service.asmx/deletePoste") %>',
                        data: "{ 'iluPK':'" + $('#<%=hfCodilumPK.ClientID%>').val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (parseInt(data.d) > 0) {
                                alert('Informações Deletadas!')
                            }
                            else {
                                alert('Codigo não encontrado. Tente novamente!')
                            }

                        },
                        error: function (XHR, errStatus, errorThrown) {
                            var err = JSON.parse(XHR.responseText);
                            errorMessage = err.Message;
                            alert(errorMessage);
                        }
                    });

                    setTimeout(function () {
                        setDefault();
                        limpa();

                    }, 3000);

                }
                else {
                    $('#<%=Malerta.ClientID%>').empty().append("<center><strong>Requer permissão!</strong> Desculpe mas você não tem permissão para deletar essas informações.");
                    $('#<%=Malerta.ClientID%>').fadeIn();
                    setTimeout(function () {

                        $('#<%=Malerta.ClientID%>').fadeOut();

                    }, 3000);
                }
               



            });
            /////////////////////////////////////////////////////fim onclick

        });

        ///////////////////////////////////////////////////// fim document ready
       
            function next(){
                $('#<%=hfCodilumPK.ClientID%>').val("");
                $('#<%=hfkmlID.ClientID%>').val("");
                var x =$('#<%=txtCodIluminacao.ClientID%>').val();
                var n =lista.length;
                if (x != "") {
                    if (pos != -1) {
                       
                        if (pos < (n-1)) {
                           
                            $('#<%=txtCodIluminacao.ClientID%>').val(lista[(pos + 1)][0].toString())
                            pos++;
                            if (lista[pos][5] != "NULL" && lista[pos][5] != "null" && lista[pos][5] != null && lista[pos][5] != undefined) {

                                $('#<%=txtCodIluminacao.ClientID%>').css("background", "#90EE90");

                            }
                            else {
                                $('#<%=txtCodIluminacao.ClientID%>').css("background", "#FFA07A");

                            }

                        }

                    }
                    else {

                        buscaBinaria(lista, n, x, true);
                    }

                        
                }
                else {
                    pos = 0;
                    $('#<%=txtCodIluminacao.ClientID%>').val(lista[0][0].toString())
                    if (lista[0][5] != "NULL" && lista[0][5] != "null" && lista[0][5] != null && lista[0][5] != undefined) {

                        $('#<%=txtCodIluminacao.ClientID%>').css("background", "#90EE90");

                    }
                    else {
                        $('#<%=txtCodIluminacao.ClientID%>').css("background", "#FFA07A");

                    }

                }
              
        
            }
        function prev() {
                $('#<%=hfCodilumPK.ClientID%>').val("");
                $('#<%=hfkmlID.ClientID%>').val("");
                var x =$('#<%=txtCodIluminacao.ClientID%>').val();
                var n = lista.length;
                var ultimo = (n - 1);

                if (x != "") {
                    
                    if (pos != -1)
                    {
                        if (pos > 0)
                        {
                            $('#<%=txtCodIluminacao.ClientID%>').val(lista[(pos - 1)][0].toString())
                            pos--;
                            if (lista[pos][5] != "NULL" && lista[pos][5] != "null" && lista[pos][5] != null && lista[pos][5] != undefined) {

                                $('#<%=txtCodIluminacao.ClientID%>').css("background", "#90EE90");

                            }
                            else {
                                $('#<%=txtCodIluminacao.ClientID%>').css("background", "#FFA07A");

                            }
                        }
                        
                    }
                    else
                    {
                        buscaBinaria(lista, n, x, false);
                    }
                        
                }
                else {
                    pos = ultimo;
                    $('#<%=txtCodIluminacao.ClientID%>').val(lista[ultimo][0].toString())
                    if (lista[ultimo][5] != "NULL" && lista[ultimo][5] != "null" && lista[ultimo][5]!= null && lista[ultimo][5] != undefined) {

                        $('#<%=txtCodIluminacao.ClientID%>').css("background", "#90EE90");

                    }
                    else {
                        $('#<%=txtCodIluminacao.ClientID%>').css("background", "#FFA07A");

                    }

                }
            }

        function buscaBinaria(v, n, x, mod) {
                
                achou = false;
                var L = 1;
                var  R = n;
                var M= 0;
                var ultimo = n-1;
               
                while (!achou && L < R) {
                    if (x == v[0][0])
                    {
                        M = 0;
                        achou = true;                       
                        break;
                    }

                    M = parseInt((L + R) / 2);
                    if (x == v[M][0]) {
                        
                        achou = true;
                    } else if (x < v[M][0]) {
                        R = M
                    } else {
                        L = M + 1
                    }
                }
                if (achou = true) {
                    pos = M;
                    if (mod)
                    {
                        if (M < (n - 1))
                        {
                           
                            $('#<%=txtCodIluminacao.ClientID%>').val(lista[(M + 1)][0])
                            
                            if (lista[(M + 1)][5] != "NULL" && lista[(M + 1)][5] != "null" && lista[(M + 1)][5] != null && lista[(M + 1)][5] != undefined) {
                                $('#<%=txtCodIluminacao.ClientID%>').css("background-color", "#90EE90");
                         
                            }
                            else {
                                $('#<%=txtCodIluminacao.ClientID%>').css("background-color", "#FFA07A");
                          
                            }
                        }
                        
                       
                    }
                    else
                    {
                        if (M>0)
                        {
                            $('#<%=txtCodIluminacao.ClientID%>').val(lista[(M - 1)][0])
                            if (lista[(M - 1)][5] != "NULL" && lista[(M - 1)][5] != "null" && lista[(M - 1)][5] != null && lista[(M - 1)][5] != undefined) {
                                $('#<%=txtCodIluminacao.ClientID%>').css("background-color", "#90EE90");
                               
                            }
                            else {
                                $('#<%=txtCodIluminacao.ClientID%>').css("background-color", "#FFA07A");
                               
                            }
                        }
                       
                       
                    }
                   
                   
                } else {
                   
                }

            }
           

            
        /////////////////////AQUI COMEÇA O MAPA//////////////////////////////////////

        var utm = 'PROJCS["SIRGAS_2000_UTM_Zone_@numfuso@hemisferio",GEOGCS["GCS_SIRGAS_2000",DATUM["D_SIRGAS_2000",SPHEROID["GRS_1980",6378137.0,298.257222101]],PRIMEM["Greenwich",0.0],UNIT["Degree",0.0174532925199433]],PROJECTION["Transverse_Mercator"],PARAMETER["False_Easting",500000.0],PARAMETER["False_Northing",10000000.0],PARAMETER["Central_Meridian",@nummc],PARAMETER["Scale_Factor",0.9996],PARAMETER["Latitude_Of_Origin",0.0],UNIT["Meter",1.0]]';
        var wgs84 = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs";
        function convertUTM(WGSlat,WGSlng) {
           
            var MC = (6 * Math.floor(WGSlng / 6)) + 3;
            var Fuso = Math.round(30 - (Math.abs(MC) / 6));
            var calcfuso;
            var checklat = WGSlat;
            
            if (checklat < 0) {
                calcfuso = utm.replace("@hemisferio", "S");
            }
            else {
                calcfuso = utm.replace("@hemisferio", "N");
            }           
            calcfuso = calcfuso.replace("@numfuso", Fuso);
            calcfuso = calcfuso.replace("@nummc", MC);      
           

            var latlong = proj4(wgs84, calcfuso, [WGSlng, WGSlat]);
           
            return latlong;

            
        }


       mapLink = '<a href="http://www.esri.com/">Esri</a>';
       wholink = 'i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community';

        var esri = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
            attribution: '&copy; ' + mapLink + ', ' + wholink,
            maxZoom: 22,
        })

        var grayscale = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
            maxZoom:18
        });

        var mbAttr = 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
				'<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
				'Imagery © <a href="http://mapbox.com">Mapbox</a>'
        var mbUrl = 'https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpandmbXliNDBjZWd2M2x6bDk3c2ZtOTkifQ._QA7i5Mpkd_m30IGElHziw';


        streets = L.tileLayer(mbUrl, { id: 'mapbox.streets', attribution: mbAttr });

        
        var ips = L.tileLayer('https://api.mapbox.com/styles/v1/aryacoletor/cisj1xgw800bf2xpbexbtfpkb/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiYXJ5YWNvbGV0b3IiLCJhIjoiY2lzajFzZjN3MDF5aTJ1b2M0b25wZTl1byJ9.ZkPsVnXXgMrsW7DuZKGR6w');
        

        var map = L.map('map', {
            layers: esri,
           
        }).setView([-19.9246, -43.9614], 11);


       // getPontos("TESTE");


        var url = 'http://www.aryagis.com/arcgis/services/CLI008/16008A/MapServer/WMSServer';

        var centro=L.tileLayer.betterWms(url, {
            layers: '1',
            transparent: true,
            attribution: "<a target='_blank' href='http://www.aryamap.com'>Ortofoto</a>",
            format: 'image/png',
            tiled: true,
            maxZoom: 22
            
        }).addTo(map);

        
        /////////////////////////ICON

        var greenIcon = L.icon({
            iconUrl: 'lib/images/ckpoint_verde.png',
            shadowUrl: 'lib/images/marker-shadow.png',

            iconSize: [20, 35], // size of the icon
            shadowSize: [25, 40], // size of the shadow
            iconAnchor: [20, 35], // point of the icon which will correspond to marker's location
            shadowAnchor: [4, 40],  // the same for the shadow
            popupAnchor: [-3, -76] // point from which the popup should open relative to the iconAnchor
        });
        var redIcon = L.icon({
            iconUrl: 'lib/images/ckpoint_vermelho.png',
            shadowUrl: 'lib/images/marker-shadow.png',

            iconSize: [20, 35], // size of the icon
            shadowSize: [25, 40], // size of the shadow
            iconAnchor: [20, 35], // point of the icon which will correspond to marker's location
            shadowAnchor: [4, 40],  // the same for the shadow
            popupAnchor: [-3, -76] // point from which the popup should open relative to the iconAnchor
        });
        var blueIcon = L.icon({
            iconUrl: 'lib/images/ckpoint_azul.png',
            shadowUrl: 'lib/images/marker-shadow.png',

            iconSize: [20, 35], // size of the icon
            shadowSize: [25, 40], // size of the shadow
            iconAnchor: [20, 35], // point of the icon which will correspond to marker's location
            shadowAnchor: [4, 40],  // the same for the shadow
            popupAnchor: [-3, -76] // point from which the popup should open relative to the iconAnchor
        });

        //////////////////////
      
        
        var baseMaps = {
            "OpenStreetMap": grayscale,
            "Ips Arya": ips,
            "Streets": streets,
            "Esri": esri
            

        };
        
       
        var overlayMaps = {
            "REMO ": ilum,
            "CENTRO_WMS ":centro
            
            
        };
        L.control.scale().addTo(map);
        L.control.layers(baseMaps, overlayMaps).addTo(map);


        ///////////////////////////////////banco

        function getPontos(prefix) {

            $.ajax({
                url: '<%=ResolveUrl("~/Classes/Service.asmx/GetIlu") %>',
                type: "POST",
                data: "{ 'prefix': '" + prefix + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var parsed = $.parseJSON(data.d);
                       var teste =""; 
                    var i = 0;
                    $.each(parsed, function (i, jsondata) {
                        if (jsondata.COD_ILUM_FK != "" || jsondata.COD_ILUM_FK != "NULL")
                        {
                            teste = jsondata.COD_ILUM_FK +'|';
                            var LamMarker = L.marker([jsondata.Y, jsondata.X], { id: i, icon: greenIcon }).on('click', markerOnClick).addTo(map);
                        }
                        else
                        {
                            var LamMarker = L.marker([jsondata.Y, jsondata.X], { id: i, icon: redIcon }).on('click', markerOnClick).addTo(map);
                        }
                        i++;
                        //marker1.push(LamMarker);
                        ilum.addLayer(LamMarker);
                       
                        //tableProp += '<tr><td style="white-space: nowrap;padding-left: 10px; padding-right: 10px; border-right: 1px solid #cccccc;">' + jsondata.NOME + '</td ><td style="white-space: nowrap;padding-left: 10px; padding-right: 10px; border-right: 1px solid #cccccc; ">' + jsondata.CPF + '</td ><td style="white-space: nowrap;"><center><span style="cursor: pointer;" onClick="removeProp(' + jsondata.COD_PROPRIETARIO_PK + ',' + jsondata.COD_EMPRESA_PK + ',\'' + jsondata.CPF + '\')" class="glyphicon glyphicon-remove "></span></center></td></tr>';
                    });    
               
                    map.addLayer(ilum);
                   

                },
                error: function (XHR, errStatus, errorThrown) {
                    var err = JSON.parse(XHR.responseText);
                    errorMessage = err.Message;
                    alert(errorMessage);
                }
            });
        };


        var oldLayer;///layer anterior
        function markerOnClick(e) {
           
            var latlong= convertUTM(lista[this.options.id][2],lista[this.options.id][3]);
           
            selectIluminacao(lista[this.options.id][0], lista[this.options.id][1], latlong[1], latlong[0], lista[this.options.id][4]);

            //seta iluminacao
            $('#<%=txtCodIluminacao.ClientID%>').val(lista[this.options.id][0]);

            var layer = e.target;
            layer.setIcon(layer.options.icon = blueIcon);       
            pos = this.options.id;
            
          
            if (oldLayer)
            {
                if (oldLayer.options.id != layer.options.id)
                {
                    if (lista[oldLayer.options.id][5] != null) {
                        oldLayer.setIcon(layer.options.icon = greenIcon);
                    }
                    else {
                        oldLayer.setIcon(layer.options.icon = redIcon);
                    }

                }
                
                

            }

            oldLayer = layer;
            
            
            
            
            //alert(lista[this.options.id][3] + " eita " + lista[this.options.id][2]);
            //LamMarker.setIcon(blueIcon);
           
           // alert("Ta vendo é por que ta funcionando." + this.options.id + " MISERAVIII " + e.latlng);
            
        } 
        


       
        L.control.coordinates().addTo(map);
        function setDefault()
             {
                 $("#<%=ddlTipoPoste.ClientID %>").empty().append($("<option></option>").val("-1").html("Tipo Poste"));
                $("#<%=ddlTipoPoste.ClientID %>").append($("<option></option>").val("Concreto Duplo T").html("Concreto Duplo T"));
                 $("#<%=ddlTipoPoste.ClientID %>").append($("<option></option>").val("Concreto Circular").html("Concreto Circular"));
                 $("#<%=ddlTipoPoste.ClientID %>").append($("<option></option>").val("Madeira").html("Madeira"));
                 $("#<%=ddlTipoPoste.ClientID %>").append($("<option></option>").val("Metalico").html("Metálico"));
                $("#<%=ddlTipoPoste.ClientID %>").val("-1");
                $("#<%=ddlPotFonteLum.ClientID %>").empty().append($("<option></option>").val("-1").html("Potência da fonte luminosa (W)"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("6").html("6W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("35").html("35W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("40").html("40W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("54").html("54W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("55").html("55W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("58").html("58W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("70").html("70W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("80").html("80W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("86").html("86W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("100").html("100W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("125").html("125W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("127").html("127W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("150").html("150W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("250").html("250W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("350").html("350W"));
                $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("400").html("400W"));
                $("#<%=ddlPotFonteLum.ClientID %>").val("-1");
             }
 

        function selectIluminacao(codIlu, objectid, lat, lng, kmlid) {
          
                pos = -1;
                $('#<%=txtCodIluminacao.ClientID%>').css("background", "#FFFFFF");
           
                setDefault();
                limpa();
                $('#<%=hfCodilumPK.ClientID%>').val(objectid);
                $('#<%=hfkmlID.ClientID%>').val(kmlid);                  
                $("#<%=txtLat.ClientID %>").val(lat);
                $("#<%=txtLng.ClientID %>").val(lng);                
                

                getinfoilum(codIlu, objectid);              

                openNearestImage(lng + ',' + lat);
                  

                
                   
                   
        }
         function getinfoilum(codIlu,iluPK) {
               
                $.ajax({
                    url: '<%=ResolveUrl("~/Classes/service.asmx/GetInfo") %>',
                    type: "POST",
                    data: "{ 'ilumid': '" + iluPK + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data2) {

                        var parsed2 = $.parseJSON(data2.d);
                        var fotos = ""
                        var cont = 0;
                        var layout = "<div class='bx-wrapper' style='max-width: 100%;'><div class='bx-viewport' style='width: 100%; overflow: hidden; position: relative; height: 530px;'>" +
                                        "<ul class='bxslider' style='height: 467px; width: auto; position: relative;' >"
                        var navegacao = "";

                        $.each(parsed2, function (i, jsondata) {


                              if (jsondata.COD_ILUM_FK != "" && jsondata.COD_ILUM_FK != "NULL" && jsondata.COD_ILUM_FK != null  )
                                {
                                    
                                  selectInfoilu(jsondata.TIPO_BRACO, jsondata.PROJ_BRACO, jsondata.TIPO_LUMINARIA, jsondata.TIPO_FONTE_LUMINARIA, jsondata.POTENCIA_FONTE_LUMI, jsondata.QUANT_FONTES_LUMI, jsondata.POTENCIA_TOTAL_FONTE_LUMI, jsondata.CARGA_INST_TOTAL_UN_ILUM_PUB, jsondata.TIPO_REATOR, jsondata.TIPO_RELE, jsondata.TIPO_ALIMENTACAO, jsondata.TIPO_POSTE, jsondata.ALTURA_POSTE, jsondata.ALTURA_INST_LUMI, jsondata.MUNICIPIO, jsondata.REGIONAL, jsondata.BAIRRO, jsondata.CLASSE_ILUMI, jsondata.LOGRADOURO, jsondata.CEP,jsondata.COD_LOGRADOURO, jsondata.ILUM_DESTAQ, jsondata.NOME_LOCAL_DESTAQ, jsondata.QUANT_LUMINARIAS, jsondata.MEDICAO, jsondata.LAT, jsondata.LONG,jsondata.OBSERVACAO)
                                   $('#<%=LinkButtonCadastrar.ClientID%>').fadeOut();
                                   $('#<%=LinkButtonAlterar.ClientID%>').fadeIn(1000);
                                   $('#deletarInfo').fadeIn(1000);
                                }
                                else
                                {   
                                     
                                    $('#deletarInfo').fadeOut();
                                     $('#<%=LinkButtonAlterar.ClientID%>').fadeOut();
                                    $('#<%=LinkButtonCadastrar.ClientID%>').fadeIn(1000);
                                 }
                            
                           

                            cont = 0;
                            for (var i = jsondata.COD_SEQ_INICIAL; i <= jsondata.COD_SEQ_FINAL; i++) {
                                cont++
                                if (cont == 1) {
                                    fotos = fotos + "<li style='float: none; list-style: none; position: absolute; width: 467px; z-index: 50; display: block;'><a href='img/fotos/" + jsondata.EQUIPE + "/" + jsondata.LOCALIDADE + "/" + codIlu + "_" + cont + ".JPG' target='_blank'>" + "<img width=100% height=467px src=img/fotos/" + jsondata.EQUIPE + "/" + jsondata.LOCALIDADE + "/" + codIlu + "_" + cont + ".JPG></a></li>";

                                }
                                else {
                                    fotos = fotos + "<li style='float: none; list-style: none; position: absolute; width: 467px; z-index: 0; display: block;'><a href=' img/fotos/" + jsondata.EQUIPE + "/" + jsondata.LOCALIDADE + "/" + codIlu + "_" + cont + ".JPG' target='_blank' >" + "<img width=100% height=467px src=img/fotos/" + jsondata.EQUIPE + "/" + jsondata.LOCALIDADE + "/" + codIlu + "_" + cont + ".JPG></a></li>";
                                }
                                navegacao = navegacao + " <div class='bx-pager-item'><a href='' data-slide-index='" + (cont - 1) + "' class='bx-pager-link active'>" + cont + "</a> </div>"

                            }


                            layout = layout + fotos + "</ul></div>" +
                              "</div>";








                        });

                        ///////////////////////////////////////////////////// atualiza o slide

                        document.getElementById('sliderblx').innerHTML = layout;
                        $('.bxslider').bxSlider({
                            mode: 'fade',
                            captions: true
                        });
                        ///////////////////////////////////////////////////// atualiza o slide

                    },
                    failure: function (response) {
                        
                        alert(response.d);
                    },
                    error: function (response) {
                        
                        alert(response.d);
                    }
                });
            }


        /*----------------------------------Padrão tipo de braço e projeção do braço------------*/
 
             $("#<%=ddlTipoBraco.ClientID %>").change(function () {
                
                 if ($("#<%=hfCodilumPK.ClientID %>").val() != "")
                 {                   
                     if ($("#<%=ddlTipoBraco.ClientID %>").val() == "Curto") {
                         if ($("#<%=ddlTipoPoste.ClientID %>").val() != "Metalico") {
                             $("#<%=txtProjBraco.ClientID %>").val("1.16");
                             $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                         }else {
                             $("#<%=txtProjBraco.ClientID %>").val("1.16");
                             $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                             $("#<%=ddlTipoPoste.ClientID %>").val("-1");
                         }
                     }
                     else if ($("#<%=ddlTipoBraco.ClientID %>").val() == "Medio") {
                         if ($("#<%=ddlTipoPoste.ClientID %>").val() != "Metalico") {
                             $("#<%=txtProjBraco.ClientID %>").val("2.92");
                             $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                         }else {
                             $("#<%=txtProjBraco.ClientID %>").val("2.92");
                             $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                             $("#<%=ddlTipoPoste.ClientID %>").val("-1");
                         }
                     }
                     else if ($("#<%=ddlTipoBraco.ClientID %>").val() == "Medio Pesado") {
                         if ($("#<%=ddlTipoPoste.ClientID %>").val() != "Metalico") {
                             $("#<%=txtProjBraco.ClientID %>").val("3.85");
                             $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                         }else {
                             $("#<%=txtProjBraco.ClientID %>").val("3.85");
                             $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                             $("#<%=ddlTipoPoste.ClientID %>").val("-1");
                         }
                     }
                     else if ($("#<%=ddlTipoBraco.ClientID %>").val() == "Longo") {
                         if ($("#<%=ddlTipoPoste.ClientID %>").val() != "Metalico") {
                             $("#<%=txtProjBraco.ClientID %>").val("5.60");
                             $("#<%=txtAltPoste.ClientID %>").val("12");
                             $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                         }else {
                             $("#<%=txtProjBraco.ClientID %>").val("5.60");
                             $("#<%=txtAltPoste.ClientID %>").val("12");
                             $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                             $("#<%=ddlTipoPoste.ClientID %>").val("-1");
                         }
                     }
                     else if ($("#<%=ddlTipoBraco.ClientID %>").val() == "Especial") {
                         $("#<%=ddlTipoPoste.ClientID %>").val("Metalico");
                         $("#<%=ddlTipoAlimentacao.ClientID %>").val("Subterraneo");
                         $("#<%=txtProjBraco.ClientID %>").val("");
                     }
                     else if ($("#<%=ddlTipoBraco.ClientID %>").val() == "Sem braco") {
                         $("#<%=ddlTipoPoste.ClientID %>").val("Metalico")
                         $("#<%=txtProjBraco.ClientID %>").val("");
                         $("#<%=ddlTipoAlimentacao.ClientID %>").val("Subterraneo");
                     }
                     else if ($("#<%=ddlTipoBraco.ClientID %>").val() == "-1") {
                         $("#<%=ddlTipoAlimentacao.ClientID %>").val("-1");
                         $("#<%=txtProjBraco.ClientID %>").val("");
                     }
                 }
             });

            function fonteLuminosa(tipofontelum) {
                 if (tipofontelum == "Sodio") {
                    $("#<%=ddlPotFonteLum.ClientID %>").empty().append($("<option></option>").val("-1").html("Potência da fonte luminosa (W)"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("70").html("70W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("100").html("100W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("150").html("150W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("250").html("250W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("400").html("400W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").val("-1");
                } 
                else if (tipofontelum == "Mercurio") {
                    $("#<%=ddlPotFonteLum.ClientID %>").empty().append($("<option></option>").val("-1").html("Potência da fonte luminosa (W)"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("80").html("80W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("125").html("125W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("250").html("250W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("400").html("400W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").val("-1");
                }
                else if (tipofontelum == "Metalico") {
                    $("#<%=ddlPotFonteLum.ClientID %>").empty().append($("<option></option>").val("-1").html("Potência da fonte luminosa (W)"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("35").html("35W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("70W").html("70W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("150W").html("150W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").val("-1");
                } else if (tipofontelum == "Led" || tipofontelum == "-1") {
                    $("#<%=ddlPotFonteLum.ClientID %>").empty().append($("<option></option>").val("-1").html("Potência da fonte luminosa (W)"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("6").html("6W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("35").html("35W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("40").html("40W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("54").html("54W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("55").html("55W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("58").html("58W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("70").html("70W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("80").html("80W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("86").html("86W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("100").html("100W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("125").html("125W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("127").html("127W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("150").html("150W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("250").html("250W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("350").html("350W"));
                    $("#<%=ddlPotFonteLum.ClientID %>").append($("<option></option>").val("400").html("400W"));
                }
                else {
                    setDefault();
                }
            }

            /*-------------------------Padrao para o tipo e potencia de fonte luminosa--------------*/
            $("#<%=ddlTipoFonteLum.ClientID %>").change(function () {
                fonteLuminosa($("#<%=ddlTipoFonteLum.ClientID %>").val());
            });

             /*-------------------------------------Tipo relé e tipo reator baseado no tipo de luminária---------------------------*/
             $("#<%=ddlTipoLum.ClientID %>").change(function () {
                 if ($("#<%=ddlTipoLum.ClientID %>").val() == "Integrada policarbonato" || $("#<%=ddlTipoLum.ClientID %>").val() == "Integrada vidro")
                 {
                     $("#<%=ddlTipoReator.ClientID %>").val("Interno");
                     $("#<%=ddlTipoRele.ClientID %>").val("Integrado na luminaria");
                 } else if ($("#<%=ddlTipoLum.ClientID %>").val() == "-1") {
                     $("#<%=ddlTipoReator.ClientID %>").val("-1");
                     $("#<%=ddlTipoRele.ClientID %>").val("-1");
                 }
             });

            $("#<%=ddlTipoLum.ClientID %>").change(function() {
                if ($("#<%=ddlTipoLum.ClientID %>").val() == "Corpo unico aberta" || $("#<%=ddlTipoLum.ClientID %>").val() == "Corpo unico fechada com vidro" || $("#<%=ddlTipoLum.ClientID %>").val() == "Corpo unico fechada com policarbonato") {
                     $("#<%=ddlTipoReator.ClientID %>").val("Externo");
                     $("#<%=ddlTipoRele.ClientID %>").val("No poste");
                }   
            });
 
            $("#<%=ddlTipoLum.ClientID %>").change(function () {
                if ($("#<%=ddlTipoLum.ClientID %>").val() == "Petalar" || $("#<%=ddlTipoLum.ClientID %>").val() == "Outros") {
                    $("#<%=ddlTipoReator.ClientID %>").val("-1");
                    $("#<%=ddlTipoRele.ClientID %>").val("-1");
                } else if ($("#<%=ddlTipoLum.ClientID %>").val() == "Decorativa esferica" || $("#<%=ddlTipoLum.ClientID %>").val() == "Decorativa semi-esférica") {
                    $("#<%=ddlTipoReator.ClientID %>").val("-1");
                    $("#<%=ddlTipoRele.ClientID %>").val("Comando em grupo");
                }
            });


            $("#<%=ddlTipoRele.ClientID %>").change(function () {
                if ($("#<%=ddlTipoRele.ClientID %>").val() != "Integrado na luminaria")
                { 
                   if ($("#<%=ddlTipoReator.ClientID %>").val() == "Interno")
                    {
                        $("#<%=ddlTipoReator.ClientID %>").val("-1");
                    }
                }
                else if ($("#<%=ddlTipoRele.ClientID %>").val() == "Integrado na luminaria")
                { 
                   if ($("#<%=ddlTipoReator.ClientID %>").val() == "Externo")
                    {
                        $("#<%=ddlTipoReator.ClientID %>").val("Interno");
                   }
                else if ($("#<%=ddlTipoRele.ClientID %>").val() == "Integrado na luminaria")
                   {
                       $("#<%=ddlTipoReator.ClientID %>").val("Interno");
                   }
                }
                
            });

            $("#<%=ddlTipoReator.ClientID %>").change(function () {
                if ($("#<%=ddlTipoReator.ClientID %>").val() == "Interno")
                {
                    $("#<%=ddlTipoRele.ClientID %>").val("Integrado na luminaria");
                }
                else if ($("#<%=ddlTipoReator.ClientID %>").val() == "-1") {
                    $("#<%=ddlTipoRele.ClientID %>").val("-1");
                }
                else if ($("#<%=ddlTipoReator.ClientID %>").val() == "Externo") {
                    if ($("#<%=ddlTipoRele.ClientID %>").val() == "Integrado na luminaria")
                    {
                        $("#<%=ddlTipoRele.ClientID %>").val("-1");
                    }
                }
            });

            

            /*-------------------------Padrao para Tipo de braço ou poste com tipo de alimentação-------------------------*/

            

            $("#<%=ddlTipoPoste.ClientID %>").change(function () {
                if ($("#<%=ddlTipoPoste.ClientID %>").val() == "Concreto Duplo T" || $("#<%=ddlTipoPoste.ClientID %>").val() == "Concreto Circular" || $("#<%=ddlTipoPoste.ClientID %>").val() == "Madeira") {
                    $("#<%=ddlTipoAlimentacao.ClientID %>").val("Aereo");
                } else if ($("#<%=ddlTipoPoste.ClientID %>").val() == "Metalico") {
                    $("#<%=ddlTipoAlimentacao.ClientID %>").val("Subterraneo");
                } else if ($("#<%=ddlTipoPoste.ClientID %>").val() == "-1") {
                    $("#<%=ddlTipoAlimentacao.ClientID %>").val("-1");
                }
            });
      


            /*---------------------------------Padrao Quantidade de Luminarias e quantidade de fontes luminosas-------------------------*/

            $("#<%=ddlQtdeLum.ClientID %>").change(function () {
                if ($("#<%=ddlQtdeLum.ClientID %>").val() == "-1") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("-1");
                }else if ($("#<%=ddlQtdeLum.ClientID %>").val() == "1") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("1");
                }else if ($("#<%=ddlQtdeLum.ClientID %>").val() == "2") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("2");
                }else if ($("#<%=ddlQtdeLum.ClientID %>").val() == "3") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("3");
                }else if ($("#<%=ddlQtdeLum.ClientID %>").val() == "4") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("4");
                }else if ($("#<%=ddlQtdeLum.ClientID %>").val() == "5") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("5");
                }else if ($("#<%=ddlQtdeLum.ClientID %>").val() == "6") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("6");
                }else if ($("#<%=ddlQtdeLum.ClientID %>").val() == "7") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("7");
                }else if ($("#<%=ddlQtdeLum.ClientID %>").val() == "8") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("8");
                }else if ($("#<%=ddlQtdeLum.ClientID %>").val() == "9") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("9");
                } else if ($("#<%=ddlQtdeLum.ClientID %>").val() == "10") {
                    $("#<%=ddlQtdeFonteLum.ClientID %>").val("10");
                }
            });
 
            $("#<%=ddlQtdeFonteLum.ClientID %>").change(function () {
                if ($("#<%=ddlQtdeFonteLum.ClientID %>").val() < $("#<%=ddlQtdeLum.ClientID %>").val()) {
                    $("#<%=ddlQtdeLum.ClientID %>").val("-1");
                }
            });
            
            /////////////////////////////////////////////////////setar dados iluminacao nos campos
           
            function selectInfoilu(tipobraco, projbraco, tipolum, tipofontelum, potfontelum, qtdefontelum, pottotfontelum, carginstotuip, tiporeator, tiporele, tipoalimentacao, tipoposte, altposte, altinstlum, municipio, regional, bairro, classeilum, logradouro, cep, codlog, ilumdest, nomelocdest, qtdelum, medicao, lat, lng, observacao) {

                if (tipobraco != "NULL" && tipobraco != undefined && tipobraco != "undefined" && tipobraco != null) {
                    $('#<%=ddlTipoBraco.ClientID%>').val(tipobraco);
                }

                if (projbraco != "NULL" && projbraco != undefined && projbraco != "undefined" && projbraco != null) {
                    $('#<%=txtProjBraco.ClientID%>').val(projbraco);
                }
                
                if (tipolum != "NULL" && tipolum != undefined && tipolum != "undefined" && tipolum != null) {
                    $('#<%=ddlTipoLum.ClientID%>').val(tipolum);
                }

                if (tipofontelum != "NULL" && tipofontelum != undefined && tipofontelum != "undefined" && tipofontelum != null) {
                    fonteLuminosa(tipofontelum);
                    $('#<%=ddlTipoFonteLum.ClientID%>').val(tipofontelum);
                }

                if (potfontelum != "NULL" && potfontelum != undefined && potfontelum != "undefined" && potfontelum != null) {
                    $('#<%=ddlPotFonteLum.ClientID%>').val(potfontelum);
                }
               
                if (qtdefontelum != "NULL" && qtdefontelum != undefined && qtdefontelum != "undefined" && qtdefontelum != null) {
                    $('#<%=ddlQtdeFonteLum.ClientID%>').val(qtdefontelum);
                }
               
                if (pottotfontelum != "NULL" && pottotfontelum != undefined && pottotfontelum != "undefined" && pottotfontelum != null) {
                    $('#<%=txtPotTotFonteLum.ClientID%>').val(pottotfontelum);
                }

                if (carginstotuip != "NULL" && carginstotuip != undefined && carginstotuip != "undefined" && carginstotuip != null) {
                    $('#<%=txtCargInsTotUIP.ClientID%>').val(carginstotuip);
                }
               
                if (tiporeator != "NULL" && tiporeator != undefined && tiporeator != "undefined" && tiporeator != null) {
                    $('#<%=ddlTipoReator.ClientID%>').val(tiporeator);
                }

                if (tiporele != "NULL" && tiporele != undefined && tiporele != "undefined" && tiporele != null) {
                    $('#<%=ddlTipoRele.ClientID%>').val(tiporele);
                }
                
                if (tipoalimentacao != "NULL" && tipoalimentacao != undefined && tipoalimentacao != "undefined" && tipoalimentacao != null) {
                    $('#<%=ddlTipoAlimentacao.ClientID%>').val(tipoalimentacao);
                }
               
                if (tipoposte != "NULL" && tipoposte != undefined && tipoposte != "undefined" && tipoposte != null) {
                    $('#<%=ddlTipoPoste.ClientID%>').val(tipoposte);
                }
               
                if (altposte != "NULL" && altposte != undefined && altposte != "undefined" && altposte != null) {
                    $('#<%=txtAltPoste.ClientID%>').val(altposte);
                }
              
              
                if (altinstlum != "NULL" && altinstlum != undefined && altinstlum != "undefined" && altinstlum !=null) {
                    $('#<%=txtAltInstLum.ClientID%>').val(altinstlum);
                }
              
                if (municipio != "NULL" && municipio != undefined && municipio != "undefined" && municipio != null) {
                    $('#<%=txtMun.ClientID%>').val(municipio);
                }
               
                if (regional != "NULL" && regional != undefined && regional != "undefined" && regional != null) {
                    $('#<%=txtReg.ClientID%>').val(regional);
                }
              
                if (bairro != "NULL" && bairro != undefined && bairro != "undefined" && bairro != null) {
                    $('#<%=txtBair.ClientID%>').val(bairro);
                }
                if (classeilum != "NULL" && classeilum != undefined && classeilum != "undefined" && classeilum != null) {
                    $('#<%=ddlClassIlum.ClientID%>').val(classeilum);
                }
                if (logradouro != "NULL" && logradouro != undefined && logradouro != "undefined" && logradouro != null) {
                    $('#<%=txtLog.ClientID%>').val(logradouro);
                }
              
                if (cep != "NULL" && cep != undefined && cep != "undefined" && cep != null) {
                    $('#<%=txtCEP.ClientID%>').val(cep);
                }
                if (codlog != "NULL" && codlog != undefined && codlog != "undefined" && codlog != null) {
                    $('#<%=txtCodLog.ClientID%>').val(codlog);
                }
               
                if (ilumdest != "NULL" && ilumdest != undefined && ilumdest != "undefined" && ilumdest != null) {
                    $('#<%=ddlIlumDest.ClientID%>').val(ilumdest);
                }
                else
                {
                     $('#<%=ddlIlumDest.ClientID%>').val("1");
                }
                if (nomelocdest != "NULL" && nomelocdest != undefined && nomelocdest != "undefined" && nomelocdest != null) {
                    $('#<%=txtNomeLocDestaq.ClientID%>').val(nomelocdest);
                }
                if (qtdelum != "NULL" && qtdelum != undefined && qtdelum != "undefined" && qtdelum != null) {
                    $('#<%=ddlQtdeLum.ClientID%>').val(qtdelum);
                }
                if (medicao != "NULL" && medicao != undefined && medicao != "undefined" && medicao != null) {
                    $('#<%=txtMed.ClientID%>').val(medicao);
                }
                if (lat != "NULL" && lat != undefined && lat != "undefined" && lat != null) {
                    $('#<%=txtLat.ClientID%>').val(lat);
                }
                
                if (lng != "NULL" && lng != undefined && lng != "undefined" && lng != null) {
                    $('#<%=txtLng.ClientID%>').val(lng);
                }
                if (observacao != "NULL" && observacao != undefined && observacao != "undefined" && observacao != null) {
                    $('#<%=txtObservacao.ClientID%>').val(observacao);
                }
            }

            /////////////////////////////////////////////////////fim selectinfoilu
            function limpacampos() {

                $('#<%=txtCodIluminacao.ClientID%>').css("background", "#FFFFFF");
                $("#<%=txtProjBraco.ClientID %>").val("");
                $('#<%=ddlTipoBraco.ClientID%>').val("-1");
                $('#<%=ddlTipoLum.ClientID%>').val("-1");
                $('#<%=ddlTipoLum.ClientID%>').val("-1");
                $('#<%=ddlTipoFonteLum.ClientID%>').val("-1");
                $('#<%=ddlPotFonteLum.ClientID%>').val("-1");
                $('#<%=ddlQtdeFonteLum.ClientID%>').val("-1");
                $('#<%=txtPotTotFonteLum.ClientID%>').val("");
                $('#<%=txtCargInsTotUIP.ClientID%>').val("");
                $('#<%=ddlTipoReator.ClientID%>').val("-1");
                $('#<%=ddlTipoRele.ClientID%>').val("-1");
                $('#<%=ddlTipoAlimentacao.ClientID%>').val("-1");
                $('#<%=ddlTipoPoste.ClientID%>').val("-1");
                $('#<%=txtAltPoste.ClientID%>').val("");
                $('#<%=txtAltInstLum.ClientID%>').val("");
                $('#<%=txtReg.ClientID%>').val("");
                $('#<%=txtBair.ClientID%>').val("");
                $('#<%=ddlClassIlum.ClientID%>').val("-1");
                $('#<%=txtLog.ClientID%>').val("");
                $('#<%=txtCEP.ClientID%>').val("");
                $('#<%=txtCodLog.ClientID%>').val("");
                $('#<%=txtNomeLocDestaq.ClientID%>').val("");
                $('#<%=ddlQtdeLum.ClientID%>').val("-1");
                $('#<%=txtMed.ClientID%>').val("");                     
                $("#<%=txtObservacao.ClientID %>").val("");           
            }

        /////////////////////////////////////////////////////////////limpar dados
             function limpa()
             {
                 
                    $("#<%=txtProjBraco.ClientID %>").val("");
                    $('#<%=ddlTipoBraco.ClientID%>').val("-1");               
                    $('#<%=ddlTipoLum.ClientID%>').val("-1");    
                    $('#<%=ddlTipoLum.ClientID%>').val("-1");                
                    $('#<%=ddlTipoFonteLum.ClientID%>').val("-1");                              
                    $('#<%=ddlPotFonteLum.ClientID%>').val("-1");
                    $('#<%=ddlQtdeFonteLum.ClientID%>').val("-1");
                    $('#<%=txtPotTotFonteLum.ClientID%>').val("");
                    $('#<%=txtCargInsTotUIP.ClientID%>').val("");
                    $('#<%=ddlTipoReator.ClientID%>').val("-1");
                    $('#<%=ddlTipoRele.ClientID%>').val("-1");
                    $('#<%=ddlTipoAlimentacao.ClientID%>').val("-1");
                    $('#<%=ddlTipoPoste.ClientID%>').val("-1");
                    $('#<%=txtAltPoste.ClientID%>').val("");
                    $('#<%=txtAltInstLum.ClientID%>').val("");
                    $('#<%=txtMun.ClientID%>').val("");
                    $('#<%=txtReg.ClientID%>').val("");
                    $('#<%=txtBair.ClientID%>').val("");
                    $('#<%=ddlClassIlum.ClientID%>').val("-1");
                    $('#<%=txtLog.ClientID%>').val("");
                    $('#<%=txtCEP.ClientID%>').val("");
                    $('#<%=txtCodLog.ClientID%>').val("");
                    $('#<%=ddlIlumDest.ClientID%>').val("-1");
                    $('#<%=txtNomeLocDestaq.ClientID%>').val("");
                    $('#<%=ddlQtdeLum.ClientID%>').val("");
                    $('#<%=txtMed.ClientID%>').val("");
                    $('#<%=txtLat.ClientID%>').val("");             
                    $('#<%=txtLng.ClientID%>').val("");
                    $('#deletarInfo').fadeOut();
                    $('#<%=LinkButtonAlterar.ClientID%>').fadeOut();
                    $('#<%=LinkButtonCadastrar.ClientID%>').fadeIn(1000);
                    $("#<%=txtObservacao.ClientID %>").val("");
                    $('#<%=hfCodilumPK.ClientID%>').val("");
                 setTimeout(function () {

                     $('#<%=Msucesso.ClientID%>').fadeOut();
                     $('#<%=Malerta.ClientID%>').fadeOut();
                     $('#<%=Merro.ClientID%>').fadeOut();

                 }, 3000);       

            }

    </script>
    
</asp:Content>
