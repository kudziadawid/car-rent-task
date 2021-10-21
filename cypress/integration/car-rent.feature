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
        Then verify that '<tableItem>' text is displayed
        When the user clicks on 'Rent!' element with '<classNames>' '<oneOrAllClasses>' class name
        And the user types '<name>' into 'Name' text field
        And the user types '<lastName>' into 'Last_Name' text field
        And the user types '<cardNumber>' into 'Card_Number' text field
        And the user types '<email>' into 'Email' text field
        And the user clicks on 'Rent' button
        #Page not found is definitely not an expected result but I have no requirements what should happen next
        Then verify that 'Page not found' text is displayed

        Examples:
            | country | city   | model                 | pickup     | dropoff    | tableItem    | classNames      | oneOrAllClasses | name  | lastName | cardNumber | email                  |
            | Poland  | Cracow | Mercedes-Benz A-Class | 2020-10-10 | 2020-11-11 | Davis-Garcia | btn btn-primary | all             | Dawid | Kudzia   | 123        | kudzia.dawid@gmail.com |
            | France  | Paris  | Honda Civic           | 2020-10-10 | 2021-11-11 | Mazda 6      | btn-primary     | one             | Han   | Wang-ho  | 123432     | top@secret.com         |

    Scenario Outline: Price per day calculation
        Given the user visits the Main Page
        When the user selects '<country>' from 'Country' dropdown
        And the user selects '<city>' from 'City' dropdown
        And the user types '<model>' into 'Model' text field
        And the user types '<pickup>' into 'Pickup' text field
        And the user types '<dropoff>' into 'DropOff' text field
        And the user clicks on 'Search' button
        Then verify the price is product of price per day multiplied by number of days from '<pickup>' to '<dropoff>' for '<tableItem>'

        Examples:
            | country  | city    | model                 | pickup     | dropoff    | tableItem    |
            | Poland   | Cracow  | Mercedes-Benz A-Class | 2020-10-10 | 2020-11-11 | Davis-Garcia |
            | Germainy | Wroclaw | Citroën C4            | 2021-11-11 | 2022-01-01 | 90SY9        |

    Scenario Outline: Rent Summary page verification
        Given the user visits the Main Page
        When the user selects '<country>' from 'Country' dropdown
        And the user selects '<city>' from 'City' dropdown
        And the user types '<model>' into 'Model' text field
        And the user types '<pickup>' into 'Pickup' text field
        And the user types '<dropoff>' into 'DropOff' text field
        And the user clicks on 'Search' button
        And the user clicks on Rent button for company '<company>', model '<model>', licence plate '<licencePlate>' and price per day '<pricePerDay>'
        Then verify that '<model>' text is displayed
        And verify that 'Company: <company>' text is displayed
        And verify that 'Price per day: <pricePerDay>' text is displayed
        #the step below may fail because of one of bugs, submitted
        And verify that 'Location: <country>, <city>' text is displayed
        #it should be 'licence plate' but there is a bug, submitted
        And verify that 'License plate: <licencePlate>' text is displayed
        And verify that 'Pickup date: <pickup>' text is displayed
        And verify that 'Dropoff date: <dropoff>' text is displayed
        And verify that 'Rent!' text on 'class' button is displayed

        Examples:
            | country | city   | model         | pickup     | dropoff    | company          | licencePlate | pricePerDay |
            | Poland  | Cracow | Skoda Octavia | 2020-10-10 | 2020-11-11 | Davis-Garcia     | 1C403        | 65$         |
            | France  | Paris  | Toyota RAV4   | 2020-11-11 | 2022-03-03 | Rodriguez-Fisher | CJW-2174     | 107$        |

