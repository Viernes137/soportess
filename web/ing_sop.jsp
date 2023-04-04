<%-- 
    Document   : ing_sop
    Created on : 31 mar. 2023, 22:02:32
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
                <center><h1><%=Nombre%> es Ingeniero de Soporte</h1></center>
            </div>
            <script>
                function calabaza(id) {
                    document.getElementById('id').value = id;
                }
                ;
            </script>
            <div class="container text-center">
                <div class="row align-items-start">
                    <div  class="col">
                        <h1>Recibidas</h1>

                        <div>
                            <%
                                String strQry2 = "select * from reportes where tipo_rep = '1' and (resp is null or resp = '') and estado ='2';";
                                ResultSet conex = bd.consulta(strQry2);
                                while (conex.next()) {
                                    cont++;

                                    String reporte = conex.getString(2);
                                    int id = conex.getInt(1);
                                    if (cont == 1) {
                            %>
                            <div class="centrado">
                                <form name="lalala" id="lalala" method="post" action="act_rep_3.jsp">
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
                                    <div class="mb-3">
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
                                    <!--<button type="submit" class="btn btn-primary">Enviar</button>-->
                                    <button class="btn btn-secondary" type="submit" id="bt2" onclick="calabaza(<%=id%>)">Enviar</button>
                                    <script>
                                        function fechaa() {
                                            document.getElementById('fecha_ac').value = Fecha.toString();
                                            document.getElementById('estado').value = "5";
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
                                continue;
                                    }

                                }
                            %>
                        </div>
                    </div>

                    <div  class="col">
                        <h3>Pendientes de revison desde mantenimiento</h3> 

                        <div>
                            <script>
                                    function calabazas(id) {
                                        document.getElementById('idm').value = id;
                                    }
                                    ;
                                </script>
                            <%
                                int bndra = 0;
                                String string1 = "select * from reportes where estado = '7';";
                                ResultSet setdresult = bd.consulta(string1);
                                while(setdresult.next()){
                            
                                    bndra++;
                                    String reporte = setdresult.getString(2);
                                    String fecha = setdresult.getString(6);
                                    String respuesta = setdresult.getString(4);
                                    int id = setdresult.getInt(1);
                                
                                if(bndra==1){
                            %>
                            
                            <div class="centrado">
                            <form name="formularionumerodos" id="formularionumerodos" method="post" action="act_rep_8.jsp">
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
                                <button class="btn btn-secondary" type="submit" onclick="calabazas(<%=id%>)" >finalizar reporte</button>
                                <hr>
                                <script>
                                    function fechaa() {
                                        document.getElementById('fecha_acm').value = Fecha.toString();
                                        document.getElementById('estadom').value = "5";
                                        document.getElementById('tipom').value = "2";
                                    }
                                    ;
                                    fechaa();
                                </script>
                            </form>
                        </div>

                            <%
                    } else {
                            %>
                            <div class="centrado mt-3"  id="cont2">
                                <h6><%=reporte%></h6>
                            </div>
                            <%
                              continue;
                                }
                              }
                            %>
                        </div>
                    </div>
                    <div  class="col">
                        <h1>completadas</h1>

                        <div>
                            <%
                                  String strQry6 = "select * from reportes where estado = '5';";
                                  ResultSet conex5 = bd.consulta(strQry6);
                                  while (conex5.next()) {
                              
                                      String reporte = conex5.getString(2);
                                      String fecha = conex5.getString(6);
                                      String respuesta = conex5.getString(4);
                                      String fecha2 = conex5.getString(5);

                                      int tipo = conex5.getInt(7);
                                      String tipo_txt = "";
                                      String color = "";

                                      if (tipo == 1) {
                                          tipo_txt = "soporte ";
                                          color = "#6BB822";
                                      } else {
                                          tipo_txt = "mantenimiento ";
                                          color = "#286CCD";
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

        </div>
    </div>
    <%
        } catch (Exception ex) {%>
    <%
        }
    %>

</body>
</html>