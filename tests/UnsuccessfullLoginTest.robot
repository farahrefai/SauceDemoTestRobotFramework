*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library    DataDriver    file=../resources/InvalidUserNamesData.csv    encoding=utf_8    dialect=unix
Resource    ../PO/Generic.robot
Resource    ../PO/LandingPage.robot
Test Setup    Open the page of Sauce demo
Test Teardown    Close Browser
Test Template    Validate Unsuccessful Login

*** Test Cases ***
Login with user ${username} and password ${password}

*** Keywords ***
Validate Unsuccessful Login
    [Arguments]    ${username}    ${password}
    Fill the login form    ${username}    ${password}
    Click Login Button
    Wait Until Element Is Visible     ${error_message_login}
    

