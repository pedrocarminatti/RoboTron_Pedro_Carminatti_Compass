*** Settings ***
Library        RequestsLibrary

*** Variables ***
${nome_usuario}    pedroluca
${senha_usuario}    teste
${email_usuario}    pedrolucateste@teste.com

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
    GET Endpoint /usuarios com id "0uxuPY0cbmQhpEz1"
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

*** Keywords ***
Criar Sessao
    Create Session        serverest    https://serverest.dev

GET Endpoint /usuarios
    ${response}            GET On Session    serverest    /usuarios
    Set Global Variable    ${response}

GET Endpoint /usuarios com id "${id}"
    ${response}            GET On Session    serverest    /usuarios/${id}
    Set Global Variable    ${response}

POST Endpoint /usuarios
    ${data}=    Create Dictionary  nome=${nome_usuario}    email=${email_usuario}    password=${senha_usuario}    administrador=false
    ${response}        POST On Session    serverest    /usuarios    json=${data}
    Set Global Variable    ${response}

PUT Endpoint /usuarios com id "${id}"
    ${data}=        Create Dictionary  nome=${nome_usuario}    email=${email_usuario}    password=${senha_usuario}    administrador=false
    ${response}        PUT On Session    serverest    /usuarios/${id}    json=${data}
    Set Global Variable    ${response}

DELETE Endpoint /usuarios com id "${id}"
    ${response}        DELETE On Session    serverest    /usuarios/${id}
    Log To Console        Response: ${response.content}
    Set Global Variable    ${response}

Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}

Printar Conteudo Response
    Log To Console    Nome:${response.json()["usuarios"][2]["nome"]}