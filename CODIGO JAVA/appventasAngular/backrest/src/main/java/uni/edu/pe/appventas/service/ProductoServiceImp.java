package uni.edu.pe.appventas.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import uni.edu.pe.appventas.dao.ProductoDao;
import uni.edu.pe.appventas.dto.Producto;

import java.util.List;
@Service
@Transactional

public class ProductoServiceImp implements ProductoService{
   @Autowired
   private ProductoDao productoDao;
    @Override
    public List<Producto> mostrarproducto() {
        return productoDao.mostrarproducto();
    }
}
