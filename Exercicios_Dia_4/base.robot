*** Settings ***
Library        RequestsLibrary

*** Test Cases ***
Cenario: GET Todos os Usuarios 200
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"

Cenario: POST Criar Novo Usuario 201
    Criar Sessao
    POST Endpoint /usuarios com "Dados"
    Validar Status Code "201"

Cenario: GET Usuario Especifico 200
    Criar Sessao
    GET Endpoint /usuarios com id "J2Fit4E1A2Ex77kt"
    Validar Status Code "200"

Cenario: PUT Editar Usuario Especifico 200
    Criar Sessao
    PUT Endpoint /usuarios com id "J2Fit4E1A2Ex77kt"
    Validar Status Code "200"

Cenario: DELETE Excluir Usuario Especifico 200
    Criar Sessao
    DELETE Endpoint /usuarios com id "J2Fit4E1A2Ex77kt"
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

POST Endpoint /usuarios com "${data}"
    ${data}=    Create Dictionary  nome=Pedro    email=pedroluca22@teste.com    password=teste    administrador=false
    ${response}        POST On Session    serverest    /usuarios    json=${data}
    Set Global Variable    ${response}

PUT Endpoint /usuarios com id "${id}"
    ${data}=    Create Dictionary  nome=Pedro    email=pedroluca132@teste.com    password=teste    administrador=false
    ${response}        PUT On Session    serverest    /usuarios/${id}    json=${data}
    Set Global Variable    ${response}

DELETE Endpoint /usuarios com id "${id}"
    ${response}            DELETE On Session    serverest    /usuarios/${id}
    Set Global Variable    ${response}

Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}