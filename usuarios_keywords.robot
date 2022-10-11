*** Settings ***
Library    RequestsLibrary

*** Variables ***
${nome_usuario}    pedroluca
${senha_usuario}    teste
${email_usuario}    pedrolucateste@teste.com

*** Keywords ***
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