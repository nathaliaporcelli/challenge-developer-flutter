describe('Teste de API - Cadastro de aluno', () => {

  it('Deletion of student not founded', () => {
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