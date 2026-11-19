*** Settings ***
Resource    ../resources/config.resource
*** Variables ***
${CAMPO_EMAIL}                id:email
${CAMPO_SENHA}                id:password
${BOTAO_ENTRAR}               css=[data-testid="entrar"]   
${BOTAO_ADICIONAR_LISTA}      css=[data-testid="adicionarNaLista"]
${TITULO}                     Login
${TITULO2}                    Serverest Store
${LISTA_COMPRAS}              Lista de Compras

*** Keywords ***
Abrir pagina de login
    Open Browser                    ${URL}            ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains        ${TITULO}

Fechar navegador
    Close All Browsers

Preencher email
    [Arguments]            ${email}        ${senha}
    Wait Until Element Is Visible            ${CAMPO_EMAIL}        
    Input Text                ${CAMPO_EMAIL}        ${email}

    Wait Until Element Is Visible        ${CAMPO_SENHA}
    Input Password                       ${CAMPO_SENHA}    ${senha}

Clicar no botao entrar
    Click Button                        ${BOTAO_ENTRAR}

Deve visualizar a pagina inicial
    Wait Until Page Does Not Contain        ${TITULO}
    Wait Until Element Is Visible       ${BOTAO_ADICIONAR_LISTA}    10s

Deve visualizar a segunda pagina       
    Wait Until Page Contains
    ...    ${TITULO2} 
    ...    timeout= 10s    
    ...    error= O sistema demora demais para carregar.  

Clicar no botão adicionar a lista
    Click Element                        ${BOTAO_ADICIONAR_LISTA}

Deve visualizar a pagina lista de compras
    Wait Until Page Contains        ${LISTA_COMPRAS}      
    Capture Page Screenshot
