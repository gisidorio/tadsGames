/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.unidospi.Acoes;

import br.com.unidospi.Controller.ClienteController;
import br.com.unidospi.Controller.ProdutoController;
import br.com.unidospi.model.ClienteLista;
import br.com.unidospi.util.ListaPaginada;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lucas
 */
public class ListarCliente implements Executavel {

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double qtdRegistoPorPagina = 10;
        double qtdPagina = 1;
        int offset = 0;

        String numPaginaStr = req.getParameter("pagina");
        int numPagina = 1;

        if (!(numPaginaStr == null)) {
            numPagina = Integer.parseInt(numPaginaStr);
            ListaPaginada lp = new ListaPaginada(ClienteController.qtdRegitro(), qtdRegistoPorPagina, numPagina);
            qtdPagina = lp.getQtdPaginas();
            numPagina = lp.getNumPagina();
            offset = lp.offset();
        }

        req.setAttribute("pagina", String.valueOf(numPagina));
        req.setAttribute("qtdPagina", (int) qtdPagina);

        ArrayList<ClienteLista> lista = ClienteController.listarClientesPaginado(offset);
        req.setAttribute("lista", lista);
        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/cliente/listarCliente.jsp");
        rd.forward(req, resp);
        return "";
    }
}
