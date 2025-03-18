*** Settings ***
Library    SeleniumLibrary
Library    Collections
*** Keywords ***
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

Click Shopping cart container
    Click Element    shopping_cart_container


