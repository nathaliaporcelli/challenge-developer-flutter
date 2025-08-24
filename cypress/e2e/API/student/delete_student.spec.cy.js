describe('API test - Delete Student', () => {

  it('Deletion of student successfully', () => {
    cy.request({
      method: 'GET',
      url: 'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/student',
      failOnStatusCode: false,

    }).then((response) => {
      console.log(response)
      cy.log(JSON.stringify(response.body))
      expect(response.status).to.eq(200)
      expect(response.body).to.be.an('array')
      const firstStudent = response.body[0].id

      cy.request({
        method: 'DELETE',
        url: `https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/student/${firstStudent}`,
        failOnStatusCode: false,

      }).then((delResponse) => {
        console.log(delResponse)
        expect(response.status).to.eq(200)
      })
    })
  })
  it('Deletion of student not found', () => {
    cy.request({
      method: 'DELETE',
      url: 'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/student/94',
      failOnStatusCode: false,

    }).then((response) => {
      console.log(response)
      cy.log(JSON.stringify(response.body))
      expect(response.status).to.eq(404)
    })
  })


})