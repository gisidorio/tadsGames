/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.unidospi.model;

import java.sql.Date;

/**
 *
 * @author gabri
 */
public class GerenteGlobal extends Funcionario {

    public GerenteGlobal(double salario, String departamento, String cargo, String login, String senha, int id, int idEmpresa, String nome, String sobrenome, String sexo, String cpf, Date dataNasc, boolean ativo) {
        super(salario, departamento, cargo, login, senha, id, idEmpresa, nome, sobrenome, sexo, cpf, dataNasc, ativo);
    }

    public GerenteGlobal(double salario, String departamento, String cargo, String login, String senha, int idEmpresa, String nome, String sobrenome, String sexo, String cpf, Date dataNasc, boolean ativo) {
        super(salario, departamento, cargo, login, senha, idEmpresa, nome, sobrenome, sexo, cpf, dataNasc, ativo);
    }

            
    public void mostrarFaturamentoFiliais() {}
}
