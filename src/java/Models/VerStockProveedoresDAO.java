/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Utils.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Usuario
 */
public class VerStockProveedoresDAO {
    static Connection currentCon = null;
    static ResultSet rs = null; 
    
    public static List<VerStockProveedoresDTO> getdatosStockProveedor(int idProducto){
        
        List<VerStockProveedoresDTO> objStockProveedores = new ArrayList<>();
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;

        try {

            String sql = "select stockprovee.precioVentaProvee, stockprovee.cantidadStockProvee, producto.nombreProducto,  proveedor.razonProveedor "
                    + "from stockprovee "
                    + "inner join producto on producto.idProducto=stockprovee.Producto_idProducto "
                    + "inner join proveedor on proveedor.idProveedor=stockprovee.Proveedor_idProveedor "
                    + "where Producto_idProducto= "+ idProducto +"";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);

            rs = ps.executeQuery();

            while (rs.next()) {
               VerStockProveedoresDTO obj_Proveedor = new VerStockProveedoresDTO();
                obj_Proveedor.setNombreProveedor(rs.getString("razonProveedor"));
                obj_Proveedor.setCantidadStockProvee(rs.getInt("cantidadStockProvee"));
                obj_Proveedor.setPrecioVentaProvee(rs.getDouble("precioVentaProvee"));
                obj_Proveedor.setNombreProducto(rs.getString("nombreProducto"));
                objStockProveedores.add(obj_Proveedor);

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
        return objStockProveedores;

    } 
    
}
