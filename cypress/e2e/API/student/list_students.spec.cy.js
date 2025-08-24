describe('API test - Get students', () => {
  it.only('Student registration', () => {
    cy.request({
      method: 'GET',
      url: 'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/student',
      failOnStatusCode: false,

    }).then((response) => {
      console.log(response)
      cy.log(JSON.stringify(response.body))
      expect(response.status).to.eq(200)
      expect(response.body).to.be.an('array')
    })
  })

})