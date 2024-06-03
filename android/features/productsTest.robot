*** Settings ***
Resource        ../base.robot
Resource        ../utils/config.robot                
Resource    ../page/cadastroPage.robot


Test Setup       Abrir o aplicativo
Test Teardown    Fechar o aplicativo
*** Variables ***

*** Test Cases ***

T01 - Cadastrar novo produto    
    Dado que estou na tela inicial    
    E clico no botão + 
    Quando preencho o formulario de novo produto 
    Entao o produto é cadastrado com sucesso  

T02 - Cadastrar novo produto sem preencher campos obrigatórios
    Dado que estou na tela inicial    
    E clico no botão + 
    Quando tento criar um produto sem preencher os campos obrigatórios
    Então o produto não deve ser salvo    

T03 - Casdastrar produto duplicado


T04 - Casdastrar produto com dados inválidos


T05 - Atualizar informações de um produto com sucesso


T06 - Atualizar produto com dados inválidos


T07 - Excluir produto existente


