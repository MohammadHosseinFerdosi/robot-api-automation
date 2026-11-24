*** Settings ***
Resource          ../../resources/api_keywords.robot
Suite Setup       Create API Session

*** Test Cases ***
Create Post Returns Created Payload
    &{payload}=    Create Dictionary
    ...    title=portfolio sample
    ...    body=created by robot api automation demo
    ...    userId=${1}
    ${response}=    POST Resource    /posts    ${payload}
    Response Status Should Be    ${response}    201
    JSON Field Should Equal    ${response}    $.title    portfolio sample
    Dictionary Should Contain Key    ${response.json()}    id
