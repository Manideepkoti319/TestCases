*** Settings ***
Library    RequestsLibrary
Library    Collections
*** Variables ***
${BASE_URL}    https://api.restful-api.dev
*** Test Cases ***
Put_Response
    Create Session    mySession    ${BASE_URL}
    ${body}=    Create Dictionary    name=Apple MacBook Pro 16    data={"year": 2019, "price": 2049.99, "CPU model": "Intel Core i9", "Hard disk size": "1 TB", "color": "silver"}
    ${header}=    Create Dictionary    Content-Type=application/json
    ${response}=    PUT On Session    mySession    /objects/ff80818191028543019103de2d2d0403    json=${body}    headers=${header}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200





