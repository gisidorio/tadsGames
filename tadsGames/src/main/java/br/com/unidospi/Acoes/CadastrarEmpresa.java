/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.unidospi.Acoes;

import static br.com.unidospi.Acoes.ValidaCNPJ.isCNPJ;
import br.com.unidospi.model.Empresa;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gisidorio
 */
public class CadastrarEmpresa implements Executavel {

    /**
     *
     * @param req
     * @param resp
     * @return
     * @throws IOException
     * @throws ServletException
     */
    @Override
    public String executa(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        boolean retorno = false;
        int idEstado = 0;
        int idCidade = 0;
        
        String nome = req.getParameter("nome");
        String cnpj = req.getParameter("cnpj");
        String strDataCriacao = req.getParameter("dataCriacao");
        boolean status = Boolean.valueOf(req.getParameter("status"));
        boolean matriz = Boolean.valueOf(req.getParameter("matriz"));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Date dataCriacao = null;
        try {
            dataCriacao = sdf.parse(strDataCriacao);
        } catch (ParseException ex) {
            ex.getMessage();
        }
        //VALIDAÇÃO PROVISÓRIA------------------------------------------------
        boolean validacaoServidor = false;
        boolean validarCNPJ = isCNPJ(cnpj);
        if (nome.length() < 1 || nome.length() > 70) {
            validacaoServidor = true;
            req.setAttribute("erroNome", true);
        }else if (nome.substring(0,1).matches("[A-z]*") == false){
            validacaoServidor = true;
            req.setAttribute("validacaoNome2", true);
        }
        if (cnpj.length() < 1 || cnpj.length() > 14 || validarCNPJ == false){
            validacaoServidor = true;
            req.setAttribute("erroCNPJ", true);
        }
        if (dataCriacao == null){
            validacaoServidor = true;
            req.setAttribute("erroData", true);
        }
        if (req.getParameter("estado") == null){
            validacaoServidor = true;
            req.setAttribute("erroUF", true);
        }
        else
            idEstado = Integer.parseInt(req.getParameter("estado"));
        if (req.getParameter("cidade") == null){
            validacaoServidor = true;
            req.setAttribute("erroCidade", true);
        }
        else 
            idCidade = Integer.parseInt(req.getParameter("cidade"));
        //--------------------------------------------------------------------------
        if (validacaoServidor) {

            RequestDispatcher dispatcher
                    = req.getRequestDispatcher("input?action=FormCadastrarEmpresa ");
            dispatcher.forward(req, resp);
        }
        else{

        Empresa empr = new Empresa(nome, cnpj, dataCriacao, idEstado, idCidade, status, matriz);
        retorno = empr.salvar();
        }
        if (retorno) {
            resp.sendRedirect("sucesso.html");
        }
        return "";
    }

}
