*** Settings ***
Documentation    Bitfinex

Library    SeleniumLibrary    timeout=10s    implicit_wait=5s

*** Variables ***
${home_page_url}    https://www.bitfinex.com/
${ico_table_ticker_search}    //div[@role='tablist']//a[@class='landing-tickers__search']
${txt_table_ticker_search}    //div[@class='bp3-input-group landing-tickers__search-group']//input[@placeholder='Search']
${cel_first_result}    //td[@class='symbol-col symbol-cell']
${lbl_ticker_on_ticker_details}    //span[normalize-space()='Tickers']
${btn_allow_cookies}    //span[normalize-space()='Allow Cookies']
${btn_agree_cookies}    //button[@class='bp3-button']

*** Test Cases ***
Bitfinex_01
    [Documentation]    Bitfinex
    [Tags]     Test
    Open Browser    ${home_page_url}    browser=chrome
    Maximize Browser Window
    Run Keyword And Ignore Error    Click Element    ${btn_allow_cookies}
    Run Keyword And Ignore Error    Click Element    ${btn_agree_cookies}
    Click Element    ${ico_table_ticker_search}
    Input Text    ${txt_table_ticker_search}    Unus Sed Leo
    Click Element    ${cel_first_result}
    Wait Until Element Is Visible    ${lbl_ticker_on_ticker_details}
    ${page_url}    Get Location
    Should Be Equal    ${page_url}    https://trading.bitfinex.com/t/LEO:USD?type=exchange
    Close All Browsers