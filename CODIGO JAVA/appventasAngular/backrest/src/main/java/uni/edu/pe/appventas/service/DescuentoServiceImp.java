package uni.edu.pe.appventas.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import uni.edu.pe.appventas.dao.DescuentoDao;
import uni.edu.pe.appventas.dto.Descuento;

import java.util.List;

@Service
@Transactional
public class DescuentoServiceImp implements DescuentoService {
    @Autowired
    private DescuentoDao descuentoDao;
    @Override
    public List<Descuento> mostrardescuento() {
        return descuentoDao.mostrardescuento();
    }
}
