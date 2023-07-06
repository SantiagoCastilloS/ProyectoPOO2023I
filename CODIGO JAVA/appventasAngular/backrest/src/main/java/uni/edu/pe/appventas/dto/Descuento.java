package uni.edu.pe.appventas.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Descuento {
     private String nombre_prod;
     private float porcentaje_desc;
     private String fecha_inicio_desc;
     private String fecha_fin_desc;
     private int id_prod;

}
