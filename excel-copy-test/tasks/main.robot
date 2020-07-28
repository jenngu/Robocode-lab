*** Settings ***
Documentation   Excel robot. Stores data which is updated.
Resource        keywords.robot

*** Tasks ***
Copy Browser Table Content To Excel File
    Open Browser
    Create Excel File
    Close The Browser
