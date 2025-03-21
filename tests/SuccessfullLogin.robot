*** Settings ***
Library    SeleniumLibrary
Resource    ../PO/Generic.robot
Resource    ../PO/LandingPage.robot
Test Setup    Open the page of Sauce demo
Test Teardown    Close Browser
Library    DataDriver    file=resources/validUserNamesData.csv
Test Template    Validate Successful Login
*** Variables ***
${valid_password}
*** Test Cases ***
Login with validUserName ${valid_username} and validPassword ${valid_password}
    
*** Keywords ***
Validate Successful Login
    Fill the login form    ${valid-username}    ${valid-password}
    Click Login Button
    Verify login is successful by switching to the home page
    Logout


    
    
    