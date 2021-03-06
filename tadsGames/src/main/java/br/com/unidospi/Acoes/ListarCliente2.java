/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.unidospi.Acoes;

import br.com.unidospi.Controller.ClienteController;
import br.com.unidospi.model.Cliente;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lucas
 */
public class ListarCliente2 implements Executavel {
    @Override
    public String executa(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{
     String nomePesquisado = req.getParameter("nomeCliente");
        ArrayList<Cliente> lista = ClienteController.listarClientes(nomePesquisado);
        req.setAttribute("lista", lista);
        Gson g = new Gson();
        String json = g.toJson(lista);
         try (PrintWriter out = resp.getWriter()) {
             out.println(json);
         }

        return "";
    }
}
