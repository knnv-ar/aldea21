<%@LANGUAGE="VBSCRIPT"%>
<%

Dim rsLogin__prmUsername
rsLogin__prmUsername = "0"
if(Request.Form("Username") <> "") then rsLogin__prmUsername = Request.Form("Username")

Dim rsLogin__prmPassword
rsLogin__prmPassword = "0"
if(Request.Form("Password") <> "") then rsLogin__prmPassword = Request.Form("Password")

%>
<%
set rsLogin = Server.CreateObject("ADODB.Recordset")
rsLogin.ActiveConnection = "dsn=aldea21;"
rsLogin.Source = "SELECT *  FROM integ  WHERE integUserName = '" + Replace(rsLogin__prmUsername, "'", "''") + "' AND integUserPw = '" + Replace(rsLogin__prmPassword, "'", "''") + "'"
rsLogin.CursorType = 0
rsLogin.CursorLocation = 2
rsLogin.LockType = 3
rsLogin.Open
rsLogin_numRows = 0
%>
<%
'Spd login extension
Dim LogindFailed
If NOT rsLogin.EOF Then
   Response.Cookies("cLogin") = (rsLogin.Fields.Item("integID").Value)
   Response.Cookies("cIntegname") = (rsLogin.Fields.Item("integName").Value)
   If Request.Form("Remember") = "True" Then
      Response.Cookies("cRemember").Expires = Date() + 365
      Response.Cookies("cUsername").Expires = Date() + 365
      Response.Cookies("cPassword").Expires = Date() + 365
	  Response.Cookies("cIntegname").Expires = Date() + 365
      Response.Cookies("cRemember") = "1"
      Response.Cookies("cUsername") = Request.Form("Username")
      Response.Cookies("cPassword") = Request.Form("Password")
	  Response.Cookies("cIntegname") = (rsLogin.Fields.Item("integName").Value)
   Else
      Response.Cookies("cRemember").Expires = Date() - 1
      Response.Cookies("cUsername").Expires = Date() - 1
      Response.Cookies("cPassword").Expires = Date() - 1
   End If
   Response.Redirect("Loginsuc.asp") 
