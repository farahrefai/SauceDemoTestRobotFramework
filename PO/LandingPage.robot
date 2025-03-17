*** Settings ***
Library    SeleniumLibrary
*** Variables ***


*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    user-name       ${username}
    Input Password    password    ${password}
    
Click Login Button
    Click Button    login-button

Verify login is successful by switching to the home page
    Page Should Contain    Products
    
Wait Until Error Message Is Displayed
    Wait Until Element Is Visible     ${error_message_login} 
    
Verify error message is correct
    Element Should Contain    ${error_message_login}    Epic sadface: Username and password do not match any user in this service

Verify error message required username is correct
    Element Should Contain    ${error_message_login}    Epic sadface: Username is required

Verify error message required password is correct
    Element Should Contain    ${error_message_login}    Epic sadface: Password is required

Verify error message locked out user is correct
    Element Should Contain    ${error_message_login}    Epic sadface: Sorry, this user has been locked out.
