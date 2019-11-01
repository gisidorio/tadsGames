/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.unidospi.DAO;

import br.com.unidospi.model.Venda;
import com.mysql.cj.protocol.Resultset;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author thiago.srocha4
 */
public class VendaDAO {

    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";    //Driver do MySQL 8.0 em diante - Se mudar o SGBD mude o Driver
    private static final String LOGIN = "root";                         //nome de um usuário do banco de dados
    private static final String SENHA = "adminadmin";                             //sua senha de acesso
    private static String URL = "jdbc:mysql://localhost:3306/dbgames?useTimezone=true&serverTimezone=UTC";  //URL do banco de dados
    private static Connection conexao;

    /* recebe um usuário e retorna 1 caso os dados sejam salvos com sucesso
       e 0 caso não seja salvo com sucesso */
    public static int salvar(Venda venda) {
        
        String sql = "INSERT INTO Venda(idCliente,idEmpresa,valorTotal, dataVenda, statusPedido ) "
                + " VALUES(?, ?, ?, ?, ?)";

        try {
            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);
            PreparedStatement ps = conexao.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS );
            Date dataSql = new Date(venda.getDtVenda().getTime());
            
            ps.setInt(1, venda.getIdCliente());
            ps.setInt(2, venda.getIdEmpresa());
            ps.setFloat(3, venda.getVlrVenda());
            ps.setDate(4, dataSql);
            ps.setString(5, venda.getStatusVenda());
            
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            
            while(rs.next()){
                int chave = rs.getInt(1);
                return chave;
            }
 
        } catch (SQLException | ClassNotFoundException e) {
            e.getMessage();
        } finally {
            try {
                conexao.close();
            } catch (SQLException e) {
                e.getMessage();
            }
            
        }
        return 0;
    
    }

}
