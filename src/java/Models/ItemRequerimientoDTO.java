/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
// *
 * @author Usuario
 */
public class ItemRequerimientoDTO {

    private int Producto_idProducto;
    private String nombreProducto;
    private int cantidadItemRequerimiento;

    public ItemRequerimientoDTO() {
    }

   

    public int getProducto_idProducto() {
        return Producto_idProducto;
    }

    public void setProducto_idProducto(int Producto_idProducto) {
        this.Producto_idProducto = Producto_idProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public int getCantidadItemRequerimiento() {
        return cantidadItemRequerimiento;
    }

    public void setCantidadItemRequerimiento(int cantidadItemRequerimiento) {
        this.cantidadItemRequerimiento = cantidadItemRequerimiento;
    }

 
    
}
