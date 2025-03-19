*** Settings ***
Library    SeleniumLibrary
Library    ../customLibraries/Shop.py
Resource    ../PO/Generic.robot
Resource    ../PO/ShoppingPage.robot
Test Setup    Open the page of Sauce demo
*** Variables ***
@{listOfProducts}       Sauce Labs Bolt T-Shirt    Sauce Labs Fleece Jacket

*** Test Cases ***
Validate Cards display in the Shopping Page
    Fill The Login Form    ${valid-username}    ${valid-password}
    Click Login Button
    Wait Until Element Is Located In The Page
    Verify Card Titles in the shop page
    Verify Product Prices
    Add Items To Card And Verify Badge    ${listOfProducts}


        

