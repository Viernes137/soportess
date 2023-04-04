<%-- 
    Document   : ing_mant
    Created on : 31 mar. 2023, 22:02:43
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
        <link href="uvauvahuata/css2.css" rel="stylesheet">
        <link rel="shortcut icon" href="IconoJAYMO.ico">
    </head>
    <body>
        <%
            try {
                HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
                int idPac = (int) (miSessiondelUsuario.getAttribute("idPer") == null ? 0 : miSessiondelUsuario.getAttribute("idPer"));
                String Nombre = miSessiondelUsuario.getAttribute("UsuarioPac").toString();
                int tipous = (int)(miSessiondelUsuario.getAttribute("tipoUsr"));

                if (idPac < 1) {
                    response.sendRedirect("index.html");
                }

                String alias = "";
                int cont = 0;

                Base bd = new Base();
                bd.conectar();
                String strQry2 = "select * from reportes where estado = '3' and tipo_rep ='2';";
                ResultSet conex = bd.consulta(strQry2);


        %>
         <header>
            <div class="menu">
                <img src="Carita.png" alt="">
                <nav>
                    <ul>
           <%     
            if(tipous==6){ 
           %>   
        <li><a href="super_usr.jsp">regresar</a></li>
        <%
            }else{
        %>
        <li><a href="index.html">Inicio</a></li>
        <%   
            }
        %>    
                    </ul>
                </nav>
            </div>
        </header>
        <div class="container">
            <div class="p-5  rounded-3">
                <center><h1><%=Nombre%> es ingeniero de mantenimiento </h1></center>
            </div>
            <script>
                function calabaza(id) {
                    document.getElementById('id').value = id;
                }
                ;
            </script>
            <div class="centrado">
                <div>
                    <%
                        while (conex.next()) {
                            cont++;

                            String reporte = conex.getString(2);
                            int id = conex.getInt(1);
                            if (cont == 1) {
                    %>
                    <div class="centrado">
                        <form name="Reportes<%=cont%>" method="post" action="act_rep_5.jsp">
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
                            <div class="mb-3 ">
                                <label for="resp" class="form-label">respuesta</label>
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
                            <button class="btn btn-secondary" id="bt2" onclick="calabaza(<%=id%>)">solucion programado</button>
                            <hr>

                            <script>
                                function fechaa() {
                                    document.getElementById('fecha_ac').value = Fecha.toString();
                                    document.getElementById('estado').value = "4";
                                    document.getElementById('tipo').value = "3";
                                }
                                ;
                                fechaa();
                            </script>
                        </form>
                        <hr>
                    </div>
                    <%
                    } else {%>
                    <div class="centrado mt-3"  id="cont2">
                        <h6><%=reporte%></h6>

                    </div>
                    <%
                            }

                        }
                    %>
                </div>
            </div>
        </div>
        <%
        } catch (Exception ex) {%>
        <%
            }
        %>

    </body>
</html>
