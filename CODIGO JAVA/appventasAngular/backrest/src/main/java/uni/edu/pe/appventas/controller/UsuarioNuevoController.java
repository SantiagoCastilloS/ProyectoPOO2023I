package uni.edu.pe.appventas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import uni.edu.pe.appventas.dto.Usuario;
import uni.edu.pe.appventas.service.UsuarionNuevoService;

@RestController
@CrossOrigin(origins = {"*"})
public class UsuarioNuevoController {
    @Autowired
    private UsuarionNuevoService usuarionNuevoService;
    @RequestMapping (value = "/registrarUsuario", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
    public Usuario registrarUsuario(@RequestBody Usuario usuario){
        return usuarionNuevoService.registrarUsuario(usuario);
    }
}