package uni.edu.pe.appventas.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import uni.edu.pe.appventas.dto.DetalleUsuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class DetalleUsuarioDaoImp implements DetalleUsuarioDao{
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
    public List<DetalleUsuario> mostrardetalleUsuario() {
        List<DetalleUsuario> detalleUsuarios = new ArrayList<>();
        try{
            obtConeccion();
            String sql = "SELECT u.nombre_usuario, pr.nombre_prod, pr.precio_prod, dc.cantidad, p.fecha_creacion_ped 'fecha_pedido', p.hora_creacion_ped 'hora_pedido', te.nombre_envio, sp.estado_seguimiento 'estado_seguimiento' FROM usuario u INNER JOIN carrito c ON (u.id_usuario = c.id_usuario) INNER JOIN detalle_carrito dc ON (c.id_carrito = dc.id_carrito) INNER JOIN producto pr ON (dc.id_prod = pr.id_prod) INNER JOIN pedido p ON (u.id_usuario = p.id_usuario ) INNER JOIN pago pa ON (p.id_pedido = pa.id_pedido) INNER JOIN envio en ON (p.id_envio = en.id_envio) INNER JOIN tipo_envio te ON (en.id_tipo_envio = te.id_tipo_envio) INNER JOIN seguimiento_pedido sp ON (sp.id_pedido = p.id_pedido) WHERE (u.nombre_usuario = ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
              DetalleUsuario detalleUsuario = new DetalleUsuario(rs.getString("nombre_usuario"),rs.getString("nombre_prod"),rs.getFloat("precio_prod"),rs.getInt("cantidad"),rs.getChar("fecha_creacion_ped"),rs.getChar("hora_creacion_ped"),rs.getString("nombre_envio"),rs.getChar("estado_seguimiento"));
              detalleUsuarios.add(detalleUsuario);
            }
            st.close();
            rs.close();
            cerrConeccion();
        } catch (SQLException e){
            e.printStackTrace();
        }
        return detalleUsuarios;
    }
}
