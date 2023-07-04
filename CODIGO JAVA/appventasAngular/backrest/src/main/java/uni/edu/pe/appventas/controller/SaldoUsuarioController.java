package uni.edu.pe.appventas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import uni.edu.pe.appventas.dto.SaldoUsuario;
import uni.edu.pe.appventas.dto.rest.RespuestaSaldoUsuario;
import uni.edu.pe.appventas.service.DetalleSaldoUsuario;

@RestController
@CrossOrigin(origins = {"*"})
public class SaldoUsuarioController {
    @Autowired
    private SaldoUsuarioService mostrarSaldoUsuarioService;

    @RequestMapping (value = "/mostrarSaldoUsuario", method = RequestMethod.GET)
    public RespuestaSaldoUsuario mostrarSaldoUsuario(){
        return new RespuestaSaldoUsuario (mostrarSaldoUsuarioService.mostrarSaldoUsuario());
    }
}
