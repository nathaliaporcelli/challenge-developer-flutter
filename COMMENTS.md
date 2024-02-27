### Decisão arquitetural
A arquitetura que escolhi, foi a de camadas, pois ela possibilita uma boa separação das responsabilidades e uma organização clara. A divisão por módulos facilita a manutenção do código e melhora a legibilidade. Devido esta separação cada camada possui responsabilidades bem definidas, favorecendo a correção de problemas específicos de cada camada.

Além disso, realizei a separação de elementos padrões do design, criando um package, 'design_system', independente do aplicativo. Levando uma padronização do layout e facilitando possíveis mudanças no design do aplicativo, alterando o padrão como um todo.
### Bibliotecas de terceiros
- [get_it](https://pub.dev/packages/get_it)
- [go_router](https://pub.dev/packages/go_router)
- [dio](https://pub.dev/packages/dio)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [melos](https://pub.dev/packages/melos)
- [flutter_lints](https://pub.dev/packages/flutter_lints)
- [flutterando_analysis](https://pub.dev/packages/flutterando_analysis)

### O que faria se tivesse mais tempo?
Continuaria a fazer testes de unidade, inicializaria os testes de widgets, como o de integração. Pensaria em segregar mais as telas, dividindo-as em mais widgets independente.

### Quais requisitos obrigatórios que não foram entregues?
Todos os requisitos obrigatórios foram entregues.