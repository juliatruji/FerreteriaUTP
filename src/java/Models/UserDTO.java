package Models;


import java.util.Vector;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author vicente
 */
 public class UserDTO {
	
      private String username;
      private String password;
      private String nombre;
      private String apellidos;
      private String dni;
      private String idCargo;
      private String urlEmpleado;
      public boolean valid;
      private String idAlmacen;
			
      public String getUsername() {
         return username;
			}
      
      

      public void setUserName(String newUsername) {
         username = newUsername;
			}

      public String getPassword() {
         return password;
	}

      public void setPassword(String newPassword) {
         password = newPassword;
	}      

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(String idCargo) {
        this.idCargo = idCargo;
    }


    public String getUrlEmpleado() {
        return urlEmpleado;
    }

    public String getIdAlmacen() {
        return idAlmacen;
    }

    public void setIdAlmacen(String idAlmacen) {
        this.idAlmacen = idAlmacen;
    }
    

    public void setUrlEmpleado(String urlEmpleado) {
        this.urlEmpleado = urlEmpleado;
    }
    
      
	


	



	

				
      public boolean isValid() {
         return valid;
	}

      public void setValid(boolean newValid) {
         valid = newValid;
	}	

    void setDireccion(String direccion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}