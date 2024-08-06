*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}=    https://api.restful-api.dev

*** Test Cases ***
DEL_Response
    Create Session    mySession    ${base_url}   
    ${response}=    DELETE On Session   mySession    /objects/ff80818191028543019103de2d2d0403

    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    ${Status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${Status_code}    200


    ${res_body}=    To JSON    ${response.content}
    ${message}=    Get From Dictionary    ${res_body}    message
    Should Be Equal    ${message}    Object with id = ff80818191028543019103de2d2d0403 has been deleted.


