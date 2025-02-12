describe('Testing the homepage of the blog Testing with Cypress', () => {

  beforeEach(() => {
    cy.visit('http://lucasgosgnach.fr/')
  });

  it('Verify header', () => {
    cy
      .get('h1')
      .should('be.visible')
      .and('contains.text', 'Lucas GOSGNACH')
  })

  it('Verify slogan', () => {
    cy
      .get('h2')
      .should('be.visible')
      .and('contains.text', 'I do code and make content ')
  })
})
