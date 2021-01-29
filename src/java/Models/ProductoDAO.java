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
import Utils.ConnectionManager;
import java.text.*;
import java.util.*;
import java.sql.*;

public class ProductoDAO 	
{
    static Connection currentCon = null;
    static ResultSet rs = null;  

    public static int Register(ProductoDTO bean){
        Statement stmt=null;
        Statement stmt2=null;
        Statement stmtdni=null;
        Statement stmtalias=null;
        ResultSet rsdni = null;
        ResultSet rsalias = null;
        
        int resultado=0;
        String nombreProducto = bean.getNombreProducto();
        String descripcionProducto = bean.getDescripcionProducto();
        String imagenProducto = bean.getImagenProducto();
        
        String Query= "INSERT INTO `producto `(`nombreProducto`, `descripcionProducto`, `imagenProducto`)"
                + "VALUES ('"+nombreProducto+"','"+descripcionProducto+"','"+imagenProducto+"')";
       //String Query2="INSERT INTO policia SET id_usuarios = (SELECT MAX(`id_usuarios`) FROM `usuarios`), cod_cip = '"+codigoCIP+"' ";

          
        try{
            currentCon=ConnectionManager.getConnection();
            //stmtalias=currentCon.createStatement();
            ///rsalias = stmtalias.executeQuery(Queryalias);

                stmt=currentCon.createStatement();
                stmt.executeUpdate(Query);

                resultado=1;
        }
        catch(Exception ex){
            System.out.println(ex);
            
        }
        
        finally{
            if(rs != null){
                try{
                    rs.close();
                }catch (Exception e){}
                rs=null;
            }
            if(stmt  != null){
                try {
                    stmt.close();
                }catch(Exception e){}
                stmt=null;
            }
            if(currentCon != null){
                try{
                    currentCon.close();
                }catch(Exception e){}
                currentCon=null;
            }
            
        }
        return resultado;
    }
        public static ProductoDTO[] getdatosProducto(){
        
        int posicion = 0;
        ProductoDTO[] obj_producto = null;
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        
        try {

            String sql = "select producto.nombreProducto, producto.descripcionProducto , producto.imagenProducto from producto where producto.nombreProducto <> 'null'";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);

            rs = ps.executeQuery();

            if (rs.last()) {
                int tamanio = rs.getRow();
                obj_producto = new ProductoDTO[tamanio];
                rs.beforeFirst();
            }
            while (rs.next()) {
               ProductoDTO obj_productos = new ProductoDTO();
                obj_productos.setNombreProducto(rs.getString("nombreProducto"));
                obj_productos.setDescripcionProducto(rs.getString("descripcionProducto"));
                obj_productos.setImagenProducto(rs.getString("imagenProducto"));
             

                obj_producto[posicion] = obj_productos;
                
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
        return obj_producto;

    }
    
}