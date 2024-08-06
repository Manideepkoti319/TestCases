*** Settings ***
Library    RequestsLibrary
Library    Collections
*** Variables ***
${base_url}    https://api.restful-api.dev
${rel_url}    /objects/ff8081819107de7d01910815cb2c00c5
*** Test Cases ***
PUT_Testcase
    create session    mySession    ${base_url}
    ${body}=    Create Dictionary    name=Apple iPad    data= {"Generation":"4th","Price":"519.99","Capacity":"256 GB"}
    ${headers}=    Create Dictionary    content_type=application/json
    ${response}=    PUT On Session    mySession    ${rel_url}    json=${headers}

    Log To Console    ${response.status_code}
    Log To Console    ${response.content}