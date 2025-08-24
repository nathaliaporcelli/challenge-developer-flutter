describe('Teste de API - Cadastro de aluno', () => {
  it.only('Student registration', () => {
    cy.request({
      method: 'POST',
      url: 'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/student',
      failOnStatusCode: false,
      body: {
        "name": "Tiago",
        "birthdate": "1998-11-11",
        "academic_record": "00003",
        "cpf": "112312312332"
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