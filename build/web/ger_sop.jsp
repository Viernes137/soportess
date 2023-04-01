<%-- 
    Document   : ger_sop
    Created on : 31 mar. 2023, 22:02:04
    Author     : bruno fragoso
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

        Base bd = new Base();
        bd.conectar();
        %>
        <div class="container">
            <div>
                <h1><%=Nombre%>, su rol es Gerente de soporte sisi</h1>
            </div>
            <div class="container text-center">
                <div class="row align-items-start">
                    <div class="col">
                        <div class="subtitulotabla centrado">
                            <h4>abierto</h4>
                        </div>
                            
                            <%
                            String strQry2 = "select * from reportes where estado = '1';";
                            ResultSet conex = bd.consulta(strQry2);
                            while(conex.next()){
                            
                            String reporte = conex.getString(2);
                            int id = conex.getInt(1);
                            %>
                            <div class="centrado">
                <form name="Reportes" method="post" action="act_rep_2.jsp">
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
                    <script>
                        function defdatos() {
                            document.getElementById('id').value =<%=id%> ;
                            document.getElementById('fecha_ac').value = Fecha.toString();
                            document.getElementById('estado').value = "2";
                        }
                        ;
                        function mant() {
                            document.getElementById('tipo').value = "2";
                        }
                        ;
                        function sop() {
                            document.getElementById('tipo').value = "1";
                        }
                        ;
                        defdatos();
                    </script>
                    <button class="btn btn-secondary" onclick="mant()">mantenimiento</button>
                    <button class="btn btn-secondary" onclick="sop()">soporte</button>
                    <!--<button type="submit" class="btn btn-primary">Enviar</button>-->
                </form>
                            <hr>
                            </div>
                            <%
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
                       <h4>mantenimiento cerrado</h4>
                        </div>
                        <%
                            String strQry5 = "select * from reportes where estado = '4';";
                            ResultSet conex4 = bd.consulta(strQry5);
                            while(conex4.next()){
                            
                            String reporte = conex4.getString(2);
                            String fecha = conex4.getString(6);
                            int tipo = conex4.getInt(7);
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
                       <h4>soporte cerrado</h4>
                        </div>
                        <%
                            String strQry6 = "select * from reportes where estado = '5';";
                            ResultSet conex5 = bd.consulta(strQry6);
                            while(conex5.next()){
                            
                            String reporte = conex5.getString(2);
                            String fecha = conex5.getString(6);
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
                                <p>ultima fecha de modificacion:</p>
                                <p> <%=fecha%></p>
                             </div>
                             <hr>
                            <%
                                }
                            %>
                    </div>
                    
                </div>
            </div>
        </div>

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

