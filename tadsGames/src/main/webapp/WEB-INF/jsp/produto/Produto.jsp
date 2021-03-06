<%-- 
    Document   : Produto
    Created on : Oct 11, 2019, 7:46:21 PM
    Author     : marcoaureli - loc-b
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro de Produto</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" charset="utf-8">
       <link rel="stylesheet" type="text/css" href="../css/formularios.css">
       <link rel="icon" href="../img/icon-controle-pequeno.png">
    </head>
    <body>

        

        <div class="container">
            <h2 class="titulo">Cadastro de Produtos</h2>
            <form method="post" action="${pageContext.request.contextPath}/tads/inputProduto?action=CadastrarProduto">
                
                    
                
                <label for="nome">Nome</label>
                <input type="text" maxlength="50" id="nome" name="nome" value="" placeholder="Digite o nome do produto..." >                
                <c:if test="${erroNome}">
                    <div class="erro-input com-erro">
                        Digite mais de 1 caracter e menos de 50 caracteres
                    </div>
                </c:if>
                
                <label for="tipo">Tipo</label>
                <select id="tipo" name="tipo" required="">
                    <option selected disabled> Selecione o tipo de produto</option>
                    <option value="Componente">Componente</option>
                    <option value="Console">Console</option>
                    <option value="Jogo">Jogo</option>
                </select>
                <c:if test="${erroTipo}">
                    <div class="erro-input com-erro">
                        � obrigat�rio selecionar um tipo de produto
                    </div>
                </c:if>

                <br><br>
                <label for="descricao">Descricao</label><br>
                <textarea cols="30" rows="5" name="descricao" placeholder = "Escreva a descricao do produto aqui..."></textarea>
                

                 
                <label for="ativo">Ativo</label>
                <input type="radio" id="status" name="ativo" value="true" checked >
                <label for="inativo">Inativo</label>
                <input type="radio" id="status" name="ativo" value="false" ><br><br>
                
                <div class="teste">
                        <button type="submit">Cadastrar</button>
                        <button type="reset">Resetar dados</button>
                        <a href="${pageContext.request.contextPath}/home"><button type="button">Sair</button></a>
                        <!--<a href="#" role="button">Cancelar</a>-->
                    </div>
                

                
            </form>
        </div>

    </body>
</html>
