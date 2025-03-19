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

Verify Badge


Verify Product Prices
    @{expected_prices}=    Create List    $29.99    $9.99    $15.99    $49.99    $7.99    $15.99
    ${prices}=    Get Webelements    css:.inventory_item_price
    ${num_prices}    Get Length    ${prices}
     FOR    ${index}    IN RANGE    ${num_prices}
        ${price_text}    Get Text    ${prices}[${index}]
        ${expected_price}    Set Variable    ${expected_prices}[${index}]
        Should Be Equal    ${price_text}    ${expected_price}    The displayed price is incorrect: ${price_text} instead of ${expected_price}.
    END

Click Shopping cart container
    Click Element    shopping_cart_container


