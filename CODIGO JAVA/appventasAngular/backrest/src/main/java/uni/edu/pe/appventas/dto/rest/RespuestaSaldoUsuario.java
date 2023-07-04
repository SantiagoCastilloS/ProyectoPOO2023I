package uni.edu.pe.appventas.dto.rest;

import uni.edu.pe.appventas.dto.SaldoUsuario;

import java.util.List;

public class RespuestaSaldoUsuario {
    private List<SaldoUsuario> saldoUsuarios;

    public List<SaldoUsuario> getSaldoUsuarios() {
        return saldoUsuarios;
    }
    public void setSaldoUsuarios(List<SaldoUsuario> saldoUsuarios) {
        this.saldoUsuarios = saldoUsuarios;
    }
    public RespuestaSaldoUsuario(List<SaldoUsuario> saldoUsuarios) {
        this.saldoUsuarios = saldoUsuarios;
    }
}
