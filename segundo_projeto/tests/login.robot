*** Settings ***
Resource      ../steps/login_steps.resource
Test Teardown    Fechar navegador

*** Test Cases ***
Login com credenciais validas
    Dado que existe um usuario cadastrado
    E estou na pagina de login
    Quando informo credenciais validas
    E solicito o login
    Então deve visualizar a pagina inicial
    E deve visualizar a segunda pagina
    Então clicar no botão adicionar a lista
    E deve visualizar a pagina lista de compras
