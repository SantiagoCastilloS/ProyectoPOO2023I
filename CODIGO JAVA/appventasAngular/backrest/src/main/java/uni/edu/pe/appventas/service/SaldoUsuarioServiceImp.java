package uni.edu.pe.appventas.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import uni.edu.pe.appventas.dao.SaldoUsuarioDao;
import uni.edu.pe.appventas.dto.SaldoUsuario;

import java.util.List;
@Service
@Transactional

public class SaldoUsuarioServiceImp implements SaldoUsuarioService{
   @Autowired
   private SaldoUsuarioDao saldoUsuarioDao;
    @Override
    public List<SaldoUsuario> mostrarSaldoUsuario() {
        return saldoUsuarioDao.mostrarSaldoUsuario();
    }
}
