package uni.edu.pe.appventas.dto.rest;

import uni.edu.pe.appventas.dto.Producto;

import java.util.List;

public class RespuestaProducto {
    private List<Producto> productos;

    public List<Producto> getProductos() {
        return productos;
    }
    public void setProductos(List<Producto> productos) {
        this.productos = productos;
    }
    public RespuestaProducto(List<Producto> productos) {
        this.productos = productos;
    }
}
