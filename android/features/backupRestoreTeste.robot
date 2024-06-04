*** Settings ***

Resource    ../base.robot
Resource    ../utils/commons.robot
Resource    ../page/backupRestorePage.robot

*** Variables ***

*** Test Cases ***
CT01 - Gerar Relatório de Backup 
    Dado que estou na tela inicial
    E clico em Menu
    E seleciono clicando em Backup
    E ao ser direcionado clico em Gerar Backup
    E confirmo em Ok   
    Então seleciono enviar e escolher aplicação para envio


CT02 - Restaurar backup 
    Dado que estou na tela inicial
    E clico em Menu
    E clico no botão Restore
    E clico em selecionar arquivo 
    E seleciono o arquivo de backup
    Então alerta para confirmar restauração
    E clico em sim 
    Então eu visualizo mensagem de confirmação


