package uni.edu.pe.appventas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import uni.edu.pe.appventas.dto.Producto;
import uni.edu.pe.appventas.dto.rest.RespuestaProducto;
import uni.edu.pe.appventas.service.ProductoService;

@RestController
@CrossOrigin(origins = {"*"})
public class ProductoController {
    @Autowired
    private ProductoService mostrarProductoService;

    @RequestMapping (value = "/mostrarproducto", method = RequestMethod.GET)
    public RespuestaProducto mostrarproducto(){
        return new RespuestaProducto (mostrarProductoService.mostrarproducto());
    }



}
