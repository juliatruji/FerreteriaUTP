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

public class AlmacenDAO 	
{
    static Connection currentCon = null;
    static ResultSet rs = null;  

    public static int Register(AlmacenDTO bean){
        Statement stmt=null;
        Statement stmt2=null;
        Statement stmtdni=null;
        Statement stmtalias=null;
        ResultSet rsdni = null;
        ResultSet rsalias = null;
        
        int resultado=0;
        String nombreAlmacen = bean.getNombreAlmacen();
        String ubicacionAlmacen = bean.getUbicacionAlmacen();
        String telefonoAlmacen = bean.getTelefonoAlmacen();
        String urlAlmacen = bean.getUrlAlmacen();
        
        String Query= "INSERT INTO `almacen`(`nombreAlmacen`, `ubicacionAlmacen`, `telefonoAlmacen`, `urlAlmacen`)"
                + "VALUES ('"+nombreAlmacen+"','"+ubicacionAlmacen+"','"+telefonoAlmacen+"','"+urlAlmacen+"')";
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
        public static AlmacenDTO[] getdatosAlmacen(){
        
        int posicion = 0;
        AlmacenDTO[] obj_almacen = null;
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        
        try {

            String sql = "select almacen.nombreAlmacen, almacen.ubicacionAlmacen , almacen.telefonoAlmacen,almacen.urlAlmacen from almacen where almacen.nombreAlmacen <> 'null'";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);

            rs = ps.executeQuery();

            if (rs.last()) {
                int tamanio = rs.getRow();
                obj_almacen = new AlmacenDTO[tamanio];
                rs.beforeFirst();
            }
            while (rs.next()) {
               AlmacenDTO obj_almacenes= new AlmacenDTO();
                obj_almacenes.setNombreAlmacen(rs.getString("nombreAlmacen"));
                obj_almacenes.setUbicacionAlmacen(rs.getString("ubicacionAlmacen"));
                obj_almacenes.setTelefonoAlmacen(rs.getString("telefonoAlmacen"));
                obj_almacenes.setUrlAlmacen(rs.getString("urlAlmacen"));
             

                obj_almacen[posicion] = obj_almacenes;
                
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
        return obj_almacen;

    }
      
}