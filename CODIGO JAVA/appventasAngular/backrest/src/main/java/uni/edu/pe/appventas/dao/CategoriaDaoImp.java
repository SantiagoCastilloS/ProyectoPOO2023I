package uni.edu.pe.appventas.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import uni.edu.pe.appventas.dto.Categoria;
import uni.edu.pe.appventas.dto.Producto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class CategoriaDaoImp implements CategoriaDao{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private Connection connection;
    private void obtConeccion() {
        try{
            connection = jdbcTemplate.getDataSource().getConnection();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
    private void cerrConeccion(){
        try {
            connection.close();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public List<Categoria> mostrarcategoria() {
        List<Categoria> categorias = new ArrayList<>();
        try{
            obtConeccion();
            String sql = "SELECT c.nombre_categ FROM categoria c INNER JOIN producto p ON (c.id_categ = p.id_prod)";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                Categoria categoria = new Categoria(rs.getString("nombre_categ"),rs.getInt("id_categ"),rs.getInt("id_prod"));
                categorias.add(categoria);
            }
            st.close();
            rs.close();
            cerrConeccion();
        } catch (SQLException e){
            e.printStackTrace();
        }
        return categorias;
    }
}
