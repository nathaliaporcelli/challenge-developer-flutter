describe('Teste de API - Cadastro de aluno', () => {

  it('Updating of student registration', () => {
    cy.request({
      method: 'PUT',
      url: 'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/student/93',
      failOnStatusCode: false,
      body: {
        "name": "Francisco Chico updated",
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


})