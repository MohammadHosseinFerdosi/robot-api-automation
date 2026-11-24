*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections
Variables         variables.py

*** Keywords ***
Create API Session
    Create Session    api    ${BASE_URL}    disable_warnings=1

GET Resource
    [Arguments]    ${path}
    ${response}=    GET On Session    api    ${path}    expected_status=any
    RETURN    ${response}

POST Resource
    [Arguments]    ${path}    ${payload}
    ${response}=    POST On Session    api    ${path}    json=${payload}    expected_status=any
    RETURN    ${response}

Response Status Should Be
    [Arguments]    ${response}    ${expected}
    Should Be Equal As Integers    ${response.status_code}    ${expected}

JSON Field Should Equal
    [Arguments]    ${response}    ${json_path}    ${expected}
    ${value}=    Get Value From Json    ${response.json()}    ${json_path}
    Should Be Equal    ${value}[0]    ${expected}
