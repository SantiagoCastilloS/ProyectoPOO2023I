package uni.edu.pe.appventas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import uni.edu.pe.appventas.dto.rest.RespuestaCategoria;
import uni.edu.pe.appventas.service.CategoriaService;

@RestController
@CrossOrigin(origins = {"*"})
public class CategoriaController {
    @Autowired
    private CategoriaService mostrarCategoriaService;

    @RequestMapping(value = "/mostrarcategoria", method = RequestMethod.GET)
    public RespuestaCategoria mostrarcategoria(){
        return new RespuestaCategoria(mostrarCategoriaService.mostrarcategoria());
    }
}
