<%-- 
    Document   : act_rep_8
    Created on : 3 abr. 2023, 21:25:33
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
        String estado = request.getParameter("estadom");
        String fecha_ac =request.getParameter("fecha_acm");
        String id = request.getParameter("idm");
        String tipo_rep = request.getParameter("tipom");
        
        String msj = "";
        Base bd = new Base();
        bd.conectar();
        try{
            String strQry = "update reportes set estado = '" + estado + "' , fecha_ac='"+fecha_ac+"', tipo_rep='"+tipo_rep+"' where id_rep ='"+id+"';";
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
        <h1><%=estado%></h1>
        <h1><%=fecha_ac%></h1>
        <h1><%=id%></h1>
    </body>
</html>
