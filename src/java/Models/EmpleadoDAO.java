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

public class EmpleadoDAO 	
{
    static Connection currentCon = null;
    static ResultSet rs = null;  

    public static int Register(EmpleadoDTO bean){
        Statement stmt=null;
        Statement stmt2=null;
        Statement stmtdni=null;
        Statement stmtalias=null;
        ResultSet rsdni = null;
        ResultSet rsalias = null;
        
        int resultado=0;
        String nombresEmpleado = bean.getNombresEmpleado();
        String apellidosEmpleado = bean.getApellidosEmpleado();
        String usuarioEmpleado = bean.getUsuarioEmpleado();
        String passwordEmpleado = bean.getPasswordEmpleado();
        int Cargo_idCargo = bean.getCargo_idCargo();
        int idAlmacen = bean.getIdAlmacen();
        String urlEmpleado= bean.getUrlEmpleado();
        String Query= "INSERT INTO `empleado`(`nombresEmpleado`, `apellidosEmpleado`, `usuarioEmpleado`, `passwordEmpleado`, `Cargo_idCargo`,`idAlmacen`,`urlEmpleado`)"
                + "VALUES ('"+nombresEmpleado+"','"+apellidosEmpleado+"','"+usuarioEmpleado+"','"+passwordEmpleado+"','"+Cargo_idCargo+"','"+idAlmacen+"','"+urlEmpleado+"')";
                 
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
    public static EmpleadoDTO[] getdatosEmpleado(){
        
        int posicion = 0;
        EmpleadoDTO[] obj_empleado = null;
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        
        try {

            String sql = "select empleado.nombresEmpleado, empleado.apellidosEmpleado, empleado.usuarioEmpleado,empleado.urlEmpleado, empleado.passwordEmpleado, cargo.descripcionCargo, almacen.nombreAlmacen\n" +
            "from empleado\n" +
            "inner join cargo on cargo.idCargo=empleado.Cargo_idCargo\n" +
            "inner join almacen on almacen.idAlmacen=empleado.idAlmacen";
            cn = ConnectionManager.getConnection();
            ps = cn.prepareStatement(sql);

            rs = ps.executeQuery();

            if (rs.last()) {
                int tamanio = rs.getRow();
                obj_empleado = new EmpleadoDTO[tamanio];
                rs.beforeFirst();
            }
            while (rs.next()) {
                EmpleadoDTO obj_empleados = new EmpleadoDTO();
                obj_empleados.setNombresEmpleado(rs.getString("nombresEmpleado"));
                obj_empleados.setApellidosEmpleado(rs.getString("apellidosEmpleado"));
                obj_empleados.setUsuarioEmpleado(rs.getString("usuarioEmpleado"));
                obj_empleados.setDescripcionCargo(rs.getString("descripcionCargo"));
                obj_empleados.setNombreAlmacen(rs.getString("nombreAlmacen"));
                obj_empleados.setUrlEmpleado(rs.getString("urlEmpleado"));
                

                obj_empleado[posicion] = obj_empleados;
                
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
        return obj_empleado;

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