*** Settings ***
Resource          ../../resources/api_keywords.robot
Suite Setup       Create API Session

*** Test Cases ***
List Posts Returns 100 Items
    ${response}=    GET Resource    /posts
    Response Status Should Be    ${response}    200
    ${count}=    Get Length    ${response.json()}
    Should Be Equal As Integers    ${count}    100

Get Single Post By Id
    ${response}=    GET Resource    /posts/1
    Response Status Should Be    ${response}    200
    JSON Field Should Equal    ${response}    $.id    ${1}
    JSON Field Should Equal    ${response}    $.userId    ${1}

Missing Post Returns 404
    ${response}=    GET Resource    /posts/999999
    Response Status Should Be    ${response}    404
