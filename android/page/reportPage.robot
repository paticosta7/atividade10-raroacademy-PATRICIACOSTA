*** Settings ***

Resource    ../base.robot
Resource    ../utils/commons.robot
Resource    ../utils/config.robot


*** Variables ***
${MENU}                       id=br.com.pztec.estoque:id/Button3
${botao_RELATORIO}            id=br.com.pztec.estoque:id/btn_relatorios
# inventario de estoque
${INVENTARIO}                 id=br.com.pztec.estoque:id/inventario
${GERAR_PDF}                  id=br.com.pztec.estoque:id/btn_gerar  
${confirmacao_PDF}            id=br.com.pztec.estoque:id/datafile
${VISUALIZAR_PDF}             id=br.com.pztec.estoque:id/btn_abrir   
${ENVIAR_PDF}                 id=br.com.pztec.estoque:id/btn_email

#entradas no estoque
${ENTRADAS_ESTOQUE}           id=br.com.pztec.estoque:id/relentrada 
${DATA_INICIAL}               id=br.com.pztec.estoque:id/data1 
${DATA_ANO}                   id=android:id/date_picker_header_year 
${selecionar_23}              xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="2023"]
${OK_ano}                     id=android:id/button1
${CALENDARIO-OK}              id=android:id/button1  
${DATA_FINAL}                 id=br.com.pztec.estoque:id/data2
${data_atual_OK}              id=android:id/button1  
${PDF_GERAR}                  id=br.com.pztec.estoque:id/btn_gerar  
${PDF_confirmacao}            id=br.com.pztec.estoque:id/datafile
${PDF_VISUALIZAR}             id=br.com.pztec.estoque:id/btn_abrir
${PDF_ENVIAR}                 id=br.com.pztec.estoque:id/btn_email

# saídas do estoque
${SAIDAS_ESTOQUE}            id=br.com.pztec.estoque:id/relsaida
${Selecao_DIA}               xpath=//android.view.View[@content-desc="01 junho 2024"]

*** Keywords ***
Dado que acessei paginal incial do app e selecionei Menu
    Abrir o aplicativo
    Aguarda e clica        ${MENU}  

E seleciono a função relatório
    Aguarda e clica    ${botao_RELATORIO}    

E clico em Inventário de estoque
    Aguarda e clica    ${INVENTARIO}

Então gero arquivo PDF e visualizo mensagem de confirmação
    Aguarda e clica    ${GERAR_PDF}
    Element Should Contain Text    ${confirmacao_PDF}      inventario.pdf gerado

E clico em entradas no estoque
    Aguarda e clica    ${ENTRADAS_ESTOQUE}

 E seleciono a data inicial e final 
     Aguarda e clica    ${DATA_INICIAL} 
     Aguarda e clica    ${DATA_ANO} 
     Aguarda e clica    ${selecionar_23}
     Aguarda e clica    ${OK_ano}   
     Aguarda e clica    ${DATA_FINAL}  
     Aguarda e clica    ${data_atual_OK}
     Aguarda e clica    ${PDF_GERAR} 

 Então gero arquivo PDF e visualizo mensagem confirmando    
     Element Should Contain Text    ${PDF_confirmacao}     relatentrada.pdf gerado em
    
Então é possivel visualizar o arquivo PDF e selecionar uma aplicação
    Page Should Contain Element    ${PDF_VISUALIZAR}  
    

E enviar arquivo PDF por e-mail
    Page Should Contain Element   ${PDF_ENVIAR}    


E clico em saídas de estoque
    Aguarda e clica    ${SAIDAS_ESTOQUE} 


E seleciono período para contabilizar estoque
    Aguarda e clica    ${DATA_INICIAL} 
    Aguarda e clica    ${Selecao_DIA}  
    Aguarda e clica    ${OK_ano}   
    Aguarda e clica    ${DATA_FINAL}  
    Aguarda e clica    ${data_atual_OK}

Então meu arquivo PDF é gerado e confirmando com mensagem
     Element Should Contain Text    ${PDF_confirmacao}     relatsaida.pdf gerado em


E consigo visualizar o PDF ao selecionar uma aplicação
    Page Should Contain Element    ${PDF_VISUALIZAR}  

E enviar PDF por e-mail ou outras aplicações
    Page Should Contain Element   ${PDF_ENVIAR}  