End If
If Request.ServerVariables("HTTP_METHOD") = "POST" Then
Loginfailed = "True"
Response.Cookies("cLogin") = ""
End If
'/Spd
%>
<html>
<!-- #BeginTemplate "/Templates/model.dwt" --> 
<head>
<!-- #BeginEditable "doctitle" --> 
<title>PPI Aldea 21 - &Aacute;rea de acceso de usuarios</title>
<!-- #EndEditable --> 
<meta http-equiv="Content-Type" content="text/html;">
<meta name="description" content="FW4 Generic HTML">
<!--Fireworks 4.0 Generic target.    Created Fri Mar 09 15:46:08 GMT-0300 (Hora estándar Sudamérica E.) 2001-->
<!-------------------- BEGIN COPYING THE JAVASCRIPT SECTION HERE ------------------->
<script language="JavaScript">
<!-- hide
function fwLoadMenus() {
  if (window.fw_menu_0) return;
    window.fw_menu_0_1 = new Menu("Transferencia",169,16,"Verdana, Arial, Helvetica, sans-serif",9,"#ffffff","#ffffff","#983333","#c2433d");
    fw_menu_0_1.addMenuItem("Servicios y consultor&iacute;as","location='http://www.unq.edu.ar/aldea21/static/info/trasfsyc.htm'");
    fw_menu_0_1.addMenuItem("Desarrollo tecnol&oacute;gico","location='http://www.unq.edu.ar/aldea21/static/info/transfdt.htm'");
     fw_menu_0_1.bgImageUp="images/fwmenu6_169x16_up.gif";
     fw_menu_0_1.bgImageOver="images/fwmenu6_169x16_over.gif";
     fw_menu_0_1.fontWeight="bold";
     fw_menu_0_1.hideOnMouseOut=true;
  window.fw_menu_0 = new Menu("root",169,16,"Verdana, Arial, Helvetica, sans-serif",9,"#ffffff","#ffffff","#983333","#c2433d");
  fw_menu_0.addMenuItem("Objetivos","location='http://www.unq.edu.ar/aldea21/static/info/objetiv.htm'");
  fw_menu_0.addMenuItem("Ejes anal&iacute;ticos","location='http://www.unq.edu.ar/aldea21/static/info/ejes.htm'");
  fw_menu_0.addMenuItem("Coop. nacional e internacional","location='http://www.unq.edu.ar/aldea21/static/info/coop.htm'");
  fw_menu_0.addMenuItem(fw_menu_0_1,"location='http://poner.link'");
  fw_menu_0.addMenuItem("Formaci&oacute;n de RR HH","location='http://www.unq.edu.ar/aldea21/static/info/formrrhh.htm'");
  fw_menu_0.addMenuItem("Subsidios","location='http://www.unq.edu.ar/aldea21/static/info/subsidio.htm'");
  fw_menu_0.addMenuItem("Novedades del sitio","location='http://www.unq.edu.ar/aldea21/static/info/novedad.htm'");
  fw_menu_0.addMenuItem("Agenda de actividades","location='http://www.unq.edu.ar/aldea21/static/info/agenda.htm'");
  fw_menu_0.addMenuItem("Lecturas recomendadas","location='http://www.unq.edu.ar/aldea21/static/info/lect.htm'");
  fw_menu_0.addMenuItem("Entrevistas","location='http://www.unq.edu.ar/aldea21/static/info/entrev.htm'");
   fw_menu_0.bgImageUp="images/fwmenu6_169x16_up.gif";
   fw_menu_0.bgImageOver="images/fwmenu6_169x16_over.gif";
   fw_menu_0.fontWeight="bold";
   fw_menu_0.hideOnMouseOut=true;
   fw_menu_0.childMenuIcon="images/arrows.gif";
  window.fw_menu_1 = new Menu("root",496,16,"Verdana, Arial, Helvetica, sans-serif",9,"#ffffff","#ffffff","#983333","#c2433d");
  fw_menu_1.addMenuItem("Herramientas inform&aacute;ticas y gesti&oacute;n municipal.","location='http://www.unq.edu.ar/aldea21/static/proy/higm.htm'");
  fw_menu_1.addMenuItem("Los actores sociales de las TIC's en el escenario urbano.","location='http://www.unq.edu.ar/aldea21/static/proy/aste.htm'");
  fw_menu_1.addMenuItem("Las redes ciudadanas sustentadas por TIC's.","location='http://www.unq.edu.ar/aldea21/static/proy/rcst.htm'");
  fw_menu_1.addMenuItem("Efectos periurbanos de las autopistas con peaje.","location='http://www.unq.edu.ar/aldea21/static/proy/epap.htm'");
  fw_menu_1.addMenuItem("Nuevas formas de producci&oacute;n de la ciudad.","location='http://www.unq.edu.ar/aldea21/static/proy/nfpc.htm'");
  fw_menu_1.addMenuItem("Las nuevas t&eacute;cnicas de gesti&oacute;n local.","location='http://www.unq.edu.ar/aldea21/static/proy/ntgl.htm'");
  fw_menu_1.addMenuItem("Desarrollo de herramientas por Internet para la gesti&oacute;n municipal.","location='http://www.unq.edu.ar/aldea21/static/proy/dhig.htm'");
  fw_menu_1.addMenuItem("Procesos pol&iacute;ticos, moralidad vecinal y espacio urbano en la constituci&oacute;n de identidades locales.","location='http://www.unq.edu.ar/aldea21/static/proy/ppmv.htm'");
  fw_menu_1.addMenuItem("La reestructuraci&oacute;n econ&oacute;mica, territorial y los actores sociales.","location='http://www.unq.edu.ar/aldea21/static/proy/reta.htm'");
  fw_menu_1.addMenuItem("Internet y gesti&oacute;n local.","location='http://www.unq.edu.ar/aldea21/static/proy/iygl.htm'");
  fw_menu_1.addMenuItem("Pol&iacute;ticas de privatizaci&oacute;n e informatizaci&oacute;n de los servicios urbanos.","location='http://www.unq.edu.ar/aldea21/static/proy/ppis.htm'");
  fw_menu_1.addMenuItem("Experiencias innovadoras de articulaci&oacute;n interinstitucional.","location='http://www.unq.edu.ar/aldea21/static/proy/eiai.htm'");
   fw_menu_1.bgImageUp="images/fwmenu5_496x16_up.gif";
   fw_menu_1.bgImageOver="images/fwmenu5_496x16_over.gif";
   fw_menu_1.fontWeight="bold";
   fw_menu_1.hideOnMouseOut=true;
  window.fw_menu_2 = new Menu("root",219,16,"Verdana, Arial, Helvetica, sans-serif",9,"#ffffff","#ffffff","#983333","#c2433d");
  fw_menu_2.addMenuItem("Schiavo, Ester - Directora","location='http://www.unq.edu.ar/aldea21/dinamic/integ.asp?id=1'");
  fw_menu_2.addMenuItem("Fidel, Carlos - Codirector","location='http://www.unq.edu.ar/aldea21/dinamic/integ.asp?id=11'");
  fw_menu_2.addMenuItem("Villar, Alejandro - Codirector","location='http://www.unq.edu.ar/aldea21/dinamic/integ.asp?id=5'");
  fw_menu_2.addMenuItem("Cravacuore, Daniel - Investigador","location='http://www.unq.edu.ar/aldea21/dinamic/integ.asp?id=2'");
  fw_menu_2.addMenuItem("Dabat, Germán - Investigador","location='http://www.unq.edu.ar/aldea21/dinamic/integ.asp?id=12'");
  fw_menu_2.addMenuItem("Fernandez, Gabriel - Investigador","location='http://www.unq.edu.ar/aldea21/dinamic/integ.asp?id=13'");
  fw_menu_2.addMenuItem("Fernandez, Marcela - Investigadora","location='http://www.unq.edu.ar/aldea21/dinamic/integ.asp?id=4'");
  fw_menu_2.addMenuItem("Finquelievich, Susana - Investigadora","location='http://www.unq.edu.ar/aldea21/dinamic/integ.asp?id=6'");
  fw_menu_2.addMenuItem("Frederic, Sabina - Investigadora","location='http://www.unq.edu.ar/aldea21/dinamic/integ.asp?id=7'");
  fw_menu_2.addMenuItem("Ilari, Sergio - Investigador","location='http://www.unq.edu.ar/aldea21/dinamic/integ.asp?id=3'");
  fw_menu_2.addMenuItem("Quiroga, Sol - Investigadora","location='http://www.unq.edu.ar/aldea21/dinamic/integ.asp?id=8'");
  fw_menu_2.addMenuItem("Russo, Cintia - Investigadora","location='http://www.unq.edu.ar/aldea21/dinamic/integ.asp?id=9'");
  fw_menu_2.addMenuItem("Salm&uacute;n Feijoo, Gustavo - Investigador","www.unq.edu.ar/aldea21/dinamic/integ.asp?id=10'");
  fw_menu_2.addMenuItem("Alvarez, Roberto - Becario","location='http://www.unq.edu.ar/aldea21/dinamic/integ.asp?id=15'");
  fw_menu_2.addMenuItem("Coppoleccio, Leandro - Becario","location='http://www.unq.edu.ar/aldea21/dinamic/integ.asp?id=14'");
  fw_menu_2.addMenuItem("Nudelman, Santiago - Becario","location='http://www.unq.edu.ar/aldea21/dinamic/integ.asp?id=16'");
  fw_menu_2.addMenuItem("Scarria, Sandra - Becaria","location='http://www.unq.edu.ar/aldea21/dinamic/integ.asp?id=17'");
  fw_menu_2.addMenuItem("Siavezzi, Vanesa - Becaria","location='http://www.unq.edu.ar/aldea21/dinamic/integ.asp?id=18'");
  fw_menu_2.addMenuItem("Lacabanne, Ra&uacute;l - Aux. de investigaci&oacute;n","location='http://www.unq.edu.ar/aldea21/dinamic/integ.asp?id=19'");
  fw_menu_2.addMenuItem("Plano, Cecilia - Aux. de investigaci&oacute;n","location='http://www.unq.edu.ar/aldea21/dinamic/integ.asp?id=20'");
  fw_menu_2.addMenuItem("- Actualizaci&oacute;n de datos -","location='http://www.unq.edu.ar/aldea21/dinamic/usrzne/login.asp'");
   fw_menu_2.bgImageUp="images/fwmenu4_219x16_up.gif";
   fw_menu_2.bgImageOver="images/fwmenu4_219x16_over.gif";
   fw_menu_2.fontWeight="bold";
   fw_menu_2.hideOnMouseOut=true;
  window.fw_menu_3 = new Menu("root",123,16,"Verdana, Arial, Helvetica, sans-serif",9,"#ffffff","#ffffff","#983333","#c2433d");
  fw_menu_3.addMenuItem("B&uacute;squeda por autor","location='http://www.unq.edu.ar/aldea21/dinamic/apublsrh.asp'");
  fw_menu_3.addMenuItem("B&uacute;squeda por tipo","location='http://www.unq.edu.ar/aldea21/dinamic/tpublsrh.asp'");
  fw_menu_3.addMenuItem("Ordenadas por a&ntilde;o","location='http://www.unq.edu.ar/aldea21/dinamic/ypuball.asp'");
  fw_menu_3.addMenuItem("Ordenadas por autor","location='http://www.unq.edu.ar/aldea21/dinamic/apuball.asp'");
  fw_menu_3.addMenuItem("Ordenadas por tipo","location='http://www.unq.edu.ar/aldea21/dinamic/tpuball.asp'");
   fw_menu_3.bgImageUp="images/fwmenu3_123x16_up.gif";
   fw_menu_3.bgImageOver="images/fwmenu3_123x16_over.gif";
   fw_menu_3.fontWeight="bold";
   fw_menu_3.hideOnMouseOut=true;
    window.fw_menu_4_1 = new Menu("Presentaciones a congresos y otros",237,16,"Verdana, Arial, Helvetica, sans-serif",9,"#ffffff","#ffffff","#983333","#c2433d");
    fw_menu_4_1.addMenuItem("B&uacute;squeda por integrante","location='http://www.unq.edu.ar/aldea21/dinamic/icongsrh.asp'");
    fw_menu_4_1.addMenuItem("Ordenadas por a&ntilde;o","location='http://www.unq.edu.ar/aldea21/dinamic/ycongall.asp'");
    fw_menu_4_1.addMenuItem("Ordenadas por integrante","location='http://www.unq.edu.ar/aldea21/dinamic/icongall.asp'");
     fw_menu_4_1.bgImageUp="images/fwmenu2_237x16_up.gif";
     fw_menu_4_1.bgImageOver="images/fwmenu2_237x16_over.gif";
     fw_menu_4_1.fontWeight="bold";
     fw_menu_4_1.hideOnMouseOut=true;
  window.fw_menu_4 = new Menu("root",237,16,"Verdana, Arial, Helvetica, sans-serif",9,"#ffffff","#ffffff","#983333","#c2433d");
  fw_menu_4.addMenuItem(fw_menu_4_1,"location='http://poner.link'");
  fw_menu_4.addMenuItem("Charlas y conferencias en congresos y otros","location='http://www.unq.edu.ar/aldea21/dinamic/ccc.asp'");
  fw_menu_4.addMenuItem("Otras charlas y conferencias","location='http://www.unq.edu.ar/aldea21/dinamic/occ.asp'");
  fw_menu_4.addMenuItem("Organizaci&oacute;n de congresos y otros","location='http://www.unq.edu.ar/aldea21/dinamic/odp.asp'");
   fw_menu_4.bgImageUp="images/fwmenu2_237x16_up.gif";
   fw_menu_4.bgImageOver="images/fwmenu2_237x16_over.gif";
   fw_menu_4.fontWeight="bold";
   fw_menu_4.hideOnMouseOut=true;
   fw_menu_4.childMenuIcon="images/arrows.gif";
  window.fw_menu_5 = new Menu("root",182,16,"Verdana, Arial, Helvetica, sans-serif",9,"#ffffff","#ffffff","#983333","#c2433d");
  fw_menu_5.addMenuItem("Universidad Nacional de Quilmes","location='http://www.unq.edu.ar'");
  fw_menu_5.addMenuItem("Universidad Virtual Quilmes","location='http://www.uvq.edu.ar'");
  fw_menu_5.addMenuItem("Factoría Web","location='http://www.lafactoriaweb.com'");
  fw_menu_5.addMenuItem("Infópolis","location='http://www.infopolis.org.ar'");
  fw_menu_5.addMenuItem("La ciudad en.red.ada","location='http://www.enredada.com'");
  fw_menu_5.addMenuItem("Mundo Urbano","location='http://www.argiropolis.com.ar/mundourbano/index.htm'");
  fw_menu_5.addMenuItem("Banco Experiencias Locales","location='http://www.unq.edu.ar/bel'");
  fw_menu_5.addMenuItem("CLAD","location='http://www.clad.org.ve'");
  fw_menu_5.addMenuItem("Índice Admin. Publ. Arg.","location='http://www.info.gov.ar'");
  fw_menu_5.addMenuItem("IBAM","location='http://www.ibam.org.br'");
  fw_menu_5.addMenuItem("Subsecr. Asuntos Municipales","location='http://www.mininterior.gov.ar/municipios'");
  fw_menu_5.addMenuItem("RNCAGGL","location='http://www.inap.gov.ar/serviciosdeestudio/red/centros.htm'");
  fw_menu_5.addMenuItem("Unión Iberoamer. Municipalistas","location='http://www.eurosur.org/CEMCI/uim0.htm'");
  fw_menu_5.addMenuItem("IULA","location='http://www.iula.org'");
   fw_menu_5.bgImageUp="images/fwmenu1_182x16_up.gif";
   fw_menu_5.bgImageOver="images/fwmenu1_182x16_over.gif";
   fw_menu_5.fontWeight="bold";
   fw_menu_5.hideOnMouseOut=true;

  fw_menu_5.writeMenus();
} // fwLoadMenus()

