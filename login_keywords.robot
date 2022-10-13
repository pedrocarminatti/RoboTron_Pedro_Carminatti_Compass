*** Settings ***
Library    RequestsLibrary

*** Variables ***
${email_login}       fulano@qa.com
${password_login}    teste

*** Keywords ***
POST Endpoint /login
    ${data}                Create Dictionary    email=${email_login}    password=${password_login}
    ${response}            POST On Session    serverest    /login    json=${data}
    Log To Console         Response: ${response.content}
    Set Global Variable    ${response}

Validar Ter Logado
    Should Be Equal        ${response.json()["message"]}    Login realizado com sucesso
    Should Not Be Empty    ${response.json()["authorization"]}

Fazer Login e Armazenar Token
    POST Endpoint /login
    Validar Ter Logado
    ${token_auth}          Set Variable    ${response.json()["authorization"]}
    Log To Console         Token Salvo: ${token_auth}
    Set Global Variable    ${token_auth}