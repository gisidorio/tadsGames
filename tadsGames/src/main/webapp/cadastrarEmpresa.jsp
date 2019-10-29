<%-- 
    Document   : cadastrarEmpresa
    Created on : 10/10/2019, 17:54:51
    Author     : thiago.srocha4
--%>

<%@page import="java.util.List"%>
<%@page import="br.com.unidospi.model.EstadoRegiao"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset = "utf-8">
        <title>Cadastro de Empresa</title>
       <link rel="stylesheet" type="text/css" href="css/formularios.css">
        
    </head>
    <body>
        <div class="container">
            <h2 class="titulo">Cadastre a Empresa</h2>
            <form action="\TadsGames\input?action=CadastrarEmpresa" method="post">
                <div>
                    <label>Nome Empresa</label>
                    <input  type="text" name="nome" required maxlength="50">
                    <c:if test="${erroNome}">
                        <div class="erro-input com-erro">
                            Digite menos que 50 caracteres
                        </div>
                    </c:if>

                </div>
                <div>
                    <label>CNPJ</label>
                    <input type="text" name="cnpj" required>
                    <c:if test="${erroCNPJ}">
                        <div class="erro-input com-erro">
                            Digite menos que 50 caracteres
                        </div>
                    </c:if>
                </div>
                <div>
                    <label>Data de Cria��o</label>
                    <input type="date" name="dataCriacao" required>

                </div>
                <div>

                    <select name="estado" required="">
                        <option disabled selected="">Escolha a UF</option>
                        <c:forEach var="uf" items="${ufs}">
                            <option value="${uf.getId()}"><c:out value="${uf.getUf()}"/></option>
                        </c:forEach>
                    </select>

                </div>
                <div>
                    <select name="cidade" required="">
                        <option disabled selected="">Escolha a Cidade</option>
                        <c:forEach var="cid" items="${cids}">
                            <option value="${cid.getIdCidade()}"><c:out value="${cid.getNomeCidade()}"/></option>
                        </c:forEach>
                    </select>

                </div>
                <div>
                    <label> Status da Empresa:</label>
                    <input type="radio" name="status" value="true" checked="">
                    <label>Ativa</label>
                    <input type="radio" name="status" value="false">
                    <label>Inativa</label>

                </div>
                <%--<div>
                    <h2 class="titulo"> Empresa Matiz:</h2>
                    <input type="radio" name="matriz" value="true" id="matrizSim">
                    <label for="matrizSim">Sim</label>
                    <input type="radio" name="matriz" value="false" id="matrizNao" checked="">
                    <label for="matrizNao">N�o</label>
                </div>--%>
                 <div class="teste">
                        <button type="submit">Cadastrar</button>
                        <button type="reset">Resetar dados</button>
                        <button type="submit" ><a href="${pageContext.request.contextPath}">Sair</a></button>
                        <!--<a href="#" role="button">Cancelar</a>-->
                    </div>
                        
            </form>
        </div>
    </body>
</html>
