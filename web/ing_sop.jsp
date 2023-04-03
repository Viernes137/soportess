<%-- 
    Document   : ing_sop
    Created on : 31 mar. 2023, 22:02:32
    Author     : bruno fragoso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

        Base bd = new Base();
        bd.conectar();
                        String strQry2 = "select * from reportes where estado = '3';";
                        ResultSet conex = bd.consulta(strQry2);
                            
                        while(conex.next()){
                        cont++;
                            
                        String reporte = conex.getString(2);
                        int id = conex.getInt(1);
                            
        %>
        <div class="container">
            <div>
                <h1><%=Nombre%>, su rol es asisitente sisi</h1>
            </div>
        <div class="centrado">
            <form name="Reportes<%=cont%>" method="post" action="act_rep_2.jsp">
                <script>
                    var fecha = new Date();
                    var Fecha = (fecha.getFullYear()+"-"+(fecha.getMonth()+1)+"-"+fecha.getDate() + " " + fecha.getHours() + ":" + fecha.getMinutes() + ":" + fecha.getSeconds());
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
                <button type="submit" class="btn btn-primary">Enviar</button>

                <script>
                    function fechaa() {
                        document.getElementById('id').value =<%=id%> ;
                        document.getElementById('fecha_ac').value = Fecha.toString();
                        document.getElementById('estado').value = "2";
                    }
                    ;
                    fechaa();
                </script>
            </form>
            <hr>
        </div>
        <%
            }
        %>
        
        
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
        </div>
    </body>
</html>
