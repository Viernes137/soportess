<%-- 
    Document   : validarusr
    Created on : 31 mar. 2023, 21:39:12
    Author     : bruno fragoso
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="conexion.Base"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <%
            String usr = request.getParameter("TxtUsr");
            String pswd = request.getParameter("TxtPsw");
            String msj="";

            if (usr == null) {
                usr = "0";
            } else {
                if (usr.equals("")) {
                    usr = "0";
                }
            }

            if (pswd == null) {
                pswd = "0";
            } else {
                if (pswd.equals("")) {
                    pswd = "0";
                }
            }

            if (!usr.equals("0") && !pswd.equals("0")) {

                Base bd = new Base();
                bd.conectar();
                
                String strQry = "select * from usuario where correo_usr='" + usr + "' and password_pac='" + pswd + "'";
                ResultSet rsValidarUsr = bd.consulta(strQry);

                if (rsValidarUsr.next()) {
                    HttpSession miSessiondelUsuario = (HttpSession) request.getSession();
                    int idPersona = rsValidarUsr.getInt("id_usr");
                    String nombre = rsValidarUsr.getString("nom_usr");
                    int tipo = rsValidarUsr.getInt("tipo_usr");
                    
                    miSessiondelUsuario.setAttribute("tipoUsr", tipo);
                    miSessiondelUsuario.setAttribute("UsuarioPac", nombre);
                    miSessiondelUsuario.setAttribute("idPer", idPersona);
                    
                    
                    
                    switch (tipo) {
                    case 1:
                        msj="el tipo de usuario es"+tipo;
                        response.sendRedirect("asistente.jsp");
                        break;
                    case 2:
                        msj="el tipo de usuario es"+tipo;
                        response.sendRedirect("ger_sop.jsp");
                        break;
                    case 3:
                        msj="el tipo de usuario es"+tipo;
                        response.sendRedirect("ger_mant.jsp");
                        break;
                    case 4:
                        msj="el tipo de usuario es"+tipo;
                        response.sendRedirect("ing_sop.jsp");
                        break;
                    case 5:
                        msj="el tipo de usuario es"+tipo;
                        response.sendRedirect("ing_mant.jsp");
                        break;
                    default:
                        msj="andas valiendo verga uwu ";
                        break;
                    }
                    
                    //response.sendRedirect("paciente/principal_p.jsp");

                } 
                else {
                    msj="Este nombre de usuario, o la contraseña, no han sido registrados, favor de buscar ";
                    
                }
            } else {
                msj="Porfavor rellene los campos que dejo vacio.";
            }

        %>
    </head>
    <body>
        <script>
            var patadepollo = confirm("<%=msj%>");
            if (patadepollo == true) {
                location.href = 'index.html';
            } else {
                location.href = 'index.html';
            }

        </script>
    </body>
</html>
