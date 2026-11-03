# Segundo arquivo; 
# Contém os Steps BDD.#


*** Settings ***
Resource    ../pages/login_e_cadastro_pages.robot
*** Keywords ***
Dado a tela de login do sistema carregou
    visualizo a tela de login
E clicar no botao cadastrese
    clicar no botao cadastrese
QUANDO preencho a pagina de cadastro e escolho em modo adminstrador
    preecho todos os campos e clico cadastrar como administrador
E submiter no botão cadastro
    clicar no botão cadastrar
Então devo visualizar a Serverest Store
    visualizo a tela serverest store
Quando preencho a pagina de cadastro de produtos
    visualizo a tela com os produtos cadastrados