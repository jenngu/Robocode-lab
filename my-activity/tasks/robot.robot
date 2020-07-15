*** Settings ***
Documentation   Simple robot to demonstrate the use of the Item
Library         RPA.Robocloud.Items

*** Tasks ***
Demonstrate how to read and write variables in the work item
    Load Work Item From Environment
    ${message}=    Get Work item Variable    message
    Log    ${message}
    Set Work Item Variable    myString     Hello to you too!
    Save Work Item
