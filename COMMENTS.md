1 -  Elaborar um plano de testes com cases em BDD utilizando os critérios de aceitação e documentação, assim como o protótipo do app

Cenário: Entrar na aplicação

Teste case: Login com dados válidos

DADO que o usuário esteja na tela de login do app
E informe dados válidos nos campos “Usuário” e “Senha”
QUANDO ele clicar no botão “Entrar”
ENTÃO ele deverá ser direcionado para a home do app

Teste case: Preencher apenas campo “Usuário”

DADO que o usuário esteja na tela de login do app
E informe dados válidos nos campos “Usuário”
QUANDO ele clicar no botão “Entrar”
ENTÃO ele deverá receber uma de erro, informando que todos os campos obrigatórios devem ser preenchidos

Teste case: Preencher apenas campo “Senha”

DADO que o usuário esteja na tela de login do app
E informe dados válidos nos campos “Senha”
QUANDO ele clicar no botão “Entrar”
ENTÃO ele deverá receber uma de erro, informando que todos os campos obrigatórios devem ser preenchidos

Teste case: Preencher “Usuário” com dado inválido

DADO que o usuário esteja na tela de login do app
E informe dados inválidos no campo “Usuário”
E informe dados válidos no campo “Senha”
QUANDO ele clicar no botão “Entrar”
ENTÃO ele deverá receber uma mensagem informando que a senha ou o usuário são inválidos

Teste case: Preencher “Senha” com dado inválido

DADO que o usuário esteja na tela de login do app
E informe dados válidos no campo “Usuário”
E informe dados inválidos no campo “Senha”
QUANDO ele clicar no botão “Entrar”
ENTÃO ele deverá receber uma mensagem informando que a senha ou o usuário são inválidos

Cenário: Cadastrar novo aluno

Teste case: Cadastro com sucesso 

DADO que o usuário acesse o app com credenciais válidas
E clique no botão “Adicionar aluno”
E preencha os campos “Nome do aluno”, “Data de nascimento”, “CPF”, “Registro acadêmico” e “Email”
QUANDO ele clicar no botão “Adicionar”
ENTÃO o cadastro do aluno deverá ser salvo
E deverá ser apresentada na tela a mensagem de sucesso “O aluno foi adicionado com sucesso!”

Teste case: Tentativa de cadastro sem preencher o campo “Nome do aluno”

DADO que o usuário acesse o app com credenciais válidas
E clique no botão “Adicionar aluno”
E preencha os campos “Data de nascimento”, “CPF”, “Registro acadêmico” e “Email”
QUANDO ele clicar no botão “Adicionar”
ENTÃO o campo “Nome do aluno” deverá receber uma borda em vermelho e um ícone de atenção
E deverá ser apresentada a mensagem de erro “Você precisa preencher os campos obrigatórios”

Teste case: Tentativa de cadastro sem preencher o campo CPF

DADO que o usuário acesse o app com credenciais válidas
E clique no botão “Adicionar aluno”
E preencha os campos “Nome do aluno”, “Data de nascimento”, “Registro acadêmico” e “Email”
QUANDO ele clicar no botão “Adicionar”
ENTÃO o campo “CPF” deverá receber uma borda em vermelho e um ícone de atenção
E deverá ser apresentada a mensagem de erro “Você precisa preencher os campos obrigatórios”

Teste case: Tentativa de cadastro sem preencher o campo Data de nascimento

DADO que o usuário acesse o app com credenciais válidas
E clique no botão “Adicionar aluno”
E preencha os campos “Nome do aluno”, “CPF”, “Registro acadêmico” e “E-mail”
QUANDO ele clicar no botão “Adicionar”
ENTÃO os dados deverão ser salvos
E o usuário deverá receber a mensagem de sucesso “O aluno foi adicionado com sucesso”

Teste case: Tentativa de cadastro sem preencher o campo Registro acadêmico

DADO que o usuário acesse o app com credenciais válidas
E clique no botão “Adicionar aluno”
E preencha os campos “Nome do aluno”, “Data de nascimento”, “CPF” e “E-mail”
QUANDO ele clicar no botão “Adicionar”
ENTÃO o campo “Registro acadêmico” deverá receber uma borda em vermelho e um ícone de atenção
E deverá ser apresentada a mensagem de erro “Você precisa preencher os campos obrigatórios”

Teste case: Tentativa de cadastro sem preencher o campo E-mail

DADO que o usuário acesse o app com credenciais válidas
E clique no botão “Adicionar aluno”
E preencha os campos “Nome do aluno”, “Data de nascimento”, “CPF” e “Registro acadêmico”
QUANDO ele clicar no botão “Adicionar”
ENTÃO o campo E-mail ” deverá receber uma borda em vermelho e um ícone de atenção
E deverá ser apresentada a mensagem de erro “Você precisa preencher os campos obrigatórios”

