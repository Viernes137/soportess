
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Base {

    private String usrBD;
    private String passBD;
    private String urlBD;
    private String driverClassName;
    private Connection conn = null;
    private Statement estancia;


public Base(){
    
    //agregar datos para conectarse
   this.usrBD = "root";
   this.passBD = "246810";
   this.urlBD = "jdbc:mysql://localhost:3306/hipopotamo";
   this.driverClassName = "com.mysql.jdbc.Driver";//inicializar driver
}

    //metodos para establecer los valores de conexion a la BD
    public String getUsrBD() throws SQLException{
        return usrBD;
    }

    public void setUsrBD(String usrBD) {
        this.usrBD = usrBD;
    }

    public String getPassBD() {
        return passBD;
    }

    public void setPassBD(String passBD) {
        this.passBD = passBD;
    }

    public String getUrlBD() {
        return urlBD;
    }

    public void setUrlBD(String urlBD) {
        this.urlBD = urlBD;
    }

    public String getDriverClassName() {
        return driverClassName;
    }

    public void setDriverClassName(String driverClassName) {
        this.driverClassName = driverClassName;
    }

    public Connection getConn() {
        return conn;
    }
    public void setConn(Connection conn) {
        this.conn = conn;
    }
    
    //conexion a la BD
    public void conectar() throws SQLException{
        try {
            Class.forName(this.driverClassName).newInstance();
            this.conn = DriverManager.getConnection(this.urlBD, this.usrBD, this.passBD);
            
        }
        catch (Exception err) {
            System.out.println("Error "+ err.getMessage());
        }
    }
    
    //cerrar la conexion de BD
    public void cierraConexion() throws SQLException{
        this.conn.close();
    }
    
    //metodos para ejecutar sentencias SQL
    public int insertar(String inserta) throws SQLException {
        Statement st = (Statement) this.conn.createStatement();
        return st.executeUpdate(inserta);
    }
    
    public ResultSet consulta(String consulta) throws SQLException{
        this.estancia = (Statement) conn.createStatement();
        return this.estancia.executeQuery(consulta);
    }

    public int borrar(String borra) throws SQLException{
        Statement st = (Statement) this.conn.createStatement();
        return st.executeUpdate(borra);
    }
    public int edita(String editar) throws SQLException{
        Statement st = (Statement) this.conn.createStatement();
        return st.executeUpdate(editar);
    }
}




/*

    public void setUsrBD(String usrBD) throws SQLException {
        this.usrBD = usrBD;
    }

    public void setPassBD(String pass) {
        this.passBD = pass;
    }

    public void setUrlBD(String url) {
        this.urlBD = url;
    }

    public void setDriverClassName(String driverClassName) {
        this.driverClassName = driverClassName;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }
    
    //conexion a la BD
    public void conectar() throws SQLException{
        try {
            Class.forName(this.driverClassName).newInstance();
            this.conn = DriverManager.getConnection(this.urlBD, this.usrBD, this.passBD);
            
        }
        catch (Exception err) {
            System.out.println("Error "+ err.getMessage());
        }
    }
    
    //cerrar la conexion de BD
    public void cierraConexion() throws SQLException{
        this.conn.close();
    }
    
    //metodos para ejecutar sentencias SQL
    public int insertar(String inserta) throws SQLException {
        Statement st = (Statement) this.conn.createStatement();
        return st.executeUpdate(inserta);
    }
}
*/