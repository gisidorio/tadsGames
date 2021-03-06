/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.unidospi.DAO;

import br.com.unidospi.model.Compra;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author henrique.abastos
 */
public class CompraDAO {
    
    static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String USUARIO = "root";
    private static final String SENHA = "adminadmin";
    private static final String URL = "jdbc:mysql://localhost:3306/dbGames?useUnicode=yes&characterEncoding=UTF-8&useTimezone=true&serverTimezone=UTC";
    static Connection conexao;
    
    /* recebe um objeto cliente e retorna 1 caso obtenha sucesso em salvar cliente
     * ou 0 caso não obtenha sucesso */   
    public static boolean salvar(Compra compra)  {
            
        
        try {
            String sql= "insert into Compra (idEmpresa, idProduto, qtdComprada, dataEntrada, valorCompraUnitario) values(?,?,?,?,?)";
            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL, USUARIO, SENHA);
            PreparedStatement ps = conexao.prepareStatement(sql);
            
            java.sql.Date dtSQL = new java.sql.Date(compra.getDataCompra().getTime());
            
            ps.setInt(1, compra.getIdEmpresa());
            ps.setInt(2, compra.getIdProduto());
            ps.setInt(3, compra.getQtdCompra());
            ps.setDate(4, dtSQL);
            ps.setFloat(5, compra.getValorCompra());
    
            ps.executeUpdate();
            return true;
                                    
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CompraDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            ex.getMessage();
        }
        
        return false;
    }
    //Retorna a quantidade, valor da ultima compra feita no sistema
    public static Compra ultCompra() {
        String query = "Select idProduto, qtdComprada, valorCompraUnitario from Compra where (select max(idCompra) from Compra)=idCompra;";
        Compra c = null;
        try {                        
            Class.forName(DRIVER);
            conexao = DriverManager.getConnection(URL,USUARIO,SENHA);
            PreparedStatement ps = conexao.prepareStatement(query);
            ResultSet rs = ps.executeQuery(query);
            
            while (rs.next()) {
                int idProduto=rs.getInt("idProduto");
                int qtdComprada=rs.getInt("qtdComprada"); 
                float vlrCompraUnitario=rs.getFloat("valorCompraUnitario");
                
                c = new Compra(idProduto, qtdComprada, vlrCompraUnitario);
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClienteDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            ex.getMessage();
        }
        
        return c;
    }
    
       
}
