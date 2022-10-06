* Test Cases *

Cenário: GET Todos os Produtos 200
    GET Endpoint /produtos 
    Validar todos os produtos na response
    Validar Status Code "200"

Cenário: GET Produto Especifico 200
    GET Endpoint /produtos com id "BeeJh5lz3k6kSIzA"
    Validar o produto com id "BeeJh5lz3k6kSIzA"
    Validar Status Code "200"
    Validar Mensagem "Nome = Logitech MX Vertical"

Cenário: POST Criar Novo Produto 201
    POST Endpoint /produtos usando Dados Dinâmicos
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"

Cenário: PUT Produto Existente 200
    PUT Endpoint /produtos com id "0uxuPY0cbmQhpEz1" Usando Dados Dinâmicos
    Validar Status Code "200"
    Validar Mensagem "Registro alterado com sucesso"

Cenário: DELETE Produto Existente 200
    DELETE Endpoint /produtos com id "0uxuPY0cbmQhpEz1"
    Validar Status Code "200"
    Validar Mensagem "Registro excluído com sucesso | Nenhum registro excluído"


