*** Settings ***
Library    RequestsLibrary
Library    Collections
*** Variables ***
${base_url}    https://api.restful-api.dev
${rel_url}    /objects

*** Test Cases ***
POST_Testcase
    Create Session    mySession    ${base_url}
    ${body}=    Create Dictionary    name=Apple MacBook Pro 20    data= {"year": 2019,"price": 1849.99,"CPU model": "Intel Core i9","Hard disk size": "1 TB"}
    ${header}=    Create Dictionary    content_type=application/json
    ${response}=    POST On Session    mySession    ${rel_url}    json=${body}    headers=${header}

    Log To Console    ${response.status_code}
    Log To Console    ${response.content}