// stop hiding -->
</script>
<script language="JavaScript1.2" src="../fw_menu.js"></script>
<!-------------------------- STOP COPYING THE JAVASCRIPT HERE -------------------------->
</head>
<body bgcolor="#ffffff" onload="" topmargin="0" leftmargin="0" marginheight="0" marginwidth="0" link="#000000" vlink="#000000" alink="#000000">
<!--The following section is an image or HTML table which reassembles the sliced image in a browser.-->
<!--Copy the table section including the opening and closing table tags, and paste the data where-->
<!--you want the reassembled image to appear in the destination document. -->
<!-------------------------- BEGIN COPYING THE HTML ---------------------------->
<script language="JavaScript1.2">fwLoadMenus();</script>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <!-- fwtable fwsrc="homepage2.png" fwbase="index.asp.gif" fwstyle="Generic" fwdocid = "742308039" fwnested=""0" -->
  <tr> 
    <!-- Shim row, height 1. -->
    <td><img src="../images/spacer.gif" width="80" height="1" border="0"></td>
    <td><img src="../images/spacer.gif" width="116" height="1" border="0"></td>
    <td><img src="../images/spacer.gif" width="75" height="1" border="0"></td>
    <td><img src="../images/spacer.gif" width="90" height="1" border="0"></td>
    <td><img src="../images/spacer.gif" width="97" height="1" border="0"></td>
    <td><img src="../images/spacer.gif" width="63" height="1" border="0"></td>
    <td><img src="../images/spacer.gif" width="68" height="1" border="0"></td>
    <td><img src="../images/spacer.gif" width="128" height="1" border="0"></td>
    <td><img src="../images/spacer.gif" width="1" height="1" border="0"></td>
  </tr>
  <tr> 
    <!-- row 1 -->
    <td colspan="8"><a href="http://www.unq.edu.ar/aldea21/dinamic/index.asp"><img name="indexasp_r1_c1" src="../images/index.asp_r1_c1.gif" width="717" height="60" border="0" alt="P&aacute;gina Principal del PPI Aldea 21"></a></td>
    <td><img src="../images/spacer.gif" width="1" height="60" border="0"></td>
  </tr>
  <tr> 
    <!-- row 2 -->
    <td width="80"><a href="http://www.unq.edu.ar/aldea21/dinamic/index.asp"><img name="indexasp_r2_c1" src="../images/index.asp_r2_c1.gif" width="80" height="18" border="0"></a></td>
    <td width="116"><a href="#" onMouseOut="FW_startTimeout();"  onMouseOver="window.FW_showMenu(window.fw_menu_0,81,78);" ><img name="indexasp_r2_c2" src="../images/index.asp_r2_c2.gif" width="116" height="18" border="0"></a></td>
    <td width="75"><a href="#" onMouseOut="FW_startTimeout();"  onMouseOver="window.FW_showMenu(window.fw_menu_1,196,78);" ><img name="indexasp_r2_c3" src="../images/index.asp_r2_c3.gif" width="75" height="18" border="0"></a></td>
    <td width="90"><a href="#" onMouseOut="FW_startTimeout();"  onMouseOver="window.FW_showMenu(window.fw_menu_2,271,78);" ><img name="indexasp_r2_c4" src="../images/index.asp_r2_c4.gif" width="90" height="18" border="0"></a></td>
    <td width="97"><a href="#" onMouseOut="FW_startTimeout();"  onMouseOver="window.FW_showMenu(window.fw_menu_3,361,78);" ><img name="indexasp_r2_c5" src="../images/index.asp_r2_c5.gif" width="97" height="18" border="0"></a></td>
    <td width="63"><a href="#" onMouseOut="FW_startTimeout();"  onMouseOver="window.FW_showMenu(window.fw_menu_4,458,78);" ><img name="indexasp_r2_c6" src="../images/index.asp_r2_c6.gif" width="63" height="18" border="0"></a></td>
    <td width="68"><a href="#" onMouseOut="FW_startTimeout();"  onMouseOver="window.FW_showMenu(window.fw_menu_5,521,78);" ><img name="indexasp_r2_c7" src="../images/index.asp_r2_c7.gif" width="68" height="18" border="0"></a></td>
    <td background="../images/a21_loop.gif"> 
      <div align="right"><img src="../images/a21_tail.gif" width="12" height="18"></div>
    </td>
    <td><img src="../images/spacer.gif" width="1" height="18" border="0"></td>
  </tr>
  <!--   This HTML was automatically created with Macromedia Fireworks 4.0   -->
  <!--   http://www.macromedia.com   -->
