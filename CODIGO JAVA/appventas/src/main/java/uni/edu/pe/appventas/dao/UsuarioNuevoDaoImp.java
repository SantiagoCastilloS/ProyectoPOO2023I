package uni.edu.pe.appventas.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import uni.edu.pe.appventas.dto.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@Repository
public class UsuarioNuevoDaoImp implements UsuarioNuevoDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;
    private Connection connection;
    private void obtenerConexion(){
        try {
            connection = jdbcTemplate.getDataSource().getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    private void cerrarConexion() {
        try {
            connection.close();
            connection = null;
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Override
    public Usuario registrarUsuario(Usuario usuario) {
        try{
            obtenerConexion();
            String sql = "INSERT INTO usuario VALUES (?,?,?,?,?,?);";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1,usuario.getIdUsuario());
            st.setString(2,usuario.getNombreUsuario());
            st.setString(3,usuario.getEmailUsuario());
            st.setString(4,usuario.getContraseñaUsuario());
            st.setString(5,usuario.getTelefonoUsuario());
            st.setString(6, usuario.getDniUsuario());
            st.executeUpdate();
            st.close();
            cerrarConexion();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }
}
