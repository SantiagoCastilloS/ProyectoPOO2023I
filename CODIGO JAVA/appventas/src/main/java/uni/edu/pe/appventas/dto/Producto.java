package uni.edu.pe.appventas.dto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Producto {
    private int idProd;
    private String nombreProd;
    private String descripcionProd;
    private int stockProd;
    private float precioProd;
    private float porcentajeDesc;
    private float precioFinal;
    private String vendedor;
}
