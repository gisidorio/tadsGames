/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.unidospi.Acoes;

import br.com.unidospi.Controller.RelatoriosController;
import br.com.unidospi.model.RelatorioGeral;
import br.com.unidospi.model.RelatorioTop10;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author thiago.srocha4
 */
public class RelatorioDiario implements Executavel{

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        ArrayList<RelatorioTop10> rel_top10_vendas_dia = RelatoriosController.rel_top10_vendas_dia();
        ArrayList<RelatorioGeral> relatorioDiario = RelatoriosController.relatorioDiario();
        
        float totalDiario = RelatoriosController.totalDia();
        req.setAttribute("top10", rel_top10_vendas_dia);
        req.setAttribute("relatorioDiario", relatorioDiario);
        req.setAttribute("totalDiario", totalDiario);
        HttpSession sessao = req.getSession();
        
        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/Relatorio/RelatorioDiario.jsp");
        rd.forward(req, resp);
        sessao.removeAttribute("top10DetalheEmpresa");
        sessao.removeAttribute("top10Empresa");
        return "";
    }
    
    
    
}
