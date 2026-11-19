*** Settings ***
Resource    ../resources/config.resource

*** Keywords ***
Buscar Usuario Existente Via API
    [Documentation]    Busca na API um usuário já cadastrado e guarda os dados
    ...                em variáveis globais para serem usados no login.
    [Arguments]    ${administrador}=false

    Create Session    api    ${URL_API}

    ${params}=    Create Dictionary    administrador=${administrador}
    ${response}=    GET On Session    api    /usuarios
    ...    params=${params}    expected_status=200

    Should Be True    ${response.json()}[quantidade] > 0
    ...    msg=Nenhum usuário existente encontrado (administrador=${administrador}).

    ${usuario}=    Set Variable    ${response.json()}[usuarios][0]

    VAR    ${NOME_USUARIO}     ${usuario}[nome]        scope=GLOBAL
    VAR    ${EMAIL_USUARIO}    ${usuario}[email]       scope=GLOBAL
    VAR    ${SENHA_USUARIO}    ${usuario}[password]    scope=GLOBAL
    VAR    ${ID_USUARIO}       ${usuario}[_id]         scope=GLOBAL

    Log    Usuário encontrado: ${NOME_USUARIO} | ${EMAIL_USUARIO} | ID: ${ID_USUARIO}
