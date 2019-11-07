<%-- 
    Document   : formCompra
    Created on : 28/10/2019, 18:12:33
    Author     : thiago.srocha4
action="\TadsGames\inputVenda?action=CadastrarVenda"
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<!DOCTYPE html>
<html>
    <head>
        <title>Vendas</title>
        <link rel="stylesheet" type="text/css" href="css/telaVendas.css">
    </head>
    <body>
        <div class="insere-produto">
            <div class="insere-nome-produto">
                <input value=""  id="nomeProduto" type="text" name="nomeProduto" class="procuraNomeProduto" placeholder="Digite o Codigo ou nome do Item">
                <div class="divAutocomplete">
                    <table id="tbSource" hidden="">
                        
                        <tbody id="tbodyListaProdutos">
                            
                        </tbody>
                        
                    </table>
                </div>
                
            </div>
            <div class="Quantidade">
                <span>Quantidade</span>
                <input id="qtd" type="number"  min="0" name="qtd" class="dadosQtd" value="0">
            </div>
            <div class="QuantidadeEstoque">
                <span>Quantidade Estoque</span>
                <span id="SpanQtdEstoque">0,00</span>
            </div>
            <div class="valorUnitario">
                <span>Valor Unit�rio</span>
                <span  id="SpanvlrUnitario">0,00</span>
            </div>

            <div class="valorTotal">
                <span>Valor Total</span>
                <span id="vlrTotal" >0,00</span>
            </div>
            <div class="botao">
                <button id="add" class="add">Incluir Produto</button>
            </div>
        </div>
        <div class="tabelas-itens">
            <table id="tabela-detalhe-venda" class="tabela">
                <thead>
                <th>idProduto</th>
                <th>Produto</th>
                <th>Quantidade</th>
                <th>Valor Unitario</th>
                <th>Valor Total</th>
                <th>Add/Remover</th>
                </thead>
                <tbody id="tbodyDetalheVenda">
                </tbody>
            </table>

            <button id="salvar" class="salvar" >Salvar</button>

        </div>
        <script src="javaScript/autoCompleteProduto.js"></script>
        <script src="javaScript/addDetalheVenda.js"></script>
        
    </body>
</html>
