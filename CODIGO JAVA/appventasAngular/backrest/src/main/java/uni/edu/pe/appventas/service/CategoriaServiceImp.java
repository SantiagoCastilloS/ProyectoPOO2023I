package uni.edu.pe.appventas.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import uni.edu.pe.appventas.dao.CategoriaDao;
import uni.edu.pe.appventas.dto.Categoria;

import java.util.List;

@Service
@Transactional
public class CategoriaServiceImp implements CategoriaService{
    @Autowired
    private CategoriaDao categoriaDao;
    @Override
    public List<Categoria> mostrarcategoria() {
        return categoriaDao.mostrarcategoria();
    }
}
