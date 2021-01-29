/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author Usuario
 */
public class EmpleadoDTO {
    private String nombresEmpleado, apellidosEmpleado, usuarioEmpleado, passwordEmpleado, urlEmpleado,descripcionCargo,nombreAlmacen;
    private int Cargo_idCargo, idAlmacen;

    public String getNombresEmpleado() {
        return nombresEmpleado;
    }

    public void setNombresEmpleado(String nombresEmpleado) {
        this.nombresEmpleado = nombresEmpleado;
    }

    public String getApellidosEmpleado() {
        return apellidosEmpleado;
    }

    public void setApellidosEmpleado(String apellidosEmpleado) {
        this.apellidosEmpleado = apellidosEmpleado;
    }

    public String getUsuarioEmpleado() {
        return usuarioEmpleado;
    }

    public void setUsuarioEmpleado(String usuarioEmpleado) {
        this.usuarioEmpleado = usuarioEmpleado;
    }

    public String getPasswordEmpleado() {
        return passwordEmpleado;
    }

    public void setPasswordEmpleado(String passwordEmpleado) {
        this.passwordEmpleado = passwordEmpleado;
    }

    public String getUrlEmpleado() {
        return urlEmpleado;
    }

    public void setUrlEmpleado(String urlEmpleado) {
        this.urlEmpleado = urlEmpleado;
    }

    public int getCargo_idCargo() {
        return Cargo_idCargo;
    }

    public void setCargo_idCargo(int Cargo_idCargo) {
        this.Cargo_idCargo = Cargo_idCargo;
    }

    public int getIdAlmacen() {
        return idAlmacen;
    }

    public void setIdAlmacen(int idAlmacen) {
        this.idAlmacen = idAlmacen;
    }

    public String getDescripcionCargo() {
        return descripcionCargo;
    }

    public void setDescripcionCargo(String descripcionCargo) {
        this.descripcionCargo = descripcionCargo;
    }

    public String getNombreAlmacen() {
        return nombreAlmacen;
    }

    public void setNombreAlmacen(String nombreAlmacen) {
        this.nombreAlmacen = nombreAlmacen;
    }
    
    
}
