*** Settings ***

Resource        ../base.robot

Library    AppiumLibrary

*** Variables ***
${ANDROID_PLATFORM_VERSION}           12
${APP_PACKAGE}                        com.google.android.permissioncontroller
${APP_ACTIVITY}                       com.android.permissioncontroller.permission.ui.GrantPermissionsActivity
${ANDROID_AUTOMATION_NAME}            UIAutomator2
${ANDROID_PLATFORM_NAME}              Android
${APPIUM_URL}                         http://127.0.0.1:4723
${DEVICE_NAME}                        ba17f27e


*** Keywords ***

Abrir o aplicativo
    Open Application    ${APPIUM_URL}    automationName=${ANDROID_AUTOMATION_NAME}     platformName=${ANDROID_PLATFORM_NAME}    
    ...    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    platformVersion=${ANDROID_PLATFORM_VERSION}

Fechar o aplicativo
    Run Keyword If Test Failed    Capture Page Screenshot
    Close All Applications