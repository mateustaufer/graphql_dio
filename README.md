# Exploradores-Flutter

Esse projeto é a plataforma dos exploradores web e app.

### 📋 Pré-requisitos

```
Flutter 3.13.3 channel stable
Dart 3.1.1
```

### 🔧 Instalação

- instale o flutter [pela documentação oficial](https://docs.flutter.dev/get-started/install)
- Instale as dependências do projeto com o comando `flutter pub get`
- Rode o projeto a partir do VsCode, clique no ícone Debug do vsCode  ![Screenshot 2023-09-14 at 10 32 11](https://github.com/Jovens-Genios/exploradores-flutter/assets/56030667/e6bcc9ba-7c17-44f1-88fe-392d354ed77d) e clique na frase
  `To customize Run and Debug create a launch.json file` e em seguida selecione a opção **Dart & Flutter**

## ⚙️ Executando os testes

Execute o comando dentro da pasta raiz do projeto `flutter test test`

## 📦 Estruturado projeto

```shell
  ├── lib
    │── app
        └── constants
        └── data
            └── models
        │   └── providers
        │   └── repositories
        └── graphql
        └── modules
        │   └── bindings
        │   └── controllers
        │   └── views
        └── routes
        └── utils
        └── widgets
    └── main.dart
```

- **constants**: Armazena as strings que serão usadas em todo projeto
- **data**

  - **models**: Camada responsável por representar o modelo de dado.
  - **providers**: Camada responsável pela comunicação com o backend.
  - **repositories**: Camada responsável pelo tratamento dos dados.

- **graphql**: Responsável por ter as queries e mutations.
- **modules**: Independentes e tem como responsabilidade agrupar funções, páginas, classes com a mesma finalidade.

  - **bindings**: Camada responsável por injetar as dependências no módulo.
  - **controllers**: Camada responsável por ter a lógica necessária do módulo.
  - **views** : Camada responsável por mostrar informação para o usuário.

- **routes** : Abrange as rotas e também a classe responsável por alterar as páginas.
- **utils** : Camada responsável por ter classes/funções que são compartilhadas no projeto.
- **widgets** : Camada responsável pelos componentes genéricos que serão usados em todo projeto.

## 🛠️ Construído com

- [Flutter](https://docs.flutter.dev) - Framework principal do projeto
- [Getx](https://pub.dev/packages/get) - Biblioteca responsável por gerenciamento de estado, injeção de dependências e gerenciamento de rotas
- [graphql_flutter](https://pub.dev/packages/graphql_flutter) - Usado para requisições graphql
- [dio](https://pub.dev/packages/dio) - Usada para requisições HTTP

## 📌 Versão

Adicionar informações sobre versões
