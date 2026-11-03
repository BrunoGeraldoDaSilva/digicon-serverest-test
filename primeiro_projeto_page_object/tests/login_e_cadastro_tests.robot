# Primeiro arquivo;
# Contém os testes (cenarios).#

language: pt-br
*** Settings ***
Resource    ../steps/login_e_cadastro_steps.robot
Resource    ../resources/comum.robot

Test Setup       Abrir Navegador
Test Teardown    Fechar Navegador
*** Test Cases ***
Login com sucesso
    Dado a tela de login do sistema carregou
    E clicar no botao cadastrese
    QUANDO preencho a pagina de cadastro e escolho em modo adminstrador
    E submiter no botão cadastro
    Então devo visualizar a Serverest Store
    Quando preencho a pagina de cadastro de produtos