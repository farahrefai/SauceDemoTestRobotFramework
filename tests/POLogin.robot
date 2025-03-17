*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Resource    ../PO/Generic.robot
Resource    ../PO/LandingPage.robot
Test Setup    Open the page of Sauce demo


*** Variables ***
${lockedOut-username}    locked_out_user
${invalid-username}    farahrefai
${invalid-password}    hgvjhqs
${empty-username}      ${EMPTY}
${empty-password}     ${EMPTY}
${valid-username with leading spaces}    '   standard_user'
${valid-username with Trailing spaces}    'standard_user   '
${valid-password with Leading spaces}    '    secret_sauce'
${valid-password with Trailing spaces}    'secret_sauce   '
${error_message_login}    css:.error-message-container


*** Test Cases ***
Validate Successful Login with Valid Users
    FOR    ${valid-username}    IN    @{valid-usernames}
        Log    "Testing login with username: ${valid-username}"
        Fill the login form    ${valid-username}    ${valid-password}
        Click Login Button
        Verify login is successful by switching to the home page
        Logout
    END

Validate Unsuccessful Login with LockedOut username
    LandingPage.Fill the login form    ${lockedOut-username}    ${valid-password}
    LandingPage.Click Login Button
    LandingPage.Wait Until Error Message Is Displayed
    LandingPage.Verify error message locked out user is correct

Validate Unsuccessful Login with Invalid username
    LandingPage.Fill the login form    ${invalid-username}    ${valid-password}
    LandingPage.Click Login Button
    LandingPage.Wait Until Error Message Is Displayed
    LandingPage.Verify error message is correct

Validate Unsuccessful Login with Invalid password
    LandingPage.Fill the login form    ${valid-username}    ${invalid-password}
    LandingPage.Click Login Button
    LandingPage.Wait Until Error Message Is Displayed
    LandingPage.Verify error message is correct

Validate Unsuccessful Login with Empty username
    LandingPage.Fill the login form    ${empty-username}    ${valid-password}
    LandingPage.Click Login Button
    LandingPage.Wait Until Error Message Is Displayed
    LandingPage.Verify error message required username is correct

Validate Unsuccessful Login with empty password
    LandingPage.Fill the login form    ${valid-username}    ${empty-password}
    LandingPage.Click Login Button
    LandingPage.Wait Until Error Message Is Displayed
    LandingPage.Verify error message required password is correct

Validate Unsuccessful Login with empty username and password
    LandingPage.Fill the login form    ${empty-username}    ${empty-password}
    LandingPage.Click Login Button
    LandingPage.Wait Until Error Message Is Displayed
    LandingPage.Verify error message required username is correct

Validate Unsuccessful Login with Leading Spaces in username
    LandingPage.Fill the login form    ${valid-username with leading spaces}    ${valid-password}
    LandingPage.Click Login Button
    LandingPage.Wait Until Error Message Is Displayed
    LandingPage.Verify error message is correct

Validate Unsuccessful Login with Trailing Spaces in username
    LandingPage.Fill the login form    ${valid-username with Trailing spaces}    ${valid-password}
    LandingPage.Click Login Button
    LandingPage.Wait Until Error Message Is Displayed
    LandingPage.Verify error message is correct

Validate Unsuccessful Login with Leading Spaces in password
    LandingPage.Fill the login form    ${valid-username}    ${valid-password with Leading spaces}
    LandingPage.Click Login Button
    LandingPage.Wait Until Error Message Is Displayed
    LandingPage.Verify error message is correct

Validate Unsuccessful Login with Trailing Spaces in password
    LandingPage.Fill the login form    ${valid-username}    ${valid-password with Trailing spaces}
    LandingPage.Click Login Button
    LandingPage.Wait Until Error Message Is Displayed
    LandingPage.Verify error message is correct