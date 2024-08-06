*** Settings ***
Library    RequestsLibrary
Library    Collections
*** Variables ***
${base_url}    https://api.restful-api.dev
${rel_url}    /objects/1
*** Test Cases ***
DEL_Testcase
    Create Session    mySession    ${base_url}
    ${response}=    DELETE On Session    mySession    ${rel_url}

    Log To Console    ${response.status_code}
    Log To Console    ${response.content}