*** Settings ***
Library    RequestsLibrary
Library    Collections
*** Variables ***
${BASE_URL}    https://api.restful-api.dev
*** Test Cases ***
POST_Objects
    Create Session    mySession    ${BASE_URL}
    ${body}=    Create Dictionary    { "name": "Apple MacBook Pro 16",  "data": {  "year": 2019,  "price": 1849.99, "CPU model": "Intel Core i9", "Hard disk size": "1 TB"} }
    ${header}=    Create Dictionary    Content-Type=application/json
    ${response}=    POST On Session    mySession    /objects    json=${body}    headers=${header}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    # Validations
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200




