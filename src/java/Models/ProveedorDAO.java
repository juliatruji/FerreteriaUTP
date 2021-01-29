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

public class ProveedorDAO 	
{
    static Connection currentCon = null;
    static ResultSet rs = null;  

    public static int Register(ProveedorDTO bean){
        Statement stmt=null;
        Statement stmt2=null;
        Statement stmtdni=null;
        Statement stmtalias=null;
        ResultSet rsdni = null;
        ResultSet rsalias = null;
        
        int resultado=0;
        String razonProveedor = bean.getRazonProveedor();
        String rucProveedor = bean.getRucProveedor();
        String telefonoProveedor = bean.getTelefonoProveedor();
        String direccionProveedor = bean.getDireccionProveedor();
        String urlProveedor = bean.getUrlProveedor();
        
        String Query= "INSERT INTO `proveedor`(`razonProveedor`, `rucProveedor`, `telefonoProveedor`, `direccionProveedor`, `urlProveedor`)"
                + "VALUES ('"+razonProveedor+"','"+rucProveedor+"','"+telefonoProveedor+"','"+direccionProveedor+"','"+urlProveedor+"')";
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
        public static ProveedorDTO[] getdatosProveedor(){
        
        int posicion = 0;
        ProveedorDTO[] obj_proveedor = null;
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        
        try {

            String sql = "select proveedor.razonProveedor, proveedor.rucProveedor , proveedor.telefonoProveedor,proveedor.direccionProveedor, proveedor.urlProveedor from proveedor where proveedor.rucProveedor <> 'null'";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);

            rs = ps.executeQuery();

            if (rs.last()) {
                int tamanio = rs.getRow();
                obj_proveedor = new ProveedorDTO[tamanio];
                rs.beforeFirst();
            }
            while (rs.next()) {
               ProveedorDTO obj_proveedores = new ProveedorDTO();
                obj_proveedores.setRazonProveedor(rs.getString("razonProveedor"));
                obj_proveedores.setRucProveedor(rs.getString("rucProveedor"));
                obj_proveedores.setTelefonoProveedor(rs.getString("telefonoProveedor"));
                obj_proveedores.setDireccionProveedor(rs.getString("direccionProveedor"));
                obj_proveedores.setUrlProveedor(rs.getString("urlProveedor"));
             

                obj_proveedor[posicion] = obj_proveedores;
                
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
        return obj_proveedor;

    }
      
}