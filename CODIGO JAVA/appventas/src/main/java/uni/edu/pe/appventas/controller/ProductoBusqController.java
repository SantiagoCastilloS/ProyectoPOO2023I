package uni.edu.pe.appventas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import uni.edu.pe.appventas.service.ProductoBusqService;

@RestController
public class ProductoBusqController {
    @Autowired
    private ProductoBusqService productoBusqService;
    @RequestMapping(value = "/busquedaProducto", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    
}
