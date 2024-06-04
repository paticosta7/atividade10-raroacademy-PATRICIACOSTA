*** Settings ***

Resource    ../base.robot
Resource    ../utils/commons.robot
Resource    ../utils/config.robot

*** Variables ***
${MENU}                          xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button3"]
${BACKUP}                        id=br.com.pztec.estoque:id/btn_backup
${GERAR_backup}                  id=br.com.pztec.estoque:id/btn_gerar

${alerta_CONCLUIDA}              id=android:id/alertTitle
${botão_OK}                      id=android:id/button1
${ENVIAR}                        id=br.com.pztec.estoque:id/btn_send


${RESTORE}                        id=br.com.pztec.estoque:id/btn_restore
${PROCURAR}                       id=br.com.pztec.estoque:id/btn_procurar
${ESTOQUE}                        xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="Estoque"]
${confirmar_RESTAURACAO}          xpath=//android.widget.TextView[@resource-id="android:id/alertTitle"]

${ARQUIVO_BKP}                    xpath=//android.widget.TextView[contains(@text,'APP')][last()]
${SIM_restauração}                id=android:id/button1
${alerta_CONFIRMA}                id=android:id/message
${OK_Restauracao}                 id=android:id/button1

*** Keywords ***
Dado que estou na tela inicial
    Abrir o aplicativo

E clico em Menu
    Aguarda e clica        ${MENU}  

E seleciono clicando em Backup
    Aguarda e clica        ${BACKUP}    

E ao ser direcionado clico em Gerar Backup
    Aguarda e clica                ${GERAR_backup}

E confirmo em Ok    
    Click Element            ${botão_OK}    

Então seleciono enviar e escolher aplicação para envio
    Aguarda e clica   ${ENVIAR}
 
E clico no botão Restore
    Aguarda e clica    ${RESTORE}

E clico em selecionar arquivo 
    Aguarda e clica    ${PROCURAR}
    
 E seleciono o arquivo de backup
     Swipe    550    2300   550    1200
     Aguarda e clica    ${ESTOQUE}
     Aguarda e clica    ${ARQUIVO_BKP}  
Então alerta para confirmar restauração     
    Element Should Contain Text          ${confirmar_RESTAURACAO}        Confirma a restauração

E clico em sim 
    Sleep    3
    Aguarda e clica    ${SIM_restauração}

 Então visualizo mensagem de confirmação e clico em ok
    Click Element     ${OK_Restauracao}