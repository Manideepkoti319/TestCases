*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}    https://catfact.ninja
${city}    fact

*** Test Cases ***
Get_WeatherInfo
    create session    mySession    ${base_url}
    ${response} =    GET On Session    mySession    /${city}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log To Console    ${response.headers}

    ${Status_Code}=    Set Variable    
    ${Status_Code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${Status_Code}    200

    ${content_type}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${content_type}    application/json
