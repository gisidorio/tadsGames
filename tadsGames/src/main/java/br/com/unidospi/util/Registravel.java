/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.unidospi.util;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * É NECESSÁRIO QUE O CAMINHO >> \\Documents\\NetBeansProjects\\tadsGames\\tadsGames\\Log << EXISTA NO COMPUTADOR,
 * PARA O FUNCIONAMENTO CORRETO DA FUNÇÃO DE REGISTRO DE ATIVIDADES NO SISTEMA.
 * @author lucas.sfaria5
 */
public interface Registravel {
    public void gerarLog(HttpServletRequest req, HttpServletResponse resp) 
            throws IOException, ServletException;
    
}
