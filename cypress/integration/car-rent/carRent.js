import { Given, When, Then } from "cypress-cucumber-preprocessor/steps"

Given('the user visits the Main Page', () => {
    cy.visit('/')
})

When('the user selects {string} from {string} dropdown', (dropdownValue, dropdownName) => {
    cy.get('#'+dropdownName.toLowerCase()).select(dropdownValue)
})