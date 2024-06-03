*** Settings ***

Resource    ../base.robot
Resource    ../utils/commons.robot
Resource    ../utils/config.robot

*** Variables ***
#NOVO PRODUTO
${Button_NOVO}            xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/Button1"]
${CAMPO_CODIGO}           xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_codigo"]
${CAMPO_DESCRICAO}        xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_descricao"]    
${CAMPO_UNIDADE}          xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_unidade"]
${CAMPO_QUANTIDADE}       xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_quantidade"]
${CAMPO_VALOR}            xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_valunit"]
${CAMPO_LOTE}             xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_lote"]
${VALIDADE}               xpath=//android.widget.TextView[@resource-id="br.com.pztec.estoque:id/data"]
${calendario_ANO}         xpath=//android.widget.TextView[@resource-id="android:id/date_picker_header_year"]   
${selecionar_2025}        xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="2025"]
${calendario_OK}          xpath=//android.widget.Button[@resource-id="android:id/button1"]  
${Button_SALVAR}          xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_gravar_assunto"]
#ATUALIZAR PRODUTO
${EDITAR_PRODUTO}         xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/editar"]
${ENTRADA_PRODUTO}        xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/entrada"]          
${ADICONAR_AO_ESTOQUE}    xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_qtdentrada"]
${MOTIVO_ADICINAR}        xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_motivo"]
${REFERENCIA_ENTRADA}         xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_referencia"]   
${SALVAR_AO_ESTOQUE}      xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_salvar"]  

${SAIDA_PRODUTO}          xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/saida"]
${DIMINUIR_ESTOQUE}       xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_qtdsaida"]
${MOTIVO_SAIDA}           xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_motivo"]
${REFERENCIA_SAIDA}       xpath=//android.widget.EditText[@resource-id="br.com.pztec.estoque:id/txt_referencia"]
${SALVAR_ESTOQUE_SAIDA}    xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/btn_salvar"]


#DELETAR PRODUTO
${DELET_PRODUTO}                        xpath=//android.widget.Button[@resource-id="br.com.pztec.estoque:id/deletar"]
${confirmar_DELET}                      xpath=//android.widget.ScrollView[@resource-id="android:id/buttonPanel"]/android.widget.LinearLayout  
${DELET_SIM}                            xpath=//android.widget.Button[@resource-id="android:id/button1"]
${DELET_NAO}                            xpath=//android.widget.Button[@resource-id="android:id/button2"]


*** Keywords ***

Dado que estou na tela inicial
    Abrir o aplicativo
E clico no botão +    
    Aguarda e clica    ${Button_NOVO}

Quando preencho o formulario de novo produto
        [Arguments]
        Input Text            ${CAMPO_CODIGO}            001
        Input Text            ${CAMPO_DESCRICAO}         Ventilador
        Input Text            ${CAMPO_UNIDADE}           40cm 
        Input Text            ${CAMPO_QUANTIDADE}        10
        Input Text            ${CAMPO_VALOR}             R$149,90
        Input Text            ${CAMPO_LOTE}              De_Primeira 1
        Aguarda e clica       ${VALIDADE}
        Aguarda e clica       ${calendario_ANO}
        Aguarda e clica       ${selecionar_2025}   
        Aguarda e clica       ${calendario_OK}
        Aguarda e clica       ${Button_SALVAR}

Entao o produto é cadastrado com sucesso

Quando tento criar um produto sem preencher os campos obrigatórios
    Aguarda e clica          ${Button_NOVO}
    Input Text            ${CAMPO_CODIGO}            002
    Input Text            ${CAMPO_UNIDADE}           50cm
    # Campo quantidade não preenchido
    # Campo valor não preenchido
    Input Text            ${CAMPO_LOTE}              De_Primeira 1
    Aguarda e clica       ${VALIDADE}
    Aguarda e clica       ${calendario_ANO}
    Aguarda e clica       ${selecionar_2025}
    Aguarda e clica       ${calendario_OK}

Então o produto não deve ser salvo    
    Aguarda e clica       ${Button_SALVAR}


















# Quando preencho o formulario de cadastro
#     [Arguments]    ${login}    ${password}
#     Input Text        ${CAMPO_EMAIL}      ${login}    
#     Input Text        ${CAMPO_PASSWORD}    ${password}
#     Input Text        ${CAMPO_PASSWORD2}   ${password}
#     Click Element     ${BTN_CADASTRO} 

# Entao o usuario e cadastrado com sucesso
#     Wait Until Element Is Visible   ${CADASTRO_SUCESSO}
#     Element Should Contain Text     ${CADASTRO_SUCESSO}    You successfully signed up!

# Entao devo visualizar o aviso sobre email incorreto
#     Wait Until Element Is Visible   ${EMAIL_INVALIDO}
#     Element Should Contain Text     ${EMAIL_INVALIDO}    Please enter a valid email address

# Entao devo visualizar o aviso sobre a senha fora do padrao desejado
#     Wait Until Element Is Visible    ${SENHA_INCORRETA}
#     Element Should Contain Text      ${SENHA_INCORRETA}    Please enter at least 8 characters
#     Wait Until Element Is Visible    ${SENHA_INCORRETA2}
#     Element Should Contain Text      ${SENHA_INCORRETA2}   Please enter the same password