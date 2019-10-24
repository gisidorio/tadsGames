<%-- 
    Document   : AlterarFuncionario
    Created on : Oct 15, 2019, 11:56:56 PM
    Author     : gabri
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/formularios.css">
</head>
<body>

<div class="container">
  <form method="post" action="${pageContext.request.contextPath}/inputFuncionario?action=EditarFuncionario">
      <h1>Cadastro de Funcion�rios</h1> 
      <input type="hidden" name="idFuncionario" value="${funcionario.id}">
    <label for="nome">Nome</label>
    <input type="text" id="nome" name="nome" value="${funcionario.nome}">
    
    <label for="sobrenome">Sobrenome</label>
    <input type="text" id="sobrenome" name="sobrenome" value="${funcionario.sobrenome}">

    <label for="cpf">CPF</label>
    <input type="text" id="cpf" name="cpf" value="${funcionario.cpf}">
    
    <label for="dtNasc">Data de Nascimento</label>
    <input type="date" id="dtNasc" name="dtNasc" value="${funcionario.dtNasc}">
    
    <label for="login">Login</label>
    <input type="text" id="login" name="login" value="${funcionario.login}">
    
    <label for="senha">Senha</label>
    <input type="password" id="senha" name="senha" value="${funcionario.senha}">
    
    <label for="salario">Salario</label>
    <input type="text" id="salario" name="salario" value="${funcionario.salario}">
    
    <label for="depto">Departamento</label>
    <input type="text" id="depto" name="depto" value="${funcionario.departamento}">   
    
    <label for="tpEmpresa">Empresa</label>
    <select id="empresa" name="tpEmpresa">
        <option selected value="${funcionario.idEmpresa}">${funcionario.nomeEmpresa}</option>
        <c:forEach items="${empresas}" var="empresa">
            <c:if test="${empresa.idEmpresa != funcionario.idEmpresa}">
                <option value="${empresa.idEmpresa}">${empresa.nome}</option>
            </c:if>
        </c:forEach>
    </select>
    
    <label for="tpFuncionario">Cargo</label>
    <select id="tpFuncionario" name="tpFuncionario">
        <option selected value="${funcionario.cargo}">${funcionario.cargo}</option> 
        <c:if test="${funcionario.cargo == 'Diretor'}">
            <option value="Funcionario Administrativo">Funcion�rio Administrativo</option>
            <option value="Funcionario TI">Funcion�rio TI</option>
            <option value="Funcionario Venda">Funcion�rio Venda</option>
            <option value="Funcionario Retaguarda">Funcion�rio Retaguarda</option>
            <option value="Gerente Global">Gerente Global</option>
        </c:if>
        <c:if test="${funcionario.cargo == 'Funcionario Administrativo'}">
            <option value="Diretor">Diretor</option>
            <option value="Funcionario TI">Funcion�rio TI</option>
            <option value="Funcionario Venda">Funcion�rio Venda</option>
            <option value="Funcionario Retaguarda">Funcion�rio Retaguarda</option>
            <option value="Gerente Global">Gerente Global</option>
        </c:if>
        <c:if test="${funcionario.cargo == 'Funcionario TI'}">
            <option value="Diretor">Diretor</option>
            <option value="Funcionario Administrativo">Funcion�rio Administrativo</option>
            <option value="Funcionario Venda">Funcion�rio Venda</option>
            <option value="Funcionario Retaguarda">Funcion�rio Retaguarda</option>
            <option value="Gerente Global">Gerente Global</option>
        </c:if>
        <c:if test="${funcionario.cargo == 'Funcionario Venda'}">
            <option value="Diretor">Diretor</option>
            <option value="Funcionario Administrativo">Funcion�rio Administrativo</option>
            <option value="Funcionario TI">Funcion�rio TI</option>
            <option value="Funcionario Retaguarda">Funcion�rio Retaguarda</option>
            <option value="Gerente Global">Gerente Global</option>
        </c:if>
        <c:if test="${funcionario.cargo == 'Funcionario Retaguarda'}">
            <option value="Diretor">Diretor</option>
            <option value="Funcionario Administrativo">Funcion�rio Administrativo</option>
            <option value="Funcionario TI">Funcion�rio TI</option>
            <option value="Funcionario Venda">Funcion�rio Venda</option>
            <option value="Gerente Global">Gerente Global</option>
        </c:if>
        <c:if test="${funcionario.cargo == 'Gerente Global'}">
            <option value="Diretor">Diretor</option>
            <option value="Funcionario Administrativo">Funcion�rio Administrativo</option>
            <option value="Funcionario TI">Funcion�rio TI</option>
            <option value="Funcionario Venda">Funcion�rio Venda</option>
            <option value="Funcionario Retaguarda">Funcion�rio Retaguarda</option>
        </c:if>
    </select>
    
    <div>
        <p>Sexo</p>
        <c:if test="${funcionario.sexo == 'Masculino'}">
            <input type="radio" name="sexo" value="Masculino" checked>
            <label>Masculino</label>
            <input type="radio" name="sexo" value="Feminino">
            <label>Feminino</label>
        </c:if>
        <c:if test="${funcionario.sexo == 'Feminino'}">
            <input type="radio" name="sexo" value="Masculino">
            <label>Masculino</label>
            <input type="radio" name="sexo" value="Feminino" checked>
            <label>Feminino</label>
        </c:if> 
    </div>

    <div>
        <p>Status</p>
        <c:if test="${funcionario.status == true}">
            <input type="radio" name="status" value="true" checked>
            <label>Ativo</label>
            <input type="radio" name="status" value="false">
            <label>Inativo</label>   
        </c:if>
        <c:if test="${funcionario.status == false}">
            <input type="radio" name="status" value="true">
            <label>Ativo</label>
            <input type="radio" name="status" value="false" checked>
            <label>Inativo</label>   
        </c:if>                                
    </div>
    <br>
    <button type="submit">Enviar</button>        
  </form>
</div>

</body>
</html>