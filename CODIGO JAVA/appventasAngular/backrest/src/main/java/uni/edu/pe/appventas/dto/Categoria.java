package uni.edu.pe.appventas.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Categoria {
    private String nombre_categ;
    private int id_categ;
    private int id_prod;
}
