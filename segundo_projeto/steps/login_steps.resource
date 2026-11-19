*** Settings ***
Resource    ../resources/config.resource
Resource    ../api/usuario_api.resource
Resource    ../pages/login_page.resource

*** Keywords ***
Dado que existe um usuario cadastrado
    Buscar Usuario Existente Via API

E estou na pagina de login
    Abrir pagina de login

Dado estou na pagina de login
    Abrir pagina de login

Quando informo credenciais validas
    Preencher email    ${EMAIL_USUARIO}    ${SENHA_USUARIO}

E solicito o login
    Clicar no botao entrar

Então deve visualizar a pagina inicial
    Deve visualizar a pagina inicial

E deve visualizar a segunda pagina
    Deve visualizar a segunda pagina

Então Clicar no botão adicionar a lista
    clicar no botão adicionar a lista

E Deve visualizar a pagina lista de compras
    deve visualizar a pagina lista de compras
