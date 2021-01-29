package Models;
import Utils.ConnectionManager;
import java.text.*;
import java.util.*;
import java.sql.*;

public class UserDAO {

    static Connection currentCon = null;
    static ResultSet rs = null;

    public static UserDTO login(UserDTO bean) {

        Statement stmt = null;

        String username = bean.getUsername();
        String password = bean.getPassword();

        String searchQuery
                = "SELECT U.nombresEmpleado, U.apellidosEmpleado,U.Cargo_idCargo,U.urlEmpleado,U.idAlmacen FROM `empleado` U where usuarioEmpleado='"
                + username
                + "' AND passwordEmpleado='"
                + password
                + "'";
        try {
            currentCon = ConnectionManager.getConnection();
            stmt = currentCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            bean.setValid(false);
            String nombres = "";
            String apellidos = "";
            String idCargo = "";
            String urlEmpleado= "";
            String idAlmacen= "";
            
            if (rs.last()) {
                int tamanio = rs.getRow();
                if (tamanio > 0) {
                    bean.setValid(true);
                }
                rs.beforeFirst();
            }

            while (rs.next()) {
                nombres = rs.getString("nombresEmpleado");
                apellidos = rs.getString("apellidosEmpleado");
                idCargo = rs.getString("Cargo_idCargo");
                urlEmpleado = rs.getString("urlEmpleado");
                idAlmacen = rs.getString("idAlmacen");

            }
            bean.setNombre(nombres);
            bean.setApellidos(apellidos);
            bean.setIdCargo(idCargo);
            bean.setUrlEmpleado(urlEmpleado);
            bean.setIdAlmacen(idAlmacen);

        } catch (Exception ex) {
            System.out.println("Log In INCORRECTO: " + ex);
        }
        finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
                stmt = null;
            }

            if (currentCon != null) {
                try {
                    currentCon.close();
                } catch (Exception e) {
                }

                currentCon = null;
            }
        }

        return bean;

    }

}