Cenário: Listar alunos cadastrados

Teste case: Listagem de alunos

DADO que o usuário acesse o app com credenciais válidas
QUANDO ele acessar a home
ENTÃO ele deverá visualizar um campo de busca e a listagem de alunos já cadastrados na aplicação
E em cada card correspondente a um aluno, deverá visualizar o nome do aluno, o RA, o CPF e os botões de editar e excluir
E no centro inferior da tela, deverá estar disponível o botão “Adicionar aluno”

Cenário: Editar cadastro de aluno

Teste case: Clique no botão “Editar”

DADO que o usuário acesse o app com credenciais válidas
QUANDO ele clicar no botão “Editar” referente ao cadastro de um aluno
ENTÃO deverá ser aberta a tela de edição de cadastro de aluno e os dados previamentes cadastrados deverão ser exibidos em campos editáveis, com exceção do campo “Registro acadêmico”, que não deverá ser editável

Teste case: Edição com sucesso

DADO que o usuário esteja na tela de edição de um cadastro de aluno
QUANDO ele alterar os dados de algum dos campos disponíveis para edição
E clicar em “Salvar edições”
ENTÃO deverá ser exibida uma mensagem de sucesso informando o usuário que ação foi bem sucedida

Teste case: Sair da tela sem clicar em “Salvar alterações”

DADO que o usuário esteja na tela de edição de um cadastro de aluno
QUANDO ele alterar os dados de algum dos campos disponíveis para edição
E sair da tela sem clicar em “Salvar alterações”
ENTÃO os dados editados não deverão ser salvos

Teste case: Tentar salvar com um campo obrigatório em branco

DADO que o usuário esteja na tela de edição de um cadastro de aluno
QUANDO ele apagar os dados de algum dos campos obrigatórios
E clicar em “Salvar edições”
ENTÃO o campo em questão deverá receber uma borda em vermelho e um ícone de atenção
E deverá ser apresentada a mensagem de erro “Você precisa preencher os campos obrigatórios”
E as alterações não deverão ser salvas

Cenário: Excluir cadastro de aluno

Teste case: Clique no botão “Excluir”
DADO que o usuário acesse o app com credenciais válidas
QUANDO ele clicar no botão “Excluir” referente ao cadastro de um aluno
ENTÃO deverá ser aberto uma modal de confirmação com dois botões o “Excluir aluno” e o “Cancelar

Teste case: Clique no botão “Excluir aluno”
DADO que o usuário esteja na modal de exclusão de aluno
QUANDO ele clicar no botão “Excluir aluno”
ENTÃO o registro do aluno deverá ser excluído
E o usuário deverá receber uma mensagem de sucesso da ação

Teste case: Clique no botão “Cancelar”
DADO que o usuário esteja no modal de exclusão de aluno
QUANDO ele clicar no botão “Cancelar”
ENTÃO a modal deverá ser fechada
E o registro do aluno não deverá ser excluído


2 -  Criar uma automação em Cypress com as APIs disponíveis no projeto:https://github.com/zanelladev/challenge-developer-flutter


3 - Elabore uma estratégia para prevenção de bugs

Uma estratégia que pode ajudar na prevenção de bugs é o chamado shift-left:
Trazer o profissional de qualidade para colaborar desde o início, auxiliando na parte de requisitos e design, pode antecipar problemas antes mesmo da etapa de desenvolvimento do software.
Levando em consideração produtos que já estão em produção, a análise de causa raiz de defeitos antigos pode auxiliar no entendimento de quais partes do código apresentam mais defeitos e a origem desses defeitos, o que pode ajudar na estratégia de desenvolvimento de novos códigos e, se necessário, refatoração de código legado.


4 - Um app foi entregue para realizar os testes finais antes de seu lançamento, durante o seu desenvolvimento foram realizados testes funcionais pela equipe de QA, porém, quando iniciou os testes de regressão do sistema você se deparou com vários problemas diferentes, que não foram percebidos durante os testes funcionais que foram aplicados. Diante dessa situação, nós temos alguns problemas:

1. O app está com prazo comprometido visando a entrega para o cliente

2. O tempo de teste que você tinha estimado no início é pouco, diante dos problemas encontrados

Elabore duas estratégias:

Um plano de ação diante dessa situação


Primeiramente conversaria com o Product Owner, informando o ocorrido e verificando a possibilidade de estender o prazo de entrega para que pudesse efetuar todos os testes regressivos.
Caso não fosse possível, seguiria com os testes priorizando as principais funcionalidades (Smoke test) e partes do sistema que costumam apresentar defeitos.

Uma estratégia para que esse problema talvez não houvesse ocorrido

Com base nos defeitos encontrados, faria a revisão dos casos de testes para identificar lacunas e adicionar os testes que podem ter faltado nos test cases.

