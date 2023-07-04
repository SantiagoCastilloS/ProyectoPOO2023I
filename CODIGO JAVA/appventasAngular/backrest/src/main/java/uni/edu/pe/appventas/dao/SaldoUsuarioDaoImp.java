package uni.edu.pe.appventas.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import uni.edu.pe.appventas.dto.SaldoUsuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class SaldoUsuarioDaoImp implements SaldoUsuarioDao{
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
    public List<SaldoUsuario> mostrarsaldoUsuario() {
        List<SaldoUsuario> saldoUsuarios = new ArrayList<>();
        try{
            obtConeccion();
            String sql = "SELECT u.nombre_usuario, pa.saldo_tarjeta FROM usuario u INNER JOIN pedido p ON (p.id_usuario = u.id_usuario) INNER JOIN pago pa ON (p.id_pedido = pa.id_pedido)";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
              SaldoUsuario saldoUsuario = new SaldoUsuario(rs.getString("nombre_usuario"),rs.getFloat("saldo_tarjeta"));
              saldoUsuarios.add(saldoUsuario);
            }
            st.close();
            rs.close();
            cerrConeccion();
        } catch (SQLException e){
            e.printStackTrace();
        }
        return saldoUsuarios;
    }
}
