Feature: Car Rent

    As a car rent website user
    I want to choose a car
    So I can rent it for specified time

    Scenario Outline: Renting a chosen car
        Given the user visits the Main Page
        When the user selects '<country>' from 'Country' dropdown
        And the user selects '<city>' from 'City' dropdown
        And the user types '<model>' into 'Model' text field
        And the user types '<pickup>' into 'Pickup' text field
        And the user types '<dropoff>' into 'DropOff' text field
        And the user clicks on 'Search' button
        And the user clicks on Rent button for '<tableItem>'
        And the user clicks on 'Rent!' element with '<classNames>' '<oneOrAllClasses>' class name
        And the user types '<name>' into 'Name' text field
        And the user types '<lastName>' into 'Last_Name' text field
        And the user types '<cardNumber>' into 'Card_Number' text field
        And the user types '<email>' into 'Email' text field
        And the user clicks on 'Rent' button
        Then verify that 'Page not found' text is displayed

        Examples:
            | country | city   | model                 | pickup     | dropoff    | tableItem    | classNames      | oneOrAllClasses | name  | lastName | cardNumber | email                  |
            | Poland  | Cracow | Mercedes-Benz A-Class | 2020-10-10 | 2020-11-11 | Davis-Garcia | btn btn-primary | all             | Dawid | Kudzia   | 123        | kudzia.dawid@gmail.com |
            | France  | Paris  | Honda Civic           | 2020-10-10 | 2021-11-11 | Mazda 6      | btn-primary     | one             | Han   | Wang-ho  | 123432     | top@secret.com         |

    #Scenario: Price per day calculation
    #    Given the user visits the Main Page
