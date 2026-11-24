import 'package:quiz_games/quiz_games.dart';
import 'package:test/test.dart';

void main() {
  test('toda pergunta tem quatro alternativas e um índice correto válido', () {
    expect(perguntas.length, greaterThanOrEqualTo(5));
    for (final p in perguntas) {
      expect(p.alternativas.length, 4);
      expect(p.indiceCorreto, inInclusiveRange(0, 3));
    }
  });

  test('as alternativas de cada pergunta não se repetem', () {
    for (final p in perguntas) {
      expect(p.alternativas.toSet().length, p.alternativas.length);
    }
  });

  test('sortearOrdem devolve uma permutação dos índices', () {
    final ordem = sortearOrdem(4);
    expect(ordem.toSet(), {0, 1, 2, 3});
  });

  test('mensagem final muda conforme o desempenho', () {
    final mensagens = {
      mensagemFinal('Ana', 10, 10),
      mensagemFinal('Ana', 8, 10),
      mensagemFinal('Ana', 5, 10),
      mensagemFinal('Ana', 1, 10),
      mensagemFinal('Ana', 0, 10),
    };
    expect(mensagens.length, 5);
  });
}
