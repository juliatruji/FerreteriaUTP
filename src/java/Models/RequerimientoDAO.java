package Models;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author vicente
 */
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

public class RequerimientoDAO 	
{
    static Connection currentCon = null;
    static ResultSet rs = null;  


    public static JSONObject obtenerProducto(String codProducto) {
        JSONObject json = new JSONObject();
        
            Connection cn = null;
            ResultSet rs = null;
            PreparedStatement ps = null;

        
        try {        
            String sql = "select producto.nombreProducto from producto\n" +
            "where producto.idProducto ="+ codProducto +"";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                json.put("status", 200);
                 json.put("descripcionProducto", rs.getString("nombreProducto"));
                 
            }
            else {
                json.put("status", 404);
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
        return json;
        
    }

    public static JSONObject agregarRequerimiento(String ventaCompleta) {
        
        JSONObject json = new JSONObject();
        JSONObject jsonVenta = new JSONObject();
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Statement stmt=null;

        int idClienteRegistrado=0;
        int idRequerimiento=0;
        
        try {
             jsonVenta = new JSONObject(ventaCompleta);
          }catch (JSONException err){
          }
        
        try {
            jsonVenta = new JSONObject(ventaCompleta);
            String Query= "INSERT INTO `requerimiento`(`fechaRequerimiento`, `horaRequerimiento`, `completadoRequerimiento`, `Almacen_idAlmacen`)"
                + "VALUES ('"+jsonVenta.getString("fechaRequerimiento")+"','"+jsonVenta.getString("horaRequerimiento")+"','"+jsonVenta.getInt("completadoRequerimiento")+"','"+jsonVenta.getString("Almacen_idAlmacen")+"')";
            currentCon=ConnectionManager.getConnection();
            stmt=currentCon.createStatement();
            stmt.executeUpdate(Query);
            
            
            String sql = "select max(idRequerimiento) from requerimiento";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery(); 
            if (rs.next()) {
                idRequerimiento=rs.getInt(1);
            }

                
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(AgregarVentaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            JSONArray arrayprod = jsonVenta.getJSONArray("arrayProductos");
            for (int i = 0; i < arrayprod.length(); i++) {

                int cantidadItemRequerimiento = arrayprod.getJSONObject(i).getInt("cantidadItemRequerimiento");
                int Producto_idProducto = arrayprod.getJSONObject(i).getInt("Producto_idProducto");

                String Query= "INSERT INTO `itemRequerimiento`(`cantidadItemRequerimiento`, `Producto_idProducto`, `Requerimiento_idRequerimiento`)"
                    + "VALUES ('"+cantidadItemRequerimiento+"','"+Producto_idProducto+"','"+idRequerimiento+"')";
                currentCon=ConnectionManager.getConnection();
                stmt=currentCon.createStatement();
                stmt.executeUpdate(Query);

                
                
            }
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(AgregarVentaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

 
    return json;  
}
    public static RequerimientoDTO[] getdatosRequerimiento(){
     int posicion = 0;
        RequerimientoDTO[] obj_requerimiento = null;
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;

        try {

            String sql = "select requerimiento.fechaRequerimiento, requerimiento.idRequerimiento, requerimiento.horaRequerimiento,  almacen.nombreAlmacen "
                    + "from requerimiento "
                    + "inner join almacen on almacen.idAlmacen=requerimiento.Almacen_idAlmacen where requerimiento.idRequerimiento <> 'null'";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);

            rs = ps.executeQuery();

            if (rs.last()) {
                int tamanio = rs.getRow();
                obj_requerimiento = new RequerimientoDTO[tamanio];
                rs.beforeFirst();
            }
            while (rs.next()) {
               RequerimientoDTO obj_Requerimientos = new RequerimientoDTO();
                obj_Requerimientos.setNombreAlmacen(rs.getString("nombreAlmacen"));
                obj_Requerimientos.setFechaRequerimiento(rs.getDate("fechaRequerimiento"));
                obj_Requerimientos.setHoraRequerimiento(rs.getDate("horaRequerimiento"));
                obj_Requerimientos.setIdRequerimiento(rs.getInt("idRequerimiento"));
             
                obj_requerimiento[posicion] = obj_Requerimientos;
                
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
        return obj_requerimiento;

    } 

    public static RequerimientoDTO getdatosRequerimientoDetalle(String id) {
        RequerimientoDTO requerimiento = new RequerimientoDTO();
        
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        
        try {
//            String sql = "SELECT multas.ubicacion, multas.lugar FROM multas,conductores WHERE multas.id_conductor=conductores.id_conductor AND conductores.dni='"+prm_mimulta.getDni()+"'";
            String sql = "select itemrequerimiento.cantidadItemRequerimiento, producto.nombreProducto, producto.idProducto "
                    + "from itemrequerimiento "
                    + "inner join producto on producto.idProducto=itemrequerimiento.Producto_idProducto where itemrequerimiento.Requerimiento_idRequerimiento ="+ id +"";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            List<ItemRequerimientoDTO> itemsarray = new ArrayList<>();
            
            while (rs.next()) {
    
                ItemRequerimientoDTO itemReq = new ItemRequerimientoDTO();
                itemReq.setNombreProducto(rs.getString("nombreProducto"));
                itemReq.setCantidadItemRequerimiento(rs.getInt("cantidadItemRequerimiento"));
                itemReq.setProducto_idProducto(rs.getInt("idProducto"));

                itemsarray.add(itemReq);

            }
            requerimiento.setProductos(itemsarray);
            
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
    
    
        return requerimiento;
        
        
    }
}
