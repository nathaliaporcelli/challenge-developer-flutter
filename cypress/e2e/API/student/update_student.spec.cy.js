describe('API test - Update Student', () => {

  it('Updating the name of student', () => {
    const uniqueNumber = Math.floor(Math.random() * 1000000)
    cy.request({
      method: 'PUT',
      url: 'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/student/93',
      failOnStatusCode: false,
      body: {
        "name": `Francisco_${uniqueNumber}`,
        "email": "chico2@email.com",
        "birthdate": "1998-11-11",
        "academic_record": "00002",
        "cpf": "112312312302"
      },
      headers: {
        'Content-Type': 'application/json'
      }
    }).then((response) => {
      console.log(response)
      cy.log(JSON.stringify(response.body))
      expect(response.status).to.eq(200)
    })
  })
  it('Get 404 when try to update student with invalid ID', () => {
    const uniqueNumber = Math.floor(Math.random() * 1000000)
    cy.request({
      method: 'PUT',
      url: 'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/student/200',
      failOnStatusCode: false,
      body: {
        "name": `Francisco_${uniqueNumber}`,
        "email": "chico2@email.com",
        "birthdate": "1998-11-11",
        "academic_record": "00002",
        "cpf": "112312312302"
      },
      headers: {
        'Content-Type': 'application/json'
      }
    }).then((response) => {
      console.log(response)
      cy.log(JSON.stringify(response.body))
      expect(response.status).to.eq(404)
    })
  })


})