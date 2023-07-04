package uni.edu.pe.appventas.dto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Usuario {
    private int idUsuario;
    private String nombreUsuario;
    private String emailUsuario;
    private String contraseñaUsuario;
    private String telefonoUsuario;
    private String dniUsuario;
}
