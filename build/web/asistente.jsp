<%-- 
    Document   : asistente
    Created on : 31 mar. 2023, 22:01:49
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
        <script>
            var fecha = new Date();
            var Fecha = (fecha.getFullYear() + "-" + (fecha.getMonth() + 1) + "-" + fecha.getDate() + " " + fecha.getHours() + ":" + fecha.getMinutes() + ":" + fecha.getSeconds());
        </script>
        <div class="container">
            <div>
                <h1><%=Nombre%>, su rol es asisitente sisi</h1>
            </div>
            <div class="centrado">
                <form name="Reportes" method="post" action="reg_rep.jsp">
                    <div class="mb-3">
                        <label for="reporte" class="form-label">reporte</label>
                        <input type="text" class="form-control" id="reporte" name="reporte" aria-describedby="emailHelp">
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
                        <label for="fecha_in" class="form-label"></label>
                        <input type="text" class="form-control" id="fecha_in" name="fecha_in" aria-describedby="emailHelp">
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
                            document.getElementById('fecha_in').value = Fecha.toString();
                            document.getElementById('fecha_ac').value = Fecha.toString();
                            document.getElementById('estado').value = "1";
                        };
                        defdatos();
                    </script>

                    <button type="submit" class="btn btn-primary">Subir</button>
                </form>
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
