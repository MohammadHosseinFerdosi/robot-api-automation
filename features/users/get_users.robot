*** Settings ***
Resource          ../../resources/api_keywords.robot
Suite Setup       Create API Session

*** Test Cases ***
List Users Returns Collection
    ${response}=    GET Resource    /users
    Response Status Should Be    ${response}    200
    ${count}=    Get Length    ${response.json()}
    Should Be True    ${count} >= 1

User Email Looks Like Email
    ${response}=    GET Resource    /users/1
    Response Status Should Be    ${response}    200
    ${email}=    Get Value From Json    ${response.json()}    $.email
    Should Contain    ${email}[0]    @
