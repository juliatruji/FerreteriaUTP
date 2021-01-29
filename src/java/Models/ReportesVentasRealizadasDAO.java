package Models;

import static Models.ClienteEmpresaDAO.currentCon;
import Utils.ConnectionManager;
import java.text.*;
import java.util.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import jdk.nashorn.internal.parser.JSONParser;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ReportesVentasRealizadasDAO	
{
    static Connection currentCon = null;
    static ResultSet rs = null;  


    public static ReportesVentasRealizadasDTO[] getdatosReportesVentas(){
     int posicion = 0;
        ReportesVentasRealizadasDTO[] obj_reportes = null;
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;

        try {

            String sql = "select comprobante.tipoComprobante, comprobante.fechaComprobante, comprobante.horaComprobante,  comprobante.totalComprobante, comprobante.pagadoComprobante, "
                    + "cliente.emailCliente, almacen.nombreAlmacen "
                    + "from comprobante "
                    + "inner join almacen on almacen.idAlmacen=comprobante.idAlmacen "
                    + "inner join cliente on cliente.idCliente=Cliente_idCliente ";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);

            rs = ps.executeQuery();

            if (rs.last()) {
                int tamanio = rs.getRow();
                obj_reportes = new ReportesVentasRealizadasDTO[tamanio];
                rs.beforeFirst();
            }
            while (rs.next()) {
               ReportesVentasRealizadasDTO obj_reportee = new ReportesVentasRealizadasDTO();
                obj_reportee.setTipoComprobante(rs.getString("tipoComprobante"));
                obj_reportee.setFechaComprobante(rs.getDate("fechaComprobante"));
                obj_reportee.setHora(rs.getDate("horaComprobante"));
                obj_reportee.setTotalComprobante(rs.getDouble("totalComprobante"));
                obj_reportee.setEstado(rs.getInt("pagadoComprobante"));
                obj_reportee.setNombreCliente(rs.getString("emailCliente"));
                obj_reportee.setNombreAlmacen(rs.getString("nombreAlmacen"));
             
                obj_reportes[posicion] = obj_reportee;
                
                posicion++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return obj_reportes;

    } 

}
