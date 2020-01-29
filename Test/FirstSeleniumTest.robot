*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
${Browser}    Chrome
&{Credentials}    username=Admin    password=admin123
&{elements}    username_field_id=txtUsername    password_field_id=txtPassword    login_button_id=btnLogin    welcome_id=welcome    logout_id=Logout

*** Test Cases ***
SampleLoginTest
    [Documentation]    This is a sample login test case
    Open Browser    ${URL}    ${Browser}
    Set Browser Implicit Wait    5
    Input Text    id=&{elements}[username_field_id]    &{Credentials}[username]    
    Input Text    id=&{elements}[password_field_id]    &{Credentials}[password]
    Click Button    id=&{elements}[login_button_id]
    Click Element    id=&{elements}[welcome_id]
    Set Browser Implicit Wait    2
    Click Element    link=&{elements}[logout_id]                
    Close Browser           
    Log    Test Completed Successfully
    Log    This test is performed by %{username} on %{os}
    