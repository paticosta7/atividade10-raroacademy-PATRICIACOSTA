*** Settings ***
Resource     ../base.robot
Resource     ../utils/config.robot
Resource     ../page/reportPage.robot

Test Setup          Abrir o aplicativo
Test Teardown       Fechar o aplicativo

*** Test Cases ***

CT01 - Gerar relatório de inventario
    Dado que acessei paginal incial do app e selecionei Menu
    E seleciono a função relatório
    E clico em Inventário de estoque
    Então gero arquivo PDF e visualizo mensagem de confirmação

CT02 - Gerar relatório de entrada
    Dado que acessei paginal incial do app e selecionei Menu
    E seleciono a função relatório
    E clico em entradas no estoque
    E seleciono a data inicial e final 
    Então gero arquivo PDF e visualizo mensagem confirmando   
    Então é possivel visualizar o arquivo PDF e selecionar uma aplicação
    E enviar arquivo PDF por e-mail

CT03 - Gerar relatório de saidas
    Dado que acessei paginal incial do app e selecionei Menu
    E seleciono a função relatório    
    E clico em saídas de estoque
    E seleciono período para contabilizar estoque
    Então meu arquivo PDF é gerado e confirmando com mensagem
    E consigo visualizar o PDF ao selecionar uma aplicação
    E enviar PDF por e-mail ou outras aplicações