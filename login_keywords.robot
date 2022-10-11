*** Settings ***
Library    RequestsLibrary

*** Variables ***
${email_login}       beltrano@qa.com.br
${password_login}    teste

*** Keywords ***
POST Endpoint /login
    ${data}                Create Dictionary    email=${email_login}    password=${password_login}
    ${response}            POST On Session    serverest    /login    json=${data}
    Log To Console         Response: ${response.content}
    Set Global Variable    ${response}