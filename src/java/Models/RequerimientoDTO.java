
package Models;

import java.sql.Date;
import java.util.List;

public class RequerimientoDTO {
    private String nombreAlmacen;  
    private Date fechaRequerimiento;
    private Date horaRequerimiento;
    private int idRequerimiento;
    private List<ItemRequerimientoDTO> productos;

    public RequerimientoDTO() {
    }
    

    public String getNombreAlmacen() {
        return nombreAlmacen;
    }

    public void setNombreAlmacen(String nombreAlmacen) {
        this.nombreAlmacen = nombreAlmacen;
    }

    public Date getFechaRequerimiento() {
        return fechaRequerimiento;
    }

    public void setFechaRequerimiento(Date fechaRequerimiento) {
        this.fechaRequerimiento = fechaRequerimiento;
    }

    public Date getHoraRequerimiento() {
        return horaRequerimiento;
    }

    public void setHoraRequerimiento(Date horaRequerimiento) {
        this.horaRequerimiento = horaRequerimiento;
    }

    public List<ItemRequerimientoDTO> getProductos() {
        return productos;
    }

    public void setProductos(List<ItemRequerimientoDTO> productos) {
        this.productos = productos;
    }

    public int getIdRequerimiento() {
        return idRequerimiento;
    }

    public void setIdRequerimiento(int idRequerimiento) {
        this.idRequerimiento = idRequerimiento;
    }
    
    
    
    
    
}
