describe('API Test - Create a Student', () => {
  it('Create a student successfully', () => {
    const uniqueNumber = Math.floor(Math.random() * 1000000)
    cy.request({
      method: 'POST',
      url: 'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/student',
      failOnStatusCode: false,

      body: {
        "name": `Student_${uniqueNumber}`,
        "birthdate": "1998-11-11",
        "academic_record": uniqueNumber,
        "cpf": uniqueNumber
      },
      headers: {
        'Content-Type': 'application/json'
      }
    }).then((response) => {
      console.log(response)
      cy.log(JSON.stringify(response.body))
      expect(response.status).to.eq(201)
    })
  })

})