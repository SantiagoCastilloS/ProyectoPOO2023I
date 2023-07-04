package uni.edu.pe.appventas.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import uni.edu.pe.appventas.dao.DetalleUsuarioDao;
import uni.edu.pe.appventas.dto.DetalleUsuario;

import java.util.List;
@Service
@Transactional

public class DetalleUsuarioServiceImp implements DetalleUsuarioService{
   @Autowired
   private DetalleUsuarioDao detalleUsuarioDao;
    @Override
    public List<DetalleUsuario> mostrarDetalleUsuario() {
        return detalleUsuarioDao.mostrarDetalleUsuario();
    }
}
