package uni.edu.pe.appventas.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import uni.edu.pe.appventas.dao.UsuarioNuevoDao;
import uni.edu.pe.appventas.dto.Usuario;

@Service
@Transactional
public class UsuarioNuevoServiceImp implements UsuarionNuevoService {
    @Autowired
    private UsuarioNuevoDao usuarioNuevoDao;
    @Override
    public Usuario registrarUsuario(Usuario usuario) {
        return usuarioNuevoDao.registrarUsuario(usuario);
    }
}
