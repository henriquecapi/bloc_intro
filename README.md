# Como estruturar um projeto Flutter: Guia para Iniciantes

Este documento explica os fundamentos da estrutura de pastas de um projeto Flutter, baseado na resolução de erros comuns de inicialização.

---

## O Problema: Por que tantos erros apareceram na análise inicial?

Os erros iniciais (como arquivos não encontrados, classes não definidas e o pacote `flutter` ou `flutter_bloc` faltando) ocorreram por um motivo estrutural muito comum quando estamos iniciando: **o seu código não estava organizado dentro de um projeto Flutter válido.**

Os arquivos Dart (como `main.dart`, as pastas `bloc`, `view`, etc.) estavam soltos diretamente na pasta raiz. Por causa disso, o Flutter não conseguia entender que se tratava de um projeto, e consequentemente não conseguia encontrar os pacotes do Flutter, do Bloc, nem mesmo os próprios arquivos do código.

### O que foi feito para corrigir:
1. **Criação do arquivo `pubspec.yaml`:** Adicionamos esse arquivo na raiz da pasta declarando o nome do projeto como `bloc_intro`, configurando a versão mínima do SDK e instalando as dependências necessárias.
2. **Criação da pasta `lib/`:** Movemos o arquivo `main.dart` e as pastas `bloc`, `model`, `provider` e `view` para dentro de uma nova pasta chamada `lib/`.
3. **Atualização dos pacotes:** Executamos o comando `flutter pub get` para baixar todas as dependências corretamente.

---

## Entendendo a Estrutura: Uma explicação de Professor 👨‍🏫

Imagine que um projeto Flutter é como uma **receita de bolo muito rigorosa**. Para que o "forno" (o compilador do Flutter) consiga assar o seu aplicativo, ele exige que os ingredientes estejam em potes muito específicos e com os rótulos corretos.

Quando você coloca os arquivos soltos em uma pasta qualquer, é como jogar a farinha, o ovo e o açúcar na mesa e dizer para o forno: *"Asse para mim!"*. Ele fica completamente confuso. 

Os conceitos fundamentais para a estrutura de um projeto são:

### 1. O `pubspec.yaml` (A Receita e a Identidade)
Todo projeto Flutter **obrigatoriamente** precisa de um arquivo chamado `pubspec.yaml` na raiz (na pasta principal). Ele é a identidade do seu projeto e sua "lista de compras". É lá que você diz:
- *"Meu app chama `bloc_intro`"*
- *"Vou usar as ferramentas do `flutter`"*
- *"Por favor, baixe para mim o pacote `flutter_bloc`"*

Sem esse arquivo, o Flutter olha para o seu código e vê apenas um monte de texto comum, por isso ele reclama que não consegue encontrar dependências básicas.

### 2. A pasta `lib/` (A Cozinha)
O Flutter tem uma regra de ouro: **todo o código-fonte (os arquivos `.dart` que você escreve) deve viver dentro de uma pasta chamada `lib` (de *library*)**.

No seu código, você usa importações como `import 'package:bloc_intro/bloc/counter_bloc.dart';`. Quando o Flutter lê isso, ele pensa: *"Ok, vou entrar no projeto `bloc_intro`, abrir a pasta `lib/` e procurar o arquivo `bloc/counter_bloc.dart`"*. Como a pasta `lib/` não existia e os arquivos estavam do lado de fora, ele entrava em pânico e dizia *Target of URI doesn't exist* (O destino não existe).

---

## E a misteriosa pasta `.dart_tool`? 🛠️

Ao rodar o comando `flutter pub get` ou ao tentar rodar o aplicativo pela primeira vez, você notará que uma pasta chamada `.dart_tool` é gerada automaticamente na raiz do seu projeto. 

**O que ela é?**
Como o nome já sugere (ferramenta do dart), essa pasta é a **caixa de ferramentas temporárias e cache** do Flutter e do Dart. Quando você pede ao Flutter para baixar pacotes (como o `flutter_bloc`), ele lê o seu `pubspec.yaml` e usa essa pasta para guardar informações de onde esses pacotes foram instalados no seu computador, e qual a versão exata que está sendo utilizada (através de arquivos como `package_config.json`). Ela também armazena arquivos temporários de compilação e caches do analisador de código.

**Ela é essencial para a execução do app?**
Sim e não. 
- **Sim, no momento da execução:** O compilador precisa das configurações contidas dentro dela para saber como juntar o seu código com os pacotes que você baixou.
- **Não, a longo prazo:** Ela é uma pasta **descartável**. Se você deletar a pasta `.dart_tool`, o seu projeto não estraga. Basta rodar o comando `flutter pub get` novamente que o Flutter irá recriar a pasta e baixar tudo o que for necessário.

**Uma regra de ouro para o Git (Controle de Versão):**
Você **nunca** deve incluir a pasta `.dart_tool` no seu repositório (no GitHub, por exemplo). Por ser uma pasta gerada automaticamente e que varia dependendo do computador e do sistema operacional que está rodando, ela deve estar listada no seu arquivo `.gitignore`.

---

**A lição para levar para a vida:** Sempre que for criar um projeto novo no Flutter, não crie as pastas na mão. Use o comando `flutter create nome_do_projeto`. O Flutter mesmo vai montar toda essa estrutura (a pasta `lib/`, o `pubspec.yaml`, ignorar as pastas temporárias como a `.dart_tool`) do jeito perfeito para você só se preocupar em programar! 🚀
