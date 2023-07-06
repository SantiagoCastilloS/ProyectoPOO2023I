package uni.edu.pe.appventas.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import uni.edu.pe.appventas.dto.Descuento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class DescuentoDaoImp implements DescuentoDao {
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
    public List<Descuento> mostrardescuento() {
        List<Descuento> descuentos = new ArrayList<>();
        try{
            obtConeccion();
            String sql = "SELECT p.nombre_prod, d.porcentaje_desc, d.fecha_inicio_desc, d.fecha_fin_desc FROM producto p INNER JOIN descuento d ON (d.id_prod = p.id_prod)";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                Descuento descuento = new Descuento(rs.getString("nombre_prod"), rs.getFloat("porcentaje_desc"), rs.getString("fecha_inicio_desc"), rs.getString("fecha_fin_desc"),  rs.getInt("id_prod"));

                descuentos.add(descuento);
            }
            st.close();
            rs.close();
            cerrConeccion();
        } catch (SQLException e){
            e.printStackTrace();
        }
        return descuentos;
    }
}
