/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.unidospi.Controller;

import br.com.unidospi.Acoes.FormVenda;

//import com.google.gson.Gson;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author thiago.srocha4
 */
@WebServlet(name = "VendaController", urlPatterns = {"/inputVenda"})
public class VendaController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String paramAction = req.getParameter("action");
        if(paramAction.equals("FormVenda")){
            FormVenda action = new FormVenda();
            action.executa(req, resp);
            
        }else if(paramAction.equals("CadastrarVenda")){
            
            String a= req.getHeader("c");
            System.out.println(a);
            
            
            
            
            
        }
    }
    
    

    
}
