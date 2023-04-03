<%-- 
    Document   : ger_mant
    Created on : 31 mar. 2023, 22:02:20
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
        <link rel="shortcut icon" href="IconoJAYMO.ico">
    </head>
    <body>
        <header>
            <div class="menu">
                <img src="Carita.png" alt="">
                <nav>
                    <ul>
                        <li><a href="index.html">Inicio</a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <%
            try {
                HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
                int idPac = (int) (miSessiondelUsuario.getAttribute("idPer") == null ? 0 : miSessiondelUsuario.getAttribute("idPer"));
                String Nombre = miSessiondelUsuario.getAttribute("UsuarioPac").toString();

                if (idPac < 1) {
                    response.sendRedirect("index.html");
                }

                String alias = "";
                int cont = 0;
                int cont2 = 0;

                Base bd = new Base();
                bd.conectar();
        %>
        <div class="container">
            <div class= "p-5  rounded-3">
                <center><h1><%=Nombre%> es gerente de mantenimiento </h1></center>
            </div>
            <div class="container text-center">
                <div class="row align-items-start">

                    <%
                        String strQry2 = "select * from reportes where estado = '2' and tipo_rep ='2';";
                        ResultSet conex = bd.consulta(strQry2);
                    %>

                    <script>
                        function calabaza(id) {
                            document.getElementById('id').value = id;
                        }
                        ;
                    </script>
                    <div class="col">
                        <h1>
                            por revision 
                        </h1>
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
                                    <form name="Reportes<%=cont%>" method="post" action="act_rep_4.jsp">
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
                                        <button class="btn btn-secondary" id="bt2" onclick="calabaza(<%=id%>)">Enviar</button>
                                        <hr>

                                        <script>
                                            function fechaa() {
                                                document.getElementById('fecha_ac').value = Fecha.toString();
                                                document.getElementById('estado').value = "3";
                                            }
                                            ;
                                            fechaa();
                                        </script>
                                    </form>
                                    <hr>
                                </div>
                                <%
                                } else {%>
                                <div class="centrado mt-3"  id="cont1">
                                    <h6><%=reporte%></h6>
                                </div>
                                <%
                                        }

                                    }
                                %>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <%
                            String strQry3 = "select * from reportes where estado = '4' and tipo_rep ='3';";
                            ResultSet conex2 = bd.consulta(strQry3);
                        %>
                        <h2>completadas</h2>
                        <script>
                            function calabaza(id) {
                                document.getElementById('id').value = id;
                            }
                            ;
                        </script>
                        <%
                            while (conex2.next()) {
                                cont2++;

                                String reporte = conex2.getString(2);
                                int id = conex2.getInt(1);
                                if (cont2 == 1) {
                        %>
                        <div class="centrado">
                            <form name="Reportes<%=cont%>" method="post" action="act_rep_6.jsp">
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
                                <button class="btn btn-secondary" id="bt2" onclick="calabaza(<%=id%>)">Enviar</button>
                                <script>
                                    function fechaa() {
                                        document.getElementById('fecha_ac').value = Fecha.toString();
                                        document.getElementById('tipo').value = "2";
                                    }
                                    ;
                                    fechaa();
                                </script>
                            </form>
                            <hr>
                        </div>
                        <%
                                } else {%>
                        <div class="centrado mt-3"  id="cont1">
                            <h6><%=reporte%></h6>
                        </div>
                        <%
                                }

                            }
                        %>
                    </div>
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
