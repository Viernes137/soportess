<%-- 
    Document   : registro
    Created on : 31 mar. 2023, 21:04:07
    Author     : ldrnts
--%>

<%@page import="conexion.Base"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page1</title>
    </head>
    <body>
        <div id="cosaa"> 
            <!-- aca falta poner todos los datos que se van a mandar desde la base de datos en la cosas de mete_datoss -->
            <div id="cosab" class="e">
                <h1>Tus Datos</h1>
                <%
                    String varnomb_usuer = request.getParameter("nombre");
                    String varemail = request.getParameter("correo");
                    String varpass = request.getParameter("pass");
                    String vartipo = request.getParameter("tipo");
                    
                    if (!varnomb_usuer.equals("") && !varemail.equals("") && !varpass.equals("")&& !vartipo.equals("")) {
                    
                        //se valida que tengan datos los campos
                        //guardamos en la base de datos
                        Base bd = new Base();
                        try {
                            bd.conectar();
                            String strQry = "insert into usuario(nom_usr,password_pac,correo_usr,tipo_usr) values ('" + varnomb_usuer + "','" + varpass + "','" + varemail + "','" + vartipo + "');";
                            out.print(strQry);

                            int resultadoInsert = bd.insertar(strQry);
                            out.print("Checar resultado de la base " + resultadoInsert);
                            response.sendRedirect("index.html");
                %>
                <h1>El usuario ha sido registrado exitosamente</h1>
                <%
                        } catch (Exception ex) {
                            out.print("Los datos no se ingresaron correctamente, porfavor corriga el codigo ");
                        }
                    }

                %>
                <br>
                <p class="z">
                    <label>Nombre: <% out.println(varnomb_usuer); %></label><br>
                    <label>tipo: <% out.println(vartipo); %></label><br>
                    <label>correo: <% out.println(varemail); %></label><br>
                    <label>pass <% out.println(varpass);%></label><br>

            </div>
        </div>      
    </body>
</html>
