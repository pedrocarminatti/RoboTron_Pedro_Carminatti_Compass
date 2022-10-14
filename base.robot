*** Settings ***
Library     RequestsLibrary
Resource    ./usuarios_keywords.robot 
Resource    ./login_keywords.robot  
Resource    ./produtos_keywords.robot  
Resource    ./common.robot   

*** Test Cases ***
Cenario: GET Todos os Usuarios 200
    [Tags]    GET
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"
    Printar Conteudo Response

Cenario: POST Criar Novo Usuario 201
    [Tags]    POST
    Criar Sessao
    POST Endpoint /usuarios
    Validar Status Code "201"

Cenario: GET Usuario Especifico 200
    [Tags]    GET
    Criar Sessao
    GET Endpoint /usuarios com id "B87r6dEn5Qpjh5Np"
    Validar Status Code "200"

Cenario: PUT Editar Usuario Especifico 200
    [Tags]    PUT
    Criar Sessao
    PUT Endpoint /usuarios com id "NDl4eSvnf0CaP1hP"
    Validar Status Code "200"

Cenario: DELETE Excluir Usuario Especifico 200
    [Tags]    DELETE
    Criar Sessao
    DELETE Endpoint /usuarios com id "NDl4eSvnf0CaP1hP"
    Validar Status COde "200"

Cenario: POST Realizar Login
    [Tags]    POSTLOGIN
    Criar Sessao
    POST Endpoint /login
    Validar Status Code "200"

Cenario: POST Cadastrar Produto 201
    [Tags]    POSTPRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"

Cenario: DELETE Excluir Produto 200
    [Tags]    DELETEPRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar um Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"

Cenario: POST Criar Usuario de Massa Estatica 201
    [Tags]    POSTCRIARUSUARIOESTATICO
    Criar Sessao
    Criar Usuario Estatico Valido
    Validar Status Code "201"

*** Keywords ***
Criar Sessao
    Create Session    serverest    https://serverest.dev