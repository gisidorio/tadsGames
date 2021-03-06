<%-- 
    Document   : CadastrarUsuario
    Created on : Nov 2, 2019, 1:00:23 PM
    Author     : gabri
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>Cadastro de Usuário</title>
        <link rel="icon" href="../img/icon-controle-pequeno.png">
        <link rel="stylesheet" type="text/css" href="../css/formularios.css"
    </head>
    <body>
        <div class="container">
            <h2 class="titulo">Cadastro de Usuário</h2>
            <form method="post" action="${pageContext.request.contextPath}/tads/inputUsuario?action=CadastrarUsuario">
                <input type="hidden" name="idFuncionario" value="${f.idFuncionario}">
                <label for="nome">Login</label>                
                <input type="text" maxlength="50" id="nome" name="login" placeholder="Digite um nome de usuario..." >                

                <c:if test="${validacaoNome}">
                    <div class="erro-input com-erro">
                        Digite mais de 1 caracter e menos de 50 caracteres
                    </div>
                </c:if>
                <c:if test="${validacaoNome2}">
                    <div class="erro-input com-erro">
                        É permitido somente caracteres numericos e alfabeticos sem acentuação
                    </div>
                </c:if>

                <label for="nome">Senha</label>                
                <input type="password" maxlength="50" id="senha" name="senha" placeholder="Digite um nome de usuario..." >                

                <c:if test="${erroSenha}">
                    <div class="erro-input com-erro">
                        Digite mais de 5 caracter e menos de 16 caracteres
                    </div>
                </c:if> 
                
                <c:if test="${erroSenha2}">
                    <div class="erro-input com-erro">
                        É permitido somente caracteres numericos e alfabeticos sem acentuação
                    </div>
                </c:if>
                
                <div>
                    <input type="radio" name="status" value="true" checked="">
                    <label>Ativo</label>
                    <input type="radio" name="status" value="false">
                    <label>Inativo</label>

                </div>
                
                <div class="teste">
                        <button type="submit">Cadastrar</button>
                        <button type="reset">Resetar dados</button>
                        <a href="${pageContext.request.contextPath}/home"><button type="button">Sair</button></a>
                    </div>                               
            </form>
        </div>

    </body>
</html>
