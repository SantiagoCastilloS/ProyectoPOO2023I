package uni.edu.pe.appventas.dto.rest;

import uni.edu.pe.appventas.dto.Categoria;


import java.util.List;

public class RespuestaCategoria {
    private List<Categoria> categorias;

    public List<Categoria> getCategorias() {
        return categorias;
    }
    public void setCategorias(List<Categoria> categorias) {
        this.categorias = categorias;
    }
    public RespuestaCategoria(List<Categoria> categorias) {
        this.categorias = categorias;
    }

}
