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
Validate Cards display in the Shopping Page
    Fill The Login Form    ${username}    ${password}
    Click Login Button
    Wait Until Element Is Located In The Page
    Verify Card Titles in the shop page
    Add Items To Card And Checkout    ${listOfProducts}

*** Keywords ***

Fill The Login Form
    [Arguments]    ${username}    ${password}
    Input Text    user-name       ${username}
    Input Password    password    ${password}

Click Login Button
    Click Button    login-button

Wait Until Element Is Located In The Page
    Wait Until Element Is Visible    css:.title

Verify Card Titles in the shop page
    @{expected-List}=    Create List    Sauce Labs Backpack    Sauce Labs Bike Light     Sauce Labs Bolt T-Shirt    Sauce Labs Fleece Jacket    Sauce Labs Onesie    Test.allTheThings() T-Shirt (Red)
    ${elements}=    Get Webelements    css:.inventory_item_name 
    @{actual-List}=    Create List    
    FOR    ${element}    IN      @{elements}
        Log    ${element.text}
        Append To List    ${actual-List}    ${element.text}
    END
    Lists Should Be Equal    ${actual-List}    ${expected-List}

#Add Items To Card And Checkout
    #[Arguments]    ${productName}
    #${index}=    Set Variable    1
    #${elements}=    Get Webelements    css:.inventory_item_name
    #FOR    ${element}    IN    @{elements}
        #Exit For Loop If    '${productName}' == '${element.text}'
        #${index}=    Evaluate    ${index} + 1
    #END
    #Click Button    xpath:(//div[@class='pricebar']/button)[${index}]


Open the page of Sauce demo
    Create Webdriver    ${browser_name}
    Go To    ${url}

        

