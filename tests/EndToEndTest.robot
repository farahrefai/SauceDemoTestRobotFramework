*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    ../customLibraries/Shop.py
Test Setup    Open the page of Sauce demo
*** Variables ***
${browser_name}    Chrome
${url}    https://www.saucedemo.com/
${username}    standard_user
${password}    secret_sauce
@{listOfProducts}       Sauce Labs Bolt T-Shirt    Sauce Labs Fleece Jacket
*** Test Cases ***

Validate Successful Login
End to end ecommerce product validation

