package uni.edu.pe.appventas.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import uni.edu.pe.appventas.dto.Producto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
@Repository
public class ProductoDaoImp implements ProductoDao{
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
    public List<Producto> mostrarproducto() {
        List<Producto> productos = new ArrayList<>();
        try{
            obtConeccion();
            String sql = "SELECT p.id_prod, p.nombre_prod, p.descripcion_prod, p.stock_prod, p.precio_prod, d.porcentaje_desc, p.precio_prod - p.precio_prod * d.porcentaje_desc AS precio_final, v.nombre_ven FROM producto p INNER JOIN descuento d ON d.id_prod = p.id_prod INNER JOIN vendedor v ON v.id_ven = p.id_ven";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                Producto producto = new Producto(rs.getInt("id_prod"),rs.getString("nombre_prod"),rs.getString("descripcion_prod"),rs.getInt("stock_prod"),rs.getFloat("precio_prod"),rs.getFloat("porcentaje_desc"),rs.getFloat("precio_final"),rs.getString("nombre_ven"));
                productos.add(producto);
            }
            st.close();
            rs.close();
            cerrConeccion();
        } catch (SQLException e){
            e.printStackTrace();
        }
        return productos;
    }
}
