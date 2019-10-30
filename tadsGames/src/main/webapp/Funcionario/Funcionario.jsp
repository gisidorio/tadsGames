<%-- 
    Document   : Funcionario
    Created on : Oct 5, 2019, 7:18:16 PM
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
  <form method="post" action="${pageContext.request.contextPath}/inputFuncionario?action=CadastrarFuncionario" novalidate>
      <h2 class="titulo">Cadastro de Funcion�rios</h2> 
      
    <label for="nome">Nome</label>
    <input type="text" id="nome" name="nome" placeholder="Digite seu nome...">
    <c:if test="${validacaoNome}">
        <div class="erro-input com-erro">
            Digite mais de 1 e menos de 50 caracteres
        </div>
    </c:if>
    <label for="sobrenome">Sobrenome</label>
    <input type="text" id="sobrenome" name="sobrenome" placeholder="Digite seu sobrenome...">
    <c:if test="${validacaoSobrenome}">
        <div class="erro-input com-erro">
            Digite mais de 1 e menos de 50 caracteres
        </div>
    </c:if>
    <label for="cpf">CPF</label>
    <input type="text" id="cpf" name="cpf" placeholder="Digite o CPF...">
    <c:if test="${validacaoCPF}">
        <div class="erro-input com-erro">
            Digite um CPF v�lido
        </div>
    </c:if>
    <label for="dtNasc">Data de Nascimento</label>
    <input type="date" id="dtNasc" name="dtNasc" placeholder="Digite o CPF...">
    <c:if test="${validacaoDtNasc}">
        <div class="erro-input com-erro">
            Escolha uma data v�lida
        </div>
    </c:if>
    <label for="salario">Salario</label>
    <input type="text" id="salario" name="salario" placeholder="Digite o salario...">
    <c:if test="${validacaoSalario}">
        <div class="erro-input com-erro">
            Defina um salario
        </div>
    </c:if>
    <label for="depto">Departamento</label>
    <input type="text" id="depto" name="depto" placeholder="Digite o departamento...">   
    <c:if test="${validacaoDept}">
        <div class="erro-input com-erro">
            Defina um departamento
        </div>
    </c:if>
    <label for="tpEmpresa">Empresa</label>
    <select id="empresa" name="tpEmpresa">
        <c:forEach items="${empresas}" var="empresa">
            <option value="${empresa.idEmpresa}">${empresa.nome}</option>
        </c:forEach>
    </select>
    <c:if test="${validacaoEmpresa}">
        <div class="erro-input com-erro">
            � obrigat�rio selecionar uma empresa
        </div>
    </c:if>
    <label for="tpFuncionario">Cargo</label>
    <select id="tpFuncionario" name="tpFuncionario">
      <option value="Diretor">Diretor</option>
      <option value="Funcionario Administrativo">Funcion�rio Administrativo</option>
      <option value="Funcionario TI">Funcion�rio TI</option>
      <option value="Funcionario Venda">Funcion�rio Venda</option>
      <option value="Funcionario Retaguarda">Funcion�rio Retaguarda</option>
      <option value="Gerente Global">Gerente Global</option>
    </select>
    <c:if test="${validacaoCargo}">
        <div class="erro-input com-erro">
            � obrigat�rio selecionar um cargo
        </div>
    </c:if>
    <div>
        <p>Sexo</p>
        <input type="radio" name="sexo" value="Masculino" checked="">
        <label>Masculino</label>
        <input type="radio" name="sexo" value="Feminino">
        <label>Feminino</label>                                   
    </div>

    <div>
        <p>Status</p>
        <input type="radio" name="status" value="true" checked="">
        <label>Ativo</label>
        <input type="radio" name="status" value="false">
        <label>Inativo</label>                                   
    </div>
    <button type="submit">Enviar</button>        
  </form>
</div>

</body>
</html>
