# Quiz Games

Desafio 02 - jogo de perguntas e respostas no terminal, feito em Dart.

**Integrantes:** Matheus Rabelo de Freitas
**Trilha:** Desenvolvimento Mobile

## Sobre o quiz

O tema é **videogames, dos clássicos aos lançamentos recentes**. Metade das perguntas é sobre jogos que todo mundo conhece e que marcaram a história (Zelda, Mario, Sonic, Pokémon, Pac-Man) e a outra metade sobre games e consoles dos últimos anos (GTA VI, Switch 2, Fortnite, Minecraft, EA Sports FC). São 10 perguntas, cada uma com quatro alternativas (A, B, C e D) e só uma correta. A categoria de cada pergunta mostra se ela é "Clássico" ou "Recente".

Exemplo de pergunta:

```
[3/10] Clássico · Retrô
No Pac-Man, qual é a cor do fantasma Blinky?
  A) Laranja
  B) Vermelho
  C) Rosa
  D) Azul-claro
Sua resposta (A, B, C ou D):
```

### Como o jogo funciona

- Pergunta o nome do jogador e usa o nome nas mensagens.
- Mostra uma pergunta por vez, com a categoria e as quatro alternativas.
- Aceita letra maiúscula ou minúscula.
- Se a resposta for inválida ou o jogador apertar só Enter, pede de novo.
- Quando o jogador erra, mostra qual era a alternativa correta.
- No fim, mostra a pontuação (ex.: `8 de 10`) e uma mensagem que depende do desempenho.

### Extras

- A ordem das perguntas muda a cada rodada, e a posição das alternativas também.
- As frases de acerto e de erro são sorteadas, para o jogo não ficar repetitivo.
- É possível jogar de novo, com o mesmo jogador ou com outro nome.
- Placar com os resultados da sessão.

## Tecnologias

- Dart (SDK 3.5 ou superior)
- Pacotes de desenvolvimento: `lints` e `test`

## Como executar

Dentro da pasta do projeto:

```
dart pub get
dart run
```

## Estrutura

```
bin/quiz_games.dart    fluxo principal do jogo
lib/pergunta.dart      classe Pergunta
lib/perguntas.dart     lista com as perguntas
lib/entrada.dart       leitura e validação do que o jogador digita
lib/quiz.dart          rodada, mensagens e placar
test/                  testes automatizados
```

As perguntas ficam em uma lista e são mostradas por um `for`. Para incluir uma pergunta nova, basta adicionar um item em `lib/perguntas.dart`.

## Captura de tela
Tela inicial e perguntas:

![Início do quiz](docs/captura.png)

Resposta certa, resposta errada e validação de entrada inválida:

![Respostas e validação](docs/captura2.png)

Pontuação final e placar:

![Resultado final](docs/captura3.png)

## Uso de IA

[Editem esta seção com o que vocês realmente fizeram.]

- **Como a IA ajudou:** gerou a primeira versão da estrutura do projeto e do código (classe `Pergunta`, lista de perguntas, leitura da entrada e laço `for`) e sugeriu perguntas para o tema de games.
- **O que adaptamos:** escolhi o tema depois de descartar um quiz que ficou parecido com o exemplo. Também pedi que o jogo permitisse trocar de jogador ao jogar de novo, que as frases fossem sorteadas e que as alternativas mudassem de posição.
- **Como verificamos:** joguei várias vezes com `dart run` testando respostas certas, erradas, letras minúsculas, respostas inválidas e Enter vazio, e conferi se a pontuação batia. As respostas das perguntas foram conferidas em fontes confiáveis.
