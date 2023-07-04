package uni.edu.pe.appventas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import uni.edu.pe.appventas.dto.DetalleUsuario;
import uni.edu.pe.appventas.dto.rest.RespuestaDetalleUsuario;
import uni.edu.pe.appventas.service.DetalleUsuarioService;

@RestController
@CrossOrigin(origins = {"*"})
public class DetalleUsuarioController {
    @Autowired
    private DetalleUsuarioService mostrarDetalleUsuarioService;

    @RequestMapping (value = "/mostrarDetalleUsuario", method = RequestMethod.GET)
    public RespuestaDetalleUsuario mostrarDetalleUsuario(){
        return new RespuestaDetalleUsuario (mostrarDetalleUsuarioService.mostrarDetalleUsuario());
    }
}
