package uni.edu.pe.appventas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import uni.edu.pe.appventas.dto.rest.RespuestaDescuento;
import uni.edu.pe.appventas.service.DescuentoService;

@RestController
@CrossOrigin(origins = {"*"})
public class DescuentoController {
    @Autowired
    private DescuentoService mostrarDescuentoService;

    @RequestMapping(value = "/mostrardescuento", method = RequestMethod.GET)
    public RespuestaDescuento mostrardescuento() {
        return new RespuestaDescuento(mostrarDescuentoService.mostrardescuento());
    }
}