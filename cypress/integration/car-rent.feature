Feature: Car Rent

    As a car rent website user
    I want to choose a car
    So I can rent it for specified time

    Scenario: Case 1
        Given the user visits the Main Page
        When the user selects 'Poland' from 'Country' dropdown
        And the user selects 'Cracow' from 'City' dropdown
        And the user types 'A-Class' into 'Model' text field
        And the user types '2020-10-10' into 'Pickup' text field
        And the user types '2020-11-11' into 'DropOff' text field
        And the user clicks on 'Search' button
        And the user clicks on Rent button for 'Davis-Garcia'
        And the user clicks on 'Rent!' element with 'btn btn-primary' 'all' class name
        And the user types 'Dawid' into 'Name' text field
        And the user types 'Kudzia' into 'Last_Name' text field
        And the user types '123' into 'Card_Number' text field
        And the user types 'kudzia.dawid@gmail.com' into 'Email' text field
        And the user clicks on 'Rent' button