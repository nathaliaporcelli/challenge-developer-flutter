describe('Teste de API - Login', () => {
  it.only('Login successfully', () => {
    cy.request({
      method: 'POST',
      url: 'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/login',
      failOnStatusCode: false,
      body: {
        "email": "nat@gmail.com",
        "password": "123456"
      },
      headers: {
        'Content-Type': 'application/json'
      }
    }).then((response) => {
      console.log(response)
      expect(response.status).to.eq(201)
      expect(response.body).to.have.property('id')
      expect(response.body).to.have.property('token')
      window.localStorage.setItem('user',JSON.stringify(response.body))
    })
  })
  it('Deletion of login registration', () => {
    cy.request({
      method: 'DELETE',
      url: 'https://653c0826d5d6790f5ec7c664.mockapi.io/api/v1/login/201',
      failOnStatusCode: false,
      
    }).then((response) => {
      console.log(response)
      cy.log(JSON.stringify(response.body))
      expect(response.status).to.eq(200)
    })
  })
})