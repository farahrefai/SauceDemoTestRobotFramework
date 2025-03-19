*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
Click Button Checkout
    Click Button    checkout

Fill the checkout Form
    Input Text    first-name    Farah
    Input Text    last-name    Refai
    Input Text    postal-code    8065
Click Continue Button
    Click Button    continue

Verify Checkout Total
    ${prices}    Get WebElements    class=inventory_item_price
    ${calculated_total}    Set Variable    0.00
    FOR    ${price_element}    IN    @{prices}
        ${price_text}    Get Text    ${price_element}
        ${price_value}    Evaluate    float(${price_text.replace('$', '')})
        ${calculated_total}    Evaluate    ${calculated_total} + ${price_value}
    END
    ${displayed_total_text}    Get Text    xpath=//div[contains(@class, 'summary_subtotal_label')]
    ${displayed_total}    Evaluate    float(${displayed_total_text.split('$')[-1]})

    Should Be Equal As Numbers    ${calculated_total}    ${displayed_total}    The displayed total is incorrect: ${displayed_total} instead of ${calculated_total}


Click Finish Button
    Click Button    finish

Verify Successfull Message Order Is Correct
    Element Text Should Be    xpath://div[@class='complete-text']    Your order has been dispatched, and will arrive just as fast as the pony can get there!