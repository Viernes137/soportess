<%-- 
    Document   : act_rep_3
    Created on : 2 abr. 2023, 19:11:41
    Author     : ldrnts
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
        String estado = request.getParameter("estado");
        String fecha_ac =request.getParameter("fecha_ac");
        String respuesta = request.getParameter("resp");
        String id = request.getParameter("id");
        
        String msj = "";
        Base bd = new Base();
        bd.conectar();
        try{
            String strQry = "update reportes set estado = '"+estado+"', resp= '"+respuesta+"',fecha_ac='"+fecha_ac+"' where id_rep ='"+id+"';";
            out.print(strQry);
            int resultadoInsert = bd.insertar(strQry);
            msj="Se envio al area correspondeinte correctamente";
            }
        catch (Exception ex) { 
            msj="no se pudo concretar";
            }

        %>
        <script>
            var patadepollo = confirm("<%=msj%>");
            if (patadepollo == true) {
                location.href = 'ing_sop.jsp';
            } else {
                location.href = 'ing_sop.jsp';
            }
        </script>
        <h1>a<%=id%></h1>
    </body>
</html>
