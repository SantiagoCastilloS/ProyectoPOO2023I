package uni.edu.pe.appventas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import uni.edu.pe.appventas.dto.Usuario;
import uni.edu.pe.appventas.service.UsuarionNuevoService;

@RestController
public class UsuarioNuevoController {
    @Autowired
    private UsuarionNuevoService usuarionNuevoService;
    @RequestMapping (value = "/registrarUsuario", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    public Usuario registrarUsuario(@RequestBody Usuario usuario){
        return usuarionNuevoService.registrarUsuario(usuario);
    }
}