*** Settings ***
Library    SeleniumLibrary
Test Setup    Open the page of Sauce demo 
Test Template    Validate successfull login
*** Variables ***
${browser_name}    Chrome
${url}    https://www.saucedemo.com/
${valid-password}    secret_sauce

*** Test Cases ***            Accepted-username
standardUser                  standard_user
lockedOutUser                 locked_out_user
problemUser                   problem_user
performanceUser               performance_glitch_user
errorUser                     error_user
visualUser                    visual_user

*** Keywords ***
Validate successfull login
    [Arguments]    ${Accepted-username}
    Fill the login form    ${Accepted-username}    ${valid-password}
    Click Login Button
    Verify login is successful by switching to the home page    

*** Keywords ***
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    user-name       ${username}
    Input Password    password    ${password}
    
Click Login Button
    Click Button    login-button
    
Verify login is successful by switching to the home page
    Page Should Contain    Products
            
Open the page of Sauce demo
    Create Webdriver    ${browser_name}
    Go To    ${url}
