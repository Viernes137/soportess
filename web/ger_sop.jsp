<%-- 
    Document   : ger_sop
    Created on : 31 mar. 2023, 22:02:04
    Author     : ldrnts
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <!-- css personalizado -->
        <link href="css1.css" rel="stylesheet">
        <link rel="shortcut icon" href="IconoJAYMO.ico">
        <style>
            .subtitulotabla{
                height: 70px;
                background-color:beige;

            }
        </style>
    </head>
    <body>
        <%
        try{
        HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
        int idPac = (int) (miSessiondelUsuario.getAttribute("idPer") == null ? 0 : miSessiondelUsuario.getAttribute("idPer"));
        String Nombre = miSessiondelUsuario.getAttribute("UsuarioPac").toString();

        if (idPac < 1) {
            response.sendRedirect("index.html");
        }

        String alias = "";
        int cont =0;
        int cont2 =0;

        Base bd = new Base();
        bd.conectar();
        %>
        <div class="container">
            <div class="p-5  rounded-3">
                <center><h1><%=Nombre%> es Gerente de Soporte</h1></center>
            </div>
            <div class="container text-center">
                <div class="row align-items-start">
                    <div class="col">
                        <div class="subtitulotabla centrado">
                            <h4>abierto</h4>
                        </div>
                        <script>

                            function mant(id) {
                                document.getElementById('id').value = id;
                                document.getElementById('tipo').value = "2";
                            }
                            ;
                            function sop(id) {
                                document.getElementById('id').value = id;
                                document.getElementById('tipo').value = "1";
                            }
                            ;
                        </script>
                        <%
                        String strQry2 = "select * from reportes where estado = '1';";
                        ResultSet conex = bd.consulta(strQry2);
                            
                        while(conex.next()){
                        cont++;
                            
                        String reporte = conex.getString(2);
                        String fecha = conex.getString(5);
                        
                        int id = conex.getInt(1);
                        if(cont == 1){
                            
                        %>
                        <div class="centrado">
                            <form name="mandarnuevos" id="mandarnuevos" method="post" action="act_rep_2.jsp">
                                <script>
                                    var fecha = new Date();
                                    var Fecha = (fecha.getFullYear() + "-" + (fecha.getMonth() + 1) + "-" + fecha.getDate() + " " + fecha.getHours() + ":" + fecha.getMinutes() + ":" + fecha.getSeconds());
                                </script>
                                <div class="mb-3">
                                    <label for="reporte" class="form-label mt-3"><%=reporte%></label>
                                    <input type="text" class="form-control escondido" id="reporte" name="reporte" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3 escondido">
                                    <label for="estado" class="form-label"></label>
                                    <input type="text" class="form-control" id="estado" name="estado" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3 escondido">
                                    <label for="resp" class="form-label"></label>
                                    <input type="text" class="form-control" id="resp" name="resp" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3 escondido">
                                    <label for="id" class="form-label"></label>
                                    <input type="text" class="form-control" id="id" name="id" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3 escondido">
                                    <label for="fecha_ac" class="form-label"></label>
                                    <input type="text" class="form-control" id="fecha_ac" name="fecha_ac" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3 escondido">
                                    <label for="tipo" class="form-label"></label>
                                    <input type="text" class="form-control" id="tipo" name="tipo" aria-describedby="emailHelp">
                                </div>
                                <div>
                                    <p><b>fecha de creacion:</b></p>
                                    <p> <%=fecha%></p>
                                </div>
                                <button class="btn btn-secondary"  type="submit" id="bt1" onclick="mant(<%=id%>)" >mantenimiento</button>
                                <button class="btn btn-secondary" type="submit" id="bt2" onclick="sop(<%=id%>)" >soporte</button>
                                <!-- comment <button type="submit" class="btn btn-primary">Enviar</button>-->
                                <hr>
                                <script>
                                    function fechaa() {
                                        document.getElementById('fecha_ac').value = Fecha.toString();
                                        document.getElementById('estado').value = "2";
                                    }
                                    ;
                                    fechaa();
                                </script>
                            </form>
                        </div>
                        <%
                            }else{
                        %>
                        <div class="centrado mt-3"  >
                            <div>
                            <h6><%=reporte%></h6>
                            <p><b>fecha de creacion:</b></p>
                                    <p> <%=fecha%></p>
                                    <hr>
                            </div>
                            
                        </div>
                        <%
                            continue;
                            }
}
                        %>
                    </div>
                    <div class="col">

                        <div class="subtitulotabla centrado">
                            <h4>proceso</h4>
                        </div>
                        <%
                            String strQry3 = "select * from reportes where estado = '2';";
                            ResultSet conex2 = bd.consulta(strQry3);
                            while(conex2.next()){
                            
                            String reporte = conex2.getString(2);
                            String fecha = conex2.getString(6);
                            int tipo = conex2.getInt(7);
                            String tipo_txt ="";
                            String color ="";
                            
                            if (tipo == 1){
                                tipo_txt ="soporte ";
                                color ="#6BB822";
                            }else{
                                tipo_txt ="mantenimiento ";
                                color ="#286CCD";
                            }
                        %>
                        <div class="blq3 p-4" >
                            <h6><%=reporte%></h6>
                            <p style="color:<%=color%>;"><%=tipo_txt%></p>
                            <p>ultima fecha de modificacion:</p>
                            <p> <%=fecha%></p>
                        </div>
                        <hr>
                        <%
                            }
                        %>

                    </div>
                    <div class="col">
                        <div class="subtitulotabla centrado">
                            <h4>en mantenimiento</h4>
                        </div>
                        <%
                            String strQry4 = "select * from reportes where estado = '3';";
                            ResultSet conex3 = bd.consulta(strQry4);
                            while(conex3.next()){
                            
                            String reporte = conex3.getString(2);
                            String fecha = conex3.getString(6);
                            int tipo = conex3.getInt(7);
                            String tipo_txt ="";
                            String color ="";
                            
                            if (tipo == 1){
                                tipo_txt ="soporte ";
                                color ="#6BB822";
                            }else{
                                tipo_txt ="mantenimiento ";
                                color ="#286CCD";
                            }
                        %>
                        <div class=" p-4">
                            <h6><%=reporte%></h6>
                            <p style="color:<%=color%>;"><%=tipo_txt%></p>
                            <p>ultima fecha de modificacion:</p>
                            <p> <%=fecha%></p>
                        </div>
                        <hr>
                        <%
                            }
                        %>
                    </div>
                    <div class="col">
                        <div class="subtitulotabla centrado">
                            <h4>mantenimiento completado</h4>
                        </div>
                        <script >
                            function calabaza(id) {
                                document.getElementById('idm').value = id;
                            }
                            ;
                        </script>
                        <%
                            String strQry5 = "select * from reportes where estado = '4' and tipo_rep=2;";
                            ResultSet conex4 = bd.consulta(strQry5);
                            while(conex4.next()){
                                cont2++;
                                String reporte = conex4.getString(2);
                                String fecha = conex4.getString(6);
                                int tipo = conex4.getInt(7);
                                int id = conex4.getInt(1);

                                String tipo_txt ="";
                                String color ="";

                                if (tipo == 1){
                                    tipo_txt ="soporte ";
                                    color ="#6BB822";
                                }else{
                                    tipo_txt ="mantenimiento ";
                                    color ="#286CCD";
                                }
                                
                                if(cont2==1){%>
                            <div class="centrado">
                                <form name="formularionumerodos" id="formularionumerodos" method="post" action="act_rep_7.jsp">
                                <script>
                                    var fecha = new Date();
                                    var Fecha = (fecha.getFullYear() + "-" + (fecha.getMonth() + 1) + "-" + fecha.getDate() + " " + fecha.getHours() + ":" + fecha.getMinutes() + ":" + fecha.getSeconds());
                                </script>
                                <div class="mb-3">
                                    <label for="reportem" class="form-label mt-3"><%=reporte%></label>
                                    <input type="text" class="form-control escondido" id="reportem" name="reportem" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3 escondido">
                                    <label for="estadom" class="form-label"></label>
                                    <input type="text" class="form-control" id="estadom" name="estadom" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3 escondido">
                                    <label for="respm" class="form-label"></label>
                                    <input type="text" class="form-control" id="respm" name="respm" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3 escondido">
                                    <label for="idm" class="form-label"></label>
                                    <input type="text" class="form-control" id="idm" name="idm" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3 escondido">
                                    <label for="fecha_acm" class="form-label"></label>
                                    <input type="text" class="form-control" id="fecha_acm" name="fecha_acm" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3 escondido">
                                    <label for="tipom" class="form-label"></label>
                                    <input type="text" class="form-control" id="tipom" name="tipom" aria-describedby="emailHelp">
                                </div>
                                <div>
                                    <p><b>fecha de creacion:</b></p>
                                    <p> <%=fecha%></p>
                                </div>
                                <button class="btn btn-secondary" type="submit" onclick="calabaza(<%=id%>)" >Finalizar</button>
                                <hr>
                                <script>
                                    function fechaa() {
                                        document.getElementById('fecha_acm').value = Fecha.toString();
                                        document.getElementById('estadom').value = "5"; };
                                    fechaa();
                                </script>
                            </form>
                        </div>
                            
                            
                            <% }else{
                        %>
                        <div class=" p-4">
                            <h6><%=reporte%></h6>
                            <p style="color:<%=color%>;"><%=tipo_txt%></p>
                            <p>ultima fecha de modificacion:</p>
                            <p> <%=fecha%></p>
                        </div>
                        <hr>
                        <%
                            continue;
                            }
                            }
                        %>
                    </div>
                    <div class="col">
                        <div class="subtitulotabla centrado">
                            <h4>cerrado</h4>
                        </div>
                        <%
                            String strQry6 = "select * from reportes where estado = '5';";
                            ResultSet conex5 = bd.consulta(strQry6);
                            while(conex5.next()){
                            String reporte = conex5.getString(2);
                            String fecha = conex5.getString(6);
                            String respuesta = conex5.getString(4);
                            String fecha2 = conex5.getString(5);
                            
                            int tipo = conex5.getInt(7);
                            String tipo_txt ="";
                            String color ="";
                            
                            if (tipo == 1){
                                tipo_txt ="soporte ";
                                color ="#6BB822";
                            }else{
                                tipo_txt ="mantenimiento ";
                                color ="#286CCD";
                            }
                        %>
                        <div class=" p-4">
                            <h6><%=reporte%></h6>
                            <p style="color:<%=color%>;"><%=tipo_txt%></p>
                            <p><b>ultima fecha de modificacion:</b></p>
                            <p> <%=fecha%></p>
                            <p><b>fecha de creacion:</b></p>
                            <p> <%=fecha2%></p>
                            <p><b>respuesta</b></p>
                            <p><%=respuesta%></p>
                        </div>
                        <hr>
                        <%
                            }
                        %>
                    </div>

                </div>
            </div>
        </div>
        <a id="bt1a" href="index.html"><h5>regresar</h5></a>
        <%}catch (Exception ex) {%>
        <div class="container">
            <div class="centrado">
                <h1><%out.print("se ha cerrado la sesion");%></h1>  
                <a class="btn btn-secondary" href='index.html'>regresar</a>
            </div>
        </div>
        <%
            }
        %>
    </body>
</html>


