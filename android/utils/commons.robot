*** Settings ***

Resource    ../base.robot


*** Keywords ***

Aguarda e clica
    [Arguments]    ${elemento}
    
    Wait Until Element Is Visible    ${elemento}
    Sleep    3s
    Click Element    ${elemento}