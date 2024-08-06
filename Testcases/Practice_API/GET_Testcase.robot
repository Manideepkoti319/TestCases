*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}    https://api.restful-api.dev
${rel_url}    objects/1

*** Test Cases ***
Get_Testcase
    Create Session    mySession    ${base_url}
    ${response}=    GET On Session    mySession    /${rel_url}

    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    
    ${is_status_code_equal}=    convert to String    ${response.status_code}
    Should Be Equal    ${is_status_code_equal}    200
    
    # #parse the json response
    # ${response_json}=    Evaluate    json.loads('''${response.text}''')
    
    # #Accessing first dict in list
    # ${first_obj}=    Get From List    ${response_json}    1

    # Log To Console    ${first_obj}
    
    # #Accessing name in dict
    # ${name}=    Get From Dictionary    ${first_obj}    name 

    # #Console the name
    # Log To Console    ${name}

