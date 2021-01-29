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
public class VerStockProveedoresDTO {
    private String nombreProveedor;
    private String nombreProducto;
    private int Proveedor_idProveedor;
    private int cantidadStockProvee;
    private double precioVentaProvee;

    public VerStockProveedoresDTO() {
    }

    public String getNombreProveedor() {
        return nombreProveedor;
    }

    public void setNombreProveedor(String nombreProveedor) {
        this.nombreProveedor = nombreProveedor;
    }

    public int getProveedor_idProveedor() {
        return Proveedor_idProveedor;
    }

    public void setProveedor_idProveedor(int Proveedor_idProveedor) {
        this.Proveedor_idProveedor = Proveedor_idProveedor;
    }

    public int getCantidadStockProvee() {
        return cantidadStockProvee;
    }

    public void setCantidadStockProvee(int cantidadStockProvee) {
        this.cantidadStockProvee = cantidadStockProvee;
    }

    public double getPrecioVentaProvee() {
        return precioVentaProvee;
    }

    public void setPrecioVentaProvee(double precioVentaProvee) {
        this.precioVentaProvee = precioVentaProvee;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }
    
    
    
    
   
    
}
