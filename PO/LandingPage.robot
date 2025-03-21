
*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
Verify login is successful by switching to the home page
    Element Text Should Be    css:.title    Products