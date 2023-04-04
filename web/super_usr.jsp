<%-- 
    Document   : super_usr
    Created on : 3 abr. 2023, 22:01:24
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
        <style>
            .tabla{
                height: 200px;
                /*border: 1px solid gainsboro;*/
            }
            .pinpon{
                width: 100%;
                height: 100%;
            }
            .limpio {
                text-decoration: none;
                color: black;
            }
            .lista {
                display: flex;
                flex-direction: column;
                align-items: center;
            }
        </style>
    </head>
    <body>
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
        <header>
            <div class="menu">
                <img src="Carita.png" alt="">
                <nav>
                    <ul>
                        <li><a href="index.html">Inicio</a></li>
                    </ul>
                    <ul>
                        <li></li>
                    </ul>
                </nav>
            </div>
        </header>
        <div class="container p-4">
            <div class="container text-center">
                <div class="row">
                    <div class="col tabla">
                        <a href="ger_mant.jsp" class="limpio">
                            <div class="pinpon lista">
                                <img src="https://cdn-icons-png.flaticon.com/512/1086/1086581.png">
                                <h3>Gerente de mantenimiento</h3>
                            </div>
                        </a>
                    </div>
                    <div class="col tabla"><a href="ger_sop.jsp" class="limpio">
                        <div class="pinpon lista">
                                <img src="https://cdn-icons-png.flaticon.com/512/2471/2471121.png">
                                <h3>Gerente de soporte</h3>
                            </div>
                        </a></div>
                </div>
                <div class="row">
                    <div class="col tabla"><a href="ing_mant.jsp" class="limpio">
                           <div class="pinpon lista">
                                <img src="https://cdn-icons-png.flaticon.com/512/949/949946.png">
                                <h3>Ingeniero de mantenimiento</h3>
                            </div>
                        </a></div>
                    <div class="col tabla"><a href="asistente.jsp" class="limpio">
                        <div class="pinpon lista">
                                <img src="https://cdn-icons-png.flaticon.com/512/4519/4519678.png">
                                <h3>Asistente</h3>
                            </div>
                        </a></div>
                    <div class="col tabla"><a href="ing_sop.jsp" class="limpio">
                            <div class="pinpon lista">
                                <img src="https://cdn-icons-png.flaticon.com/512/1321/1321688.png">
                                <h3>Ingeniero de soporte</h3>
                            </div>
                        </a></div>
                </div>
            </div>
        </div>
        <%
                } catch (Exception ex) {
        
            }
        
        %>
    </body>
</html>
