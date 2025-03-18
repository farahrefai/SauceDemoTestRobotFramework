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
Click Finish Button
    Click Button    finish

Verify Successfull Message Order Is Correct
    Element Text Should Be    xpath://div[@class='complete-text']    Your order has been dispatched, and will arrive just as fast as the pony can get there!