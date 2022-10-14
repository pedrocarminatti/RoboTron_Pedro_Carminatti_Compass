*** Settings ***
Library    RequestsLibrary

*** Keywords ***
POST Endpoint /produtos
    ${header}              Create Dictionary    Authorization=${token_auth}
    ${data}                Create Dictionary    nome=MouseRazerTestaaa    preco=250    descricao=Mouse    quantidade=100
    ${response}            POST On Session    serverest    /produtos    json=${data}    headers=${header}
    Log To Console         Response: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /produtos
    ${header}              Create Dictionary    Authorization=${token_auth}
    ${response}            DELETE On Session    serverest    /produtos/${id_produto}    headers=${header}
    Log To Console         Response: ${response.content}
    Set Global Variable    ${response}

Validar Ter Criado Produto
    Should Be Equal        ${response.json()["message"]}    Cadastro realizado com sucesso
    Should Not Be Empty    ${response.json()["authorization"]}  

Criar um Produto e Armazenar ID
    POST Endpoint /produtos
    Validar Ter Criado Produto
    ${id_produto}          Set Variable    ${response.json()["_id"]}
    Log To Console         ID Produto: ${id_produto}
    Set Global Variable    ${id_produto}