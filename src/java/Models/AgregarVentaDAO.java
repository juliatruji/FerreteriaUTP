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

public class AgregarVentaDAO 	
{
    static Connection currentCon = null;
    static ResultSet rs = null;  

    
    public static JSONObject obtenerDatosClienteNatural(String numero) {
        JSONObject json = new JSONObject();
        
        int posicion = 0;
        ClienteNaturalDTO[] obj_clienteNatural = null;
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        
        try {
//            String sql = "SELECT multas.ubicacion, multas.lugar FROM multas,conductores WHERE multas.id_conductor=conductores.id_conductor AND conductores.dni='"+prm_mimulta.getDni()+"'";
            String sql = "select cliente.nombresCliente, cliente.idCliente, cliente.apellidosCliente , cliente.dniCliente,cliente.telefonoCliente, cliente.direccionCliente, cliente.emailCliente,cliente.urlCliente from cliente where cliente.dniCliente ="+ numero +"";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                json.put("status", 200);
                json.put("idCliente", rs.getString("idCliente"));
                json.put("nombresCliente", rs.getString("nombresCliente"));
                json.put("apellidosCliente", rs.getString("apellidosCliente"));
                json.put("dniCliente", rs.getString("dniCliente"));
                json.put("telefonoCliente", rs.getString("telefonoCliente"));
                json.put("direccionCliente", rs.getString("direccionCliente"));
                json.put("emailCliente", rs.getString("emailCliente"));
                json.put("urlCliente", rs.getString("urlCliente"));
            }
            else {
                json.put("status", 404);
                json.put("message", "No se encontró");
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
    
    public static JSONObject obtenerDatosClienteEmpresa(String numero) {
        JSONObject json = new JSONObject();

        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        
        try {
//            String sql = "SELECT multas.ubicacion, multas.lugar FROM multas,conductores WHERE multas.id_conductor=conductores.id_conductor AND conductores.dni='"+prm_mimulta.getDni()+"'";
            String sql = "select cliente.razonCliente, cliente.idCliente, cliente.rucCliente , cliente.telefonoCliente, cliente.direccionCliente, cliente.emailCliente,cliente.urlCliente from cliente where cliente.rucCliente ="+ numero +"";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                json.put("status", 200);
                json.put("idCliente", rs.getString("idCliente"));
                json.put("razonCliente", rs.getString("razonCliente"));
                json.put("rucCliente", rs.getString("rucCliente"));
                json.put("telefonoCliente", rs.getString("telefonoCliente"));
                json.put("direccionCliente", rs.getString("direccionCliente"));
                json.put("emailCliente", rs.getString("emailCliente"));
                json.put("urlCliente", rs.getString("urlCliente"));
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

    public static JSONObject obtenerProductoAlmacen(String codProducto, String idalmacen) {
        JSONObject json = new JSONObject();
        
            Connection cn = null;
            ResultSet rs = null;
            PreparedStatement ps = null;

        
        try {        
            String sql = "select stock.precioVentaStock, producto.nombreProducto from stock\n" +
            "inner join producto on producto.idProducto=stock.Producto_idProducto where stock.idStock ="+ codProducto +"";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                json.put("status", 200);
                 json.put("descripcionProducto", rs.getString("nombreProducto"));
                 json.put("precioProducto", rs.getDouble("precioVentaStock"));
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

    public static JSONObject agregarVenta(String ventaCompleta) {
        
        JSONObject json = new JSONObject();
        JSONObject jsonVenta = new JSONObject();
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        Statement stmt=null;

        int idClienteRegistrado=0;
        int idComprobante=0;
        
        try {
             jsonVenta = new JSONObject(ventaCompleta);
             
             //inicio get idcliente
             if (jsonVenta.getString("Cliente_idCliente").equals("")) {
                 
               String sql = "select max(idCliente) from cliente";
                cn = ConnectionManager.getConnection();
                ps = cn.prepareStatement(sql);
                rs = ps.executeQuery(); 
                if (rs.next()) {
                    idClienteRegistrado=rs.getInt(1);
                }
            }
             else{
                idClienteRegistrado=jsonVenta.getInt("idCliente");
             }
             json.put("status", 200);
             
             
        }catch (JSONException err){
        } catch (SQLException ex) {
            Logger.getLogger(AgregarVentaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        try {
            String Query= "INSERT INTO `comprobante`(`tipoComprobante`, `fechaComprobante`, `horaComprobante`,`totalComprobante`,`pagadoComprobante`,`Cliente_idCliente`,`idAlmacen`)"
                + "VALUES ('"+jsonVenta.getString("tipoComprobante")+"','"+jsonVenta.getString("fechaComprobante")+"','"+jsonVenta.getString("horaComprobante")+"','"+jsonVenta.getDouble("totalComprobante")+"','"+jsonVenta.getInt("pagadoComprobante")+"','"+jsonVenta.getString("Cliente_idCliente")+"','"+jsonVenta.getString("idAlmacen")+"')";
            currentCon=ConnectionManager.getConnection();
            stmt=currentCon.createStatement();
            stmt.executeUpdate(Query);
            
            String sql = "select max(idComprobante) from comprobante";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery(); 
            if (rs.next()) {
                idComprobante=rs.getInt(1);
            }

                
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(AgregarVentaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            JSONArray arrayprod = jsonVenta.getJSONArray("arrayProductos");
            for (int i = 0; i < arrayprod.length(); i++) {

                int cantidadProducto = arrayprod.getJSONObject(i).getInt("cantidadProducto");
                double importeVenta = arrayprod.getJSONObject(i).getDouble("importeVenta");
                int Comprobante_idComprobante = idComprobante;
                int Stock_idStock = arrayprod.getJSONObject(i).getInt("Stock_idStock");

                String Query= "INSERT INTO `venta`(`cantidadProducto`, `importeVenta`, `Comprobante_idComprobante`,`Stock_idStock`)"
                    + "VALUES ('"+cantidadProducto+"','"+importeVenta+"','"+Comprobante_idComprobante+"','"+Stock_idStock+"')";
                currentCon=ConnectionManager.getConnection();
                stmt=currentCon.createStatement();
                stmt.executeUpdate(Query);
                
                
            }
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(AgregarVentaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

 
    return json;  
}}