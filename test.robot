*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables ***
${url}    https://10.137.18.24:30880
${locator}    id=txtUsername

*** Test Cases ***
Test Chrome
    [Tags]    Chrome
    Open Chrome
    Go To    ${url}
    Wait Until Element Is Visible    ${locator}    30s
    Sleep    1s
    Capture Page Screenshot    chrome.png

Test Firefox
    [Tags]    Firefox
    Open Firefox
    Go To    ${url}
    Wait Until Element Is Visible    ${locator}    30s
    Sleep    1s
    Capture Page Screenshot    firefox.png

*** Keywords ***
Open Chrome
    ${chromeOptions}    Evaluate    {'goog:chromeOptions':{'args':['headless','no-sandbox','disable-gpu']}}
    Open Browser    about:blank    chrome    desired_capabilities=${chromeOptions}
    Set Window Size    1366    768

Open Firefox
    Open Browser    about:blank    headless firefox
    Set Window Size    1366    768
