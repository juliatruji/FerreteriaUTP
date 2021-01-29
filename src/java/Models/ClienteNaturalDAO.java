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

public class ClienteNaturalDAO 	
{
    static Connection currentCon = null;
    static ResultSet rs = null;  

    public static int Register(ClienteNaturalDTO bean){
        Statement stmt=null;
        Statement stmt2=null;
        Statement stmtdni=null;
        Statement stmtalias=null;
        ResultSet rsdni = null;
        ResultSet rsalias = null;
        
        int resultado=0;
        String nombresCliente = bean.getNombresCliente();
        String apellidosCliente = bean.getApellidosCliente();
        String dniCliente = bean.getDniCliente();
        String emailCliente = bean.getEmailCliente();
        String direccionCliente = bean.getDireccionCliente();
        String telefonoCliente = bean.getTelefonoCliente();
        String urlCliente = bean.getUrlCliente();
        String Query= "INSERT INTO `cliente`(`nombresCliente`, `apellidosCliente`, `dniCliente`, `direccionCliente`, `emailCliente`,`telefonoCliente`,`urlCliente`)"
                + "VALUES ('"+nombresCliente+"','"+apellidosCliente+"','"+dniCliente+"','"+direccionCliente+"','"+emailCliente+"','"+telefonoCliente+"','"+urlCliente+"')";
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
    
}