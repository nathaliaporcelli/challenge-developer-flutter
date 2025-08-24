describe('API test - Get Student by id', () => {
  it('Gets Student registration with id 65', () => {
    cy.request({
      method: 'GET',
      url: 'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/student/65',
      failOnStatusCode: false,

    }).then((response) => {
      console.log(response)
      cy.log(JSON.stringify(response.body))
      expect(response.status).to.eq(200)
      expect(response.body).to.have.property('id', '65')

    })
  })

  it('Try to get Student registration with invalid id ', () => {
    cy.request({
      method: 'GET',
      url: 'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/student/600',
      failOnStatusCode: false,

    }).then((response) => {
      console.log(response)
      expect(response.status).to.eq(404)

    })
  })

})