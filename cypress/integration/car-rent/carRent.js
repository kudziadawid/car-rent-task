import { Given, When, Then } from "cypress-cucumber-preprocessor/steps"

Given('the user visits the Main Page', () => {
    cy.visit('/')
})

When('the user selects {string} from {string} dropdown', (dropdownValue, dropdownName) => {
    cy.get('#'+dropdownName.toLowerCase()).select(dropdownValue)
})

When('the user types {string} into {string} text field', (textFieldValue, textFieldName) => {
    cy.get('#'+textFieldName.toLowerCase()).type(textFieldValue)
})

When('the user clicks on {string} button', (buttonText) => {
    cy.get('button').contains(buttonText).click()
})

When('the user clicks on {string} element with {string} {string} class name', (elementText, className, oneOrAllClasses) => {
    switch(oneOrAllClasses) {
        case 'one': 
            cy.get('.'+ className).contains(elementText).click()
            break
        case 'all': 
            cy.get('[class="'+ className +'"]').contains(elementText).click()
            break
        default: throw new Error('Second string accepts only "one" or "all" value')
    }
})

When('the user clicks on Rent button for {string}', (itemValue) => {
    cy.get('#search-results').find('tr').contains(new RegExp('^' + itemValue + '$', 'g')).parent().find('td').last().click()
})