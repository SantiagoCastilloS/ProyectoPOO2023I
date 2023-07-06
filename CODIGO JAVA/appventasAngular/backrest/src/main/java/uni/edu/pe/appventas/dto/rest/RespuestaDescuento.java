package uni.edu.pe.appventas.dto.rest;

import uni.edu.pe.appventas.dto.Descuento;

import java.util.List;

public class RespuestaDescuento {
    private List<Descuento> descuentos;

    public List<Descuento> getDescuentos() {
        return descuentos;
    }
    public void setDescuentos(List<Descuento> descuentos) { this.descuentos = descuentos; }
    public RespuestaDescuento(List<Descuento> descuentos) {
        this.descuentos = descuentos;
    }
}
