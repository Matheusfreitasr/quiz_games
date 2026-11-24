import 'package:quiz_games/quiz_games.dart';

void main() {
  print('==========================================');
  print('     QUIZ GAMES: APERTE START PARA JOGAR');
  print('==========================================');
  print('Bem-vindo(a), player! Dos clássicos aos lançamentos recentes, vamos ver o quanto você sabe de games.');
  print('');

  var nome = lerNome();
  final ranking = <Resultado>[];

  var jogarNovamente = true;
  while (jogarNovamente) {
    print('');
    print('Fase iniciada, $nome! São ${perguntas.length} perguntas com 4 alternativas cada.');

    final rodada = List.of(perguntas)..shuffle();
    final acertos = jogarRodada(nome, rodada);

    print('');
    print('------------------------------------------');
    print('Fim de jogo! Você acertou $acertos de ${rodada.length} perguntas.');
    print(mensagemFinal(nome, acertos, rodada.length));
    print('------------------------------------------');

    ranking.add(Resultado(nome, acertos, rodada.length));
    mostrarRanking(ranking);

    print('');
    jogarNovamente = lerSimOuNao('Continuar? Quer jogar de novo?');

    if (jogarNovamente) {
      print('');
      if (!lerSimOuNao('Jogar como $nome?')) {
        nome = lerNome();
      }
    }
  }

  print('');
  print('Valeu por jogar! Até a próxima partida.');
}
