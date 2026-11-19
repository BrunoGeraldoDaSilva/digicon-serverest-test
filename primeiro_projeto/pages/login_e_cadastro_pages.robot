#Terceiro arquivo;
# Contém as pages.#

*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/variaveis.robot
*** Variables ***
# BOTÕES XPATH
${BOTAO_CADASTRE_SE}           xpath=//*[@id="root"]/div/div/form/small/a
${BOTAO_CADASTRAR}             xpath=//*[@id="root"]/div/div/form/div[5]/button
${BOTAO_CADASTRAR_PRODUTOS}    xpath=//*[@id="root"]/div/div/p[2]/div[4]/div/div/a

# CADASTRO DE USUARIOS
${NOME}                    Bruno silva
${EMAIL_VALIDO}            bruno.silva@perto.com.br
${SENHA_CORRETA}           perto
${ADMINISTRADOR}           True

# CADASTRO DE PRODUTOS
${CAMPO_NAME2}             id=nome
${CAMPO_PRECO}             id=price
${CAMPO_DESCRICAO}         id=description
${CAMPO_QUANTIDADE}        id=quantity

*** Keywords ***
visualizo a tela de login
    Page Should Contain    Login
   
clicar no botao cadastrese
    Click Element    ${BOTAO_CADASTRE_SE}

preecho todos os campos e clico cadastrar como administrador
    Input Text      ${CAMPO_NOME}                 ${NOME}
    Input Text      ${CAMPO_EMAIL}                ${EMAIL_VALIDO}
    Input Password  ${CAMPO_SENHA}                ${SENHA_CORRETA}
    Run Keyword If  ${ADMINISTRADOR}      
    ...    Select Checkbox      ${CHECK_ADMINISTRADOR}
    

clicar no botão cadastrar
    Click Button    ${BOTAO_CADASTRAR}

visualizo a tela serverest store
    Wait Until Page Contains            Bem Vindo  timeout=10s

visualizo a tela com os produtos cadastrados
    Click Element    ${BOTAO_CADASTRAR_PRODUTOS}
    Input Text       ${CAMPO_NAME2}               ${NAME2}
    Input Text       ${CAMPO_PRECO}               ${PRICE}
    Input Text       ${CAMPO_DESCRICAO}           ${DESCRIPTION}
    Input Text       ${CAMPO_QUANTIDADE}          ${QUANTITY}
    
    Choose File     id:imagem    /run/media/bruno/DA401A1E401A01C5/PYTHON/RobotPerto/academy_automacao/projeto02/tests/results/imagens/radio.jpg
    Click Element   css=[data-testid="cadastarProdutos"]
    Capture Page Screenshot
    