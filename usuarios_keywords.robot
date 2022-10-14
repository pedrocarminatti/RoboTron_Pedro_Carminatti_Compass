*** Settings ***
Library     RequestsLibrary
Resource    ./common.robot

*** Variables ***
${nome_usuario}     pedroluca
${senha_usuario}    teste
${email_usuario}    pedrolucateste@teste.com

*** Keywords ***
GET Endpoint /usuarios
    ${response}                GET On Session    serverest    /usuarios
    Set Global Variable        ${response}

GET Endpoint /usuarios com id "${id}"
    ${response}                GET On Session    serverest    /usuarios/${id}
    Set Global Variable        ${response}

POST Endpoint /usuarios
    ${response}                POST On Session    serverest    /usuarios    json=${data}
    Log To Console             Response: ${response.content}
    Set Global Variable        ${response}

PUT Endpoint /usuarios com id "${id}"
    ${data}                    Create Dictionary  nome=${nome_usuario}    email=${email_usuario}    password=${senha_usuario}    administrador=false
    ${response}                PUT On Session    serverest    /usuarios/${id}    json=${data}
    Set Global Variable        ${response}

DELETE Endpoint /usuarios com id "${id}"
    ${response}                DELETE On Session    serverest    /usuarios/${id}
    Log To Console             Response: ${response.content}
    Set Global Variable        ${response}

Printar Conteudo Response
    Log To Console             Nome: ${response}

Criar Usuario Estatico Valido
    ${json}                    Importar JSON Estatico    json_usuario_ex.json
    ${data}                    Set Variable    ${json["user_valido"]}
    Set Global Variable        ${data}
    POST Endpoint /usuarios