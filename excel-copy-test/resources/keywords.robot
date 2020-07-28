*** Settings ***
Library         RPA.Browser
Library         RPA.Tables
Library         Collections
Library         RPA.Excel.Files
Variables       variables.py

# +
*** Keywords ***
Open Browser
    Open Available Browser    ${URL}
     
*** Keywords ***
Create Excel File
    ${table}=    Create Workbook    test_table.xlsx
    Set Worksheet Value    1    1     Order
    Set Worksheet Value    1    2     Region
    Set Worksheet Value    1    3     Rep
    Set Worksheet Value    1    4     Item
    Set Worksheet Value    1    5     Unit
    Set Worksheet Value    1    6     UnitCost
    Set Worksheet Value    1    7     Total
    Go Over Table     ${table}
    Save Workbook

*** Keywords ***
Go Over Table
    [Arguments]     ${table}
    ${rows}=     Get Element Count    xpath://div[@class='col-lg-8']//table/tbody/tr       
    FOR     ${index}     IN RANGE    2     ${rows}+1
        ${list}=    Create List
        Fill Excel Table     ${list}    ${index}    ${table}
    END
    
*** Keywords ***
Fill Excel Table
    [Arguments]     ${list}    ${index}    ${table}
    FOR    ${i}    IN RANGE    1     8
        ${content}=      Get Text     xpath://div[@class='col-lg-8']//table/tbody/tr[${index}]/td[${i}]
        Append To List      ${list}     ${content} 
    END 
    ${row}=     Create List    ${list}
    Append Rows To Worksheet     ${row}
    
*** Keywords ***
Close The Browser
    Close Browser
# -


