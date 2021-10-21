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

When('the user clicks on Rent button for company {string}, model {string}, license plate {string} and price per day {string}', (company, model, licensePlate, pricePerDay) => {
    cy.get('#search-results').find('tr').contains(new RegExp('^' + licensePlate + '$', 'g')).parent().find('td').last().click()
})

Then('verify that {string} text is displayed', (textValue) => {
    cy.get('body').should('contain.text', textValue)
})

Then ('verify the price is product of price per day multiplied by number of days from {string} to {string} for {string}', (pickupDate, dropoffDate, itemValue) => {
    let daysDifference = Math.floor((Date.parse(dropoffDate) - Date.parse(pickupDate)) / 86400000)
    cy.get('#search-results').find('tr').contains(new RegExp('^' + itemValue + '$', 'g')).parent().find('td').eq(4).invoke('text').then(pricePerDay => {
        pricePerDay = pricePerDay.replace(/\D/g,'')
        cy.get('#search-results').find('tr').contains(new RegExp('^' + itemValue + '$', 'g')).parent().find('td').eq(3).invoke('text').then(priceOverall => {
            priceOverall = priceOverall.replace(/\D/g,'')
            expect(priceOverall).to.equal((pricePerDay*daysDifference).toString())
        })
    })
})

Then('verify that {string} text on {string} button is displayed', (textValue, buttonType) => {
    switch(buttonType) {
        case 'tag name': 
            cy.get('button').contains(textValue).invoke('text').then(buttonText => {
                expect(buttonText).to.equal(textValue)
            }) 
            break
        case 'class':
            cy.get('.btn').contains(textValue).invoke('text').then(buttonText => {
                expect(buttonText).to.equal(textValue)
            }) 
            break
            default: throw new Error('Second string accepts only "tag name" or "class" value') 
    }
})
