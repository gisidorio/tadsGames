/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.unidospi.DAO;

import br.com.unidospi.model.Usuario;
import br.com.unidospi.model.UsuarioFuncionario;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author gabriel.gisidorio
 */
public class UsuarioDAO {
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";    //Driver do MySQL 8.0 em diante - Se mudar o SGBD mude o Driver
    private static final String LOGIN = "root";                         //nome de um usuário do banco de dados
    private static final String SENHA = "adminadmin";                             //sua senha de acesso
    private static String URL = "jdbc:mysql://localhost:3306/dbgames?useTimezone=true&serverTimezone=UTC";  //URL do banco de dados
    private static Connection conexao;
    
    
    /* recebe um usuário e retorna 1 caso os dados sejam salvos com sucesso
       e 0 caso não seja salvo com sucesso */
    public static int salvar(Usuario usuario) {
        int retorno = 0;
        String query = "INSERT INTO Usuario(nomeUsuario, senha, dataCadastro, ativo, idFuncionario) " +
                " VALUES(?, ?, ?, ?, ?)";
        
        try {
            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);
            PreparedStatement ps = conexao.prepareStatement(query);
            Date dataSql = Date.valueOf(usuario.getDtCadastro());
            
            ps.setString(1, usuario.getNomeUsuario());
            ps.setString(2, usuario.getSenha());
            ps.setDate(3, dataSql);
            ps.setBoolean(4, usuario.getStatus());
            ps.setInt(5, usuario.getIdFuncionario());
            
            int linhasAfetadas = ps.executeUpdate();
            
            if (linhasAfetadas > 0)
                retorno = linhasAfetadas;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return retorno;
    }
    
    /* retorna uma lista de usuarios associados com funcionarios */
    public static ArrayList<UsuarioFuncionario> obterFuncionariosSemUsuario() {
        ArrayList<UsuarioFuncionario> listaUsuarios = new ArrayList<>();
        
        String query = "SELECT f.idFuncionario,\n" + 
                       " f.nomeFuncionario,\n" + 
                       " f.sobrenome,\n" + 
                       " f.departamento,\n" + 
                       " f.cargo\n" + 
                       " FROM Usuario u\n" +
                       " RIGHT JOIN Funcionario f\n" +
                       " ON u.idFuncionario = f.idFuncionario\n" +
                       " WHERE u.idFuncionario IS NULL\n" +
                       " AND f.ativo = true;";
        
        try {
            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);
            PreparedStatement ps = conexao.prepareStatement(query);
            ResultSet rs = ps.executeQuery(query);
            
            while (rs.next()) {
                UsuarioFuncionario usuarioFuncionario = new UsuarioFuncionario(
                        rs.getInt("idFuncionario"),
                        rs.getString("nomeFuncionario"),
                        rs.getString("sobrenome"),
                        rs.getString("departamento"),
                        rs.getString("cargo")
                );
                
                listaUsuarios.add(usuarioFuncionario);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return listaUsuarios;        
    }
    
    public static UsuarioFuncionario obterUsuarioFuncionarioPorId(int id) {
        UsuarioFuncionario usuarioFuncionario = null;
        
        String query = "SELECT f.idFuncionario,\n" + 
                       " f.nomeFuncionario,\n" + 
                       " f.sobrenome,\n" + 
                       " f.departamento,\n" + 
                       " f.cargo\n" + 
                       " FROM Usuario u\n" +
                       " RIGHT JOIN Funcionario f\n" +
                       " ON u.idFuncionario = f.idFuncionario\n" +
                       " WHERE u.idFuncionario IS NULL\n" +
                       " AND f.ativo = true\n" +
                       " AND f.idFuncionario = ?;";
        
        try {
            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);
            PreparedStatement ps = conexao.prepareStatement(query);
            
            ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
                        
            while (rs.next()) {
                usuarioFuncionario = new UsuarioFuncionario(
                        rs.getInt("idFuncionario"),
                        rs.getString("nomeFuncionario"),
                        rs.getString("sobrenome"),
                        rs.getString("departamento"),
                        rs.getString("cargo")
                );
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return usuarioFuncionario;
    }
    
    public static UsuarioFuncionario obterUsuarioLogado(String login, String senha)  {
        UsuarioFuncionario usuarioFuncionario = null;
        
        String query = "SELECT u.idUsuario,\n "
                     + " u.nomeUsuario,\n"
                     + " f.departamento,\n"
                     + " f.cargo,\n"
                     + "f.idEmpresa\n"
                     + " FROM Usuario u\n"
                     + " INNER JOIN Funcionario f\n"
                     + " ON u.idFuncionario = f.idFuncionario\n"
                     + " WHERE   u.nomeUsuario = ?\n"
                     + " AND     u.senha = ?;";
        
        try {
            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, LOGIN, SENHA);
            PreparedStatement ps = conexao.prepareStatement(query);
            
            ps.setString(1, login);
            ps.setString(2, senha);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                usuarioFuncionario = new UsuarioFuncionario(
                        rs.getInt("idUsuario"),
                        rs.getString("nomeUsuario"),
                        rs.getString("departamento"),
                        rs.getString("cargo"),
                        rs.getInt("idEmpresa")
                );
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
                
        return usuarioFuncionario;
    }
}