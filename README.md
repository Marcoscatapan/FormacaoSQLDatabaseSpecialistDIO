🛠️ Projeto Lógico de Banco de Dados: Oficina Autopeças

Neste projeto, você será o protagonista na construção do esquema lógico de um banco de dados para uma Oficina de autopeças. Utilizando o esquema conceitual criado no desafio do módulo de modelagem de BD com modelo ER, você irá definir todas as etapas desde o esquema até a implementação do banco de dados.

📝 Etapas do Projeto

Esquema Lógico: Utilize o esquema conceitual como base para criar o esquema lógico utilizando o modelo relacional.

Script SQL: Crie um script SQL para a criação do esquema do banco de dados, incluindo todas as tabelas, relacionamentos e restrições necessárias.

Persistência de Dados: Realize a persistência de dados para realizar testes e garantir o funcionamento correto do banco de dados.

🏗️ Implementação do Esquema Lógico

Tabelas Principais:
Clientes: Armazena informações sobre os clientes da loja.

Produtos: Contém dados dos produtos disponíveis na loja.

Pagamento: Registra informações sobre os pagamentos realizados pelos clientes.

Pedido: Contém detalhes sobre os pedidos feitos pelos clientes.

Estoque: Armazena o estoque de produtos da loja.

Fornecedor: Registra informações sobre os fornecedores dos produtos.

Vendedor: Contém dados dos vendedores da loja.

Relacionamentos:

Cliente -> Pedido: Um cliente pode fazer um ou vários pedidos.

Pedido -> Produto: Um pedido pode conter um ou vários produtos.

Produto -> Estoque: Um produto está associado a uma entrada no estoque.

Fornecedor -> Produto: Um fornecedor pode fornecer um ou vários produtos.

Vendedor -> Pedido: Um vendedor pode estar associado a um ou vários pedidos.


🧪 Queries Complexas
Além das queries básicas de seleção, você pode especificar algumas queries mais complexas para explorar a funcionalidade do banco de dados:

Recuperar todas as vendas realizadas em um determinado período de tempo.

Encontrar os produtos mais vendidos pela loja.

Calcular o total de vendas realizadas por cada vendedor.

📋 README do Projeto

Este README fornece uma visão geral do projeto de construção do esquema lógico de um banco de dados para uma Oficina de autopeças. Se precisar de mais detalhes sobre as etapas do projeto ou tiver alguma dúvida, sinta-se à vontade para entrar em contato.
