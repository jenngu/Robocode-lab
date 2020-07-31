# -*- coding: utf-8 -*-
*** Settings ***
Library     RPA.Excel.Files
Library     DateTime
Library     Cells.py
Library     Process
Variables   variables.py

# +
*** Keywords ***
Process Excel File
    Create Workbook     workbook2.xlsx
    Save Workbook
    Start Process    Cells
    
    #Process Table    ${updated_table}

Process Table
    [Arguments]    ${updated_table}
    ${tmp_date} =	Get Current Date
    ${date}=     Convert Date     ${tmp_date}     exclude_millis=yes	 result_format=%d.%m.%Y 
    #Set Worksheet Value    1   1    HINNASTO
    #Set Worksheet Value    1   2    Myyntihinta
    #Set Worksheet Value    1   3    7002
    #Set Worksheet Value    1   4    Päivitetty ${date}
    
    Open Workbook      ${updated_table}
    Open Workbook      ${excel_file_path}
    ${table}=       Read Worksheet As Table     
    Close Workbook
    FOR    ${row}    IN      @{table}  
        Log     ${row}
        Append Rows To Worksheet   ${row}    
    END
    
Fill New Table
    [Arguments]   ${updated_table}     ${table}    ${row}     
    Set Worksheet Value    ${row}     ${column}     
    
    END
    
   
# -


