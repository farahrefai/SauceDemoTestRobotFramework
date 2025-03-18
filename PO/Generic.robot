*** Settings ***
Documentation    A resource file with reusable keywords and variables.
...              The system specific keywords created here from our own
...              domain specific language. They utilize keywords provided
...              the imported SeleniumLibrary.

Library    SeleniumLibrary
*** Variables ***
${browser_name}    Chrome
${url}    https://www.saucedemo.com
${valid-password}      secret_sauce
@{valid-usernames}    standard_user    visual_user    error_user    performance_glitch_user    problem_user
${valid-username}    standard_user

*** Keywords ***
Open the page of Sauce demo
    Create Webdriver    ${browser_name}
    Go To    ${url}
    
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    user-name       ${username}
    Input Password    password    ${password}
    
Click Login Button
    Click Button    login-button    

Logout
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    id=logout_sidebar_link    timeout=5s
    Click Element    id=logout_sidebar_link
    Wait Until Page Contains Element    id=login-button    timeout=5s