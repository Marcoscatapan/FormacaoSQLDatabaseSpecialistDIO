# 3️⃣ Construindo seu Primeiro Projeto Lógico de Banco de Dados

Neste projeto, você irá replicar a modelagem do projeto lógico de banco de dados para o cenário de e-commerce. Fique atento às definições de chave primária e estrangeira, assim como as constraints presentes no cenário modelado.

📝 Etapas do Projeto

1. Modelagem do Esquema Lógico: Replicar a modelagem do projeto lógico de banco de dados para o cenário de e-commerce, aplicando o mapeamento de modelos aos refinamentos propostos no módulo de modelagem conceitual.

2. Script SQL: Criar um script SQL para a criação do esquema do banco de dados, incluindo todas as tabelas, relacionamentos e restrições necessárias.

3. Persistência de Dados: Realizar a persistência de dados para realizar testes e garantir o funcionamento correto do banco de dados.

🏗️ Implementação do Esquema Lógico

Tabelas Principais:

- Clientes: Armazena informações sobre os clientes do e-commerce.

- Produtos: Contém dados dos produtos disponíveis para venda.

- Pedidos: Registra informações sobre os pedidos feitos pelos clientes.

- ItensPedido: Tabela associativa para registrar os produtos em cada pedido.

- Pagamentos: Informações sobre os pagamentos realizados pelos clientes.

- Estoque: Detalhes sobre o estoque dos produtos.

- Fornecedores: Registra informações sobre os fornecedores dos produtos.

- Vendedores: Contém dados dos vendedores da loja.


Relacionamentos:

- Cliente -> Pedido: Um cliente pode fazer um ou vários pedidos.

- Pedido -> ItensPedido -> Produto: Um pedido pode conter um ou vários produtos.

- Produto -> Estoque: Um produto está associado a uma entrada no estoque.

- Pedido -> Pagamento: Um pedido pode ter um ou vários pagamentos.

- Produto -> Fornecedor: Um produto pode ser fornecido por um ou vários fornecedores.

- Pedido -> Vendedor: Um pedido pode ser atendido por um ou vários vendedores.

🧪 Queries Complexas

Algumas queries mais complexas para explorar a funcionalidade do banco de dados:

1. Recuperar todos os pedidos feitos por um cliente específico.

2. Encontrar os produtos mais vendidos no último mês.

3. Calcular o total de vendas por categoria de produto.

📋 Síntese do Projeto

Este README fornece uma visão geral do projeto de construção do esquema lógico de um banco de dados para um cenário de e-commerce. Se precisar de mais detalhes sobre as etapas do projeto ou tiver alguma dúvida, sinta-se à vontade para entrar em contato.
