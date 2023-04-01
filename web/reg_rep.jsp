<%-- 
    Document   : reg_rep
    Created on : 31 mar. 2023, 23:19:59
    Author     : bruno fragoso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="conexion.Base"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String reporte = request.getParameter("reporte");
        String estado = request.getParameter("estado");
        String fecha_in = request.getParameter("fecha_in");
        String fecha_ac =request.getParameter("fecha_ac");
        String msj = "";
        Base bd = new Base();
        bd.conectar();
        try{
            String strQry = "insert into reportes(report,estado,fecha_in,fecha_ac) values ('" + reporte + "','" + estado + "','" + fecha_in + "','" + fecha_ac + "');";
            out.print(strQry);
            int resultadoInsert = bd.insertar(strQry);
            msj="Su reporte fue enviado correctamente";
            }
        catch (Exception ex) { 
            msj="Su reporte no se pudo concretar";
            }

        %>
        <script>
            var patadepollo = confirm("<%=msj%>");
            if (patadepollo == true) {
                location.href = 'asistente.jsp';
            } else {
                location.href = 'asistente.jsp';
            }
        </script>
       
    </body>
</html>