</table>
<!--------------------------- STOP COPYING THE HTML HERE --------------------------->
<br>
<table width="650" border="0" cellspacing="4" cellpadding="2">
  <tr> 
    <td width="50%"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif">Versi&oacute;n 
      2.0</font></b></font></td>
    <td width="50%"> 
      <div align="right"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><b>&Uacute;ltima 
        actualizaci&oacute;n: 12 de marzo de 2001</b></font></div>
    </td>
  </tr>
</table>
<br>
<table width="650" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td valign="top"><!-- #BeginEditable "contenido" --> 
      <div align="center"> 
        <table width="100%" border="0" cellspacing="4" cellpadding="2">
          <tr> 
            <td> 
              <div align="center"> 
                <p><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b>&Aacute;rea 
                  de Acceso de Usuarios</b></font></p>
              </div>
              <form name="form1" method="post" action="login.asp">
                <table width="300" border="0" cellpadding="2" cellspacing="4">
                  <tr> 
                    <td bgcolor="#FFCC99"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Usuario</font></b></td>
                    <td bgcolor="#FFCC99"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                      <input type="text" name="Username" value="<%= Request.Cookies("cUsername") %>">
                      </font></td>
                  </tr>
                  <tr> 
                    <td bgcolor="#FFCC99"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Contrase&ntilde;a</font></b></td>
                    <td bgcolor="#FFCC99"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                      <input type="password" name="Password" value="<%= Request.Cookies("cPassword") %>">
                      </font></td>
                  </tr>
                  <tr> 
                    <td bgcolor="#FFCC99"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Recordar 
                      Contrase&ntilde;a</font></b></td>
                    <td bgcolor="#FFCC99"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                      <input type="checkbox" name="Remember" value="True" <%If (Request.Cookies("cRemember") = "1") Then Response.Write("CHECKED") : Response.Write("")%>>
                      </font></td>
                  </tr>
                  <tr> 
                    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"></font></td>
                    <td bgcolor="#FFCC99"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                      <% If LoginFailed = "True" Then %>
                      <b><font color="#FF0000" size="1">Los datos entrados no 
                      tienen permiso de acceso</font></b> 
                      <%End If%>
                      </font></td>
                  </tr>
                  <tr> 
                    <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%= Request.Form("test") %></font></td>
                    <td bgcolor="#FFCC99"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                      <input type="submit" name="Submit" value="Entrar">
                      </font></td>
                  </tr>
                </table>
              </form>
              <p>&nbsp;</p>
            </td>
          </tr>
        </table>
        <p>&nbsp;</p>
      </div>
      <!-- #EndEditable --> </td>
  </tr>
  <tr> 
    <td> 
      <div align="center"> 
        <p>&nbsp;</p>
        <p><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><img src="../images/newunq.gif" width="117" height="43"><br>
          <br>
          Roque Saenz Pe&ntilde;a 180, Casa 12, Of. 10<br>
          CP 1876 Bernal - Buenos Aires - Argentina<br>
          Tel. (54 11) 4365-7100 int. 104 - Fax (54 11) 4365-7182<br>
          webmaster:<a href="mailto:rlacaban@unq.edu.ar"> rlacaban@unq.edu.ar</a><br>
          <br>
          Copyright &copy; 1999-2000 Programa Prioritario de Investigaci&oacute;n 
          Aldea XXI. Todos los derechos reservados.</font></b></p>
      </div>
    </td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
<!-- #EndTemplate --> 
</html>

