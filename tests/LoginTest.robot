*** Settings ***
Library    SeleniumLibrary
Test Setup    Open the page of Sauce demo
Test Teardown    Close Browser

*** Variables ***
${browser_name}    Chrome
${url}    https://www.saucedemo.com/
${valid-username}    standard_user
${valid-password}      secret_sauce
${invalid-username}    farahrefai
${invalid-password}    hgvjhqs
${empty-username}      ${EMPTY}
${empty-password}     ${EMPTY}
${valid-username with leading spaces}    '   standard_user'      
${valid-username with Trailing spaces}    'standard_user   '
${valid-password with Leading spaces}    '    secret_sauce'
${valid-password with Trailing spaces}    'secret_sauce   '
${error_message_login}    css:.error-message-container

*** Test Cases ***
Validate successfull login
    Fill the login form    ${valid-username}    ${valid-password}
    Click Login Button
    Verify login is successful by switching to the home page
Login with Invalid username
    Fill the login form    ${invalid-username}    ${valid-password}
    Click Login Button
    Wait Until Error Message Is Displayed
    Verify error message is correct

Login with Invalid password
    Fill the login form    ${valid-username}    ${invalid-password}
    Click Login Button
    Wait Until Error Message Is Displayed
    Verify error message is correct

Login with Empty username
    Fill the login form    ${empty-username}    ${valid-password}
    Click Login Button
    Wait Until Error Message Is Displayed
    Verify error message required username is correct

Login with empty password
    Fill the login form    ${valid-username}    ${empty-password}
    Click Login Button
    Wait Until Error Message Is Displayed
    Verify error message required password is correct
    
Login with empty username and password
    Fill the login form    ${empty-username}    ${empty-password}
    Click Login Button
    Wait Until Error Message Is Displayed
    Verify error message required username is correct

Login with Leading Spaces in username 
    Fill the login form    ${valid-username with leading spaces}    ${valid-password}
    Click Login Button
    Wait Until Error Message Is Displayed
    Verify error message is correct
    
Login with Trailing Spaces in username
    Fill the login form    ${valid-username with Trailing spaces}    ${valid-password}
    Click Login Button
    Wait Until Error Message Is Displayed
    Verify error message is correct
    
Login with Leading Spaces in password   
    Fill the login form    ${valid-username}    ${valid-password with Leading spaces}
    Click Login Button
    Wait Until Error Message Is Displayed
    Verify error message is correct  
    
Login with Trailing Spaces in password       
    Fill the login form    ${valid-username}    ${valid-password with Trailing spaces}
    Click Login Button
    Wait Until Error Message Is Displayed
    Verify error message is correct

*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    user-name       ${username}
    Input Password    password    ${password}

Click Login Button
    Click Button    login-button

Wait Until Error Message Is Displayed
    Wait Until Element Is Visible     ${error_message_login} 

Verify error message is correct
    Element Should Contain    ${error_message_login}    Epic sadface: Username and password do not match any user in this service

Verify error message required username is correct
    Element Should Contain    ${error_message_login}    Epic sadface: Username is required
    
Verify error message required password is correct
    Element Should Contain    ${error_message_login}    Epic sadface: Password is required

Open the page of Sauce demo
    Create Webdriver    ${browser_name}
    Go To    ${url}


Verify login is successful by switching to the home page
    Page Should Contain    Products
