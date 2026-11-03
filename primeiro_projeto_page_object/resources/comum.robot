#Quinto arquivo
#Arquivos reutilizáveis.#

*** Settings ***
Library    SeleniumLibrary
Resource   variaveis.robot
*** Keywords ***
Abrir Navegador
    Open Browser               ${URL}      ${BROWSER}
    Maximize Browser Window
Fechar Navegador
    Close Browser