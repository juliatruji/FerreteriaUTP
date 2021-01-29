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

public class ClienteEmpresaDAO 	
{
    static Connection currentCon = null;
    static ResultSet rs = null;  

    public static int Register(ClienteEmpresaDTO bean){
        Statement stmt=null;
        Statement stmt2=null;
        Statement stmtdni=null;
        Statement stmtalias=null;
        ResultSet rsdni = null;
        ResultSet rsalias = null;
        
        int resultado=0;
        String razonCliente = bean.getRazonCliente();
        String rucCliente = bean.getRucCliente();
        String telefonoCliente = bean.getTelefonoCliente();
        String direccionCliente = bean.getDireccionCliente();
        String emailCliente = bean.getEmailCliente();
        String passwordCliente = bean.getPasswordCliente();
        String urlCliente= bean.getUrlCliente();
        String Query= "INSERT INTO `cliente`(`razonCliente`, `rucCliente`, `telefonoCliente`, `direccionCliente`, `emailCliente`,`passwordCliente`,`urlCliente`)"
                + "VALUES ('"+razonCliente+"','"+rucCliente+"','"+telefonoCliente+"','"+direccionCliente+"','"+emailCliente+"','"+passwordCliente+"','"+urlCliente+"')";
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
    public static ClienteEmpresaDTO[] getdatosEmpresa(){
        
        int posicion = 0;
        ClienteEmpresaDTO[] obj_clienteEmpresa = null;
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        
        try {
//            String sql = "SELECT multas.ubicacion, multas.lugar FROM multas,conductores WHERE multas.id_conductor=conductores.id_conductor AND conductores.dni='"+prm_mimulta.getDni()+"'";
            String sql = "select cliente.razonCliente, cliente.rucCliente , cliente.telefonoCliente, cliente.direccionCliente, cliente.emailCliente,cliente.urlCliente from cliente where cliente.rucCliente <> ''";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);

            rs = ps.executeQuery();

            if (rs.last()) {
                int tamanio = rs.getRow();
                obj_clienteEmpresa = new ClienteEmpresaDTO[tamanio];
                rs.beforeFirst();
            }
            while (rs.next()) {
                ClienteEmpresaDTO obj_clientes = new ClienteEmpresaDTO();
                obj_clientes.setRazonCliente(rs.getString("razonCliente"));
                obj_clientes.setRucCliente(rs.getString("rucCliente"));
                obj_clientes.setTelefonoCliente(rs.getString("telefonoCliente"));
                obj_clientes.setDireccionCliente(rs.getString("direccionCliente"));
                obj_clientes.setEmailCliente(rs.getString("emailCliente"));
                obj_clientes.setUrlCliente(rs.getString("urlCliente"));
                

                obj_clienteEmpresa[posicion] = obj_clientes;
                
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
        return obj_clienteEmpresa;

    }
    public static ClienteNaturalDTO[] getdatosNatural(){
        
        int posicion = 0;
        ClienteNaturalDTO[] obj_clienteNatural = null;
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        
        try {
//            String sql = "SELECT multas.ubicacion, multas.lugar FROM multas,conductores WHERE multas.id_conductor=conductores.id_conductor AND conductores.dni='"+prm_mimulta.getDni()+"'";
            String sql = "select cliente.nombresCliente, cliente.apellidosCliente , cliente.dniCliente,cliente.telefonoCliente, cliente.direccionCliente, cliente.emailCliente,cliente.urlCliente from cliente where cliente.dniCliente <> ''";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);

            rs = ps.executeQuery();

            if (rs.last()) {
                int tamanio = rs.getRow();
                obj_clienteNatural = new ClienteNaturalDTO[tamanio];
                rs.beforeFirst();
            }
            while (rs.next()) {
                ClienteNaturalDTO obj_clientes = new ClienteNaturalDTO();
                obj_clientes.setNombresCliente(rs.getString("nombresCliente"));
                obj_clientes.setApellidosCliente(rs.getString("apellidosCliente"));
                obj_clientes.setDniCliente(rs.getString("dniCliente"));
                obj_clientes.setTelefonoCliente(rs.getString("telefonoCliente"));
                obj_clientes.setDireccionCliente(rs.getString("direccionCliente"));
                obj_clientes.setEmailCliente(rs.getString("emailCliente"));
                obj_clientes.setUrlCliente(rs.getString("urlCliente"));
                

                obj_clienteNatural[posicion] = obj_clientes;
                
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
        return obj_clienteNatural;

    }

            
    
    
    
    
}