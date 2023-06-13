select * from cliente c ;
select * from cidade c ;
select * from categoria c ;
select * from endereco e ;
select * from produto p ;
select * from telefone ;
select * from venda;
select * from venda_produto vp ;

select cliente.nome, cidade.nome from cliente
inner join endereco on endereco.cidade = cliente.endereco
inner join cidade on cidade.id = endereco.cidade and cidade.nome = 'Imbituba';

select venda.id, venda.data_venda, cliente.nome from venda
inner join cliente on cliente.id = venda.cliente and cliente.nome = 'Cliente 2';

select produto.nome, categoria.descricao from produto
right join categoria on categoria.id = produto.categoria;

-- Relatório de vendas por produto
select venda_produto.venda, cliente.nome, produto.nome, sum(venda_produto.quantidade) as quantidade_vendida, 
sum(venda_produto.quantidade * produto.valor) as valor_da_compra
from venda_produto
inner join venda on venda_produto.venda = venda.id
inner join cliente on venda.cliente = cliente.id
inner join produto on venda_produto.produto = produto.id
group by venda_produto.venda, cliente.nome, produto.nome;

-- Relatório de comparação de estoque antigo e atual
select produto.nome, produto.estoque as estoque_antigo, produto.estoque - sum(venda_produto.quantidade) as estoque_atual
from venda_produto
inner join venda on venda_produto.venda = venda.id
inner join produto on venda_produto.produto = produto.id
group by produto.nome, produto.estoque;


-- Relatório de total de compras e total de gasto por cliente
SELECT cliente.nome AS cliente, COUNT(venda_produto.id) AS total_compras, 
SUM(venda_produto.quantidade * produto.valor) AS valor_total_gasto
FROM venda_produto
inner join venda on venda_produto.venda = venda.id
inner join cliente on venda.cliente = cliente.id
inner join produto on venda_produto.produto = produto.id
GROUP BY cliente.nome;

