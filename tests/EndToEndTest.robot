*** Settings ***
Library    SeleniumLibrary
Library    ../customLibraries/Shop.py
Test Setup    Open the page of Sauce demo
Suite Teardown    Close Browser
Resource    ../PO/Generic.robot
Resource    ../PO/ShoppingPage.robot
Resource    ../PO/CheckoutPage.robot

*** Variables ***
@{listOfProducts}       Sauce Labs Bolt T-Shirt    Sauce Labs Fleece Jacket
*** Test Cases ***
End to end ecommerce product validation
    [Tags]    REGRESSION
    Fill The Login Form    ${valid-username}    ${valid-password}
    Click Login Button
    Wait Until Element Is Located In The Page
    Verify Card Titles in the shop page
    Verify Product Prices
    Add Items To Card And Verify Badge   ${listOfProducts}
    Click Shopping cart container
    Click Button Checkout
    Fill the checkout Form
    Click Continue Button
    Verify Checkout Total
    Click Finish Button
    Verify Successfull Message Order Is Correct

