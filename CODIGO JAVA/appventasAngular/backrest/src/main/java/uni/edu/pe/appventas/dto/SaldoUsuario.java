package uni.edu.pe.appventas.dto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SaldoUsuario {
    private String nombreUsuario;
    private float saldoTarjeta;
}
