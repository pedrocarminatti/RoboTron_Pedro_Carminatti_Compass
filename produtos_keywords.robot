*** Settings ***
Library    RequestsLibrary

*** Variables ***
${token_auth}    Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImJlbHRyYW5vQHFhLmNvbS5iciIsInBhc3N3b3JkIjoidGVzdGUiLCJpYXQiOjE2NjU1MjcyOTUsImV4cCI6MTY2NTUyNzg5NX0.EkQSr7lt2KxOpPBjhAzFYACDnpwsTdDgPxtwuI2Zr8E

*** Keywords ***
POST Endpoint /produtos
    ${header}              Create Dictionary    Authorizathion=${token_auth}
    ${data}                Create Dictionary    nome=MouseGamerTeste    preco=400    descricao=Mouse    quantidade=100
    ${response}            POST On Session    serverest    /produtos    json=${data}    headers=${header}
    Log To Console         Response: ${response.content}
    Set Global Variable    ${response}