import 'package:quiz_games/quiz_games.dart';
import 'package:test/test.dart';

void main() {
  test('cada nível tem pelo menos cinco perguntas do próprio nível', () {
    for (final nivel in Nivel.values) {
      final lista = perguntasDoNivel(nivel);
      expect(lista.length, greaterThanOrEqualTo(5));
      expect(lista.every((p) => p.nivel == nivel), isTrue);
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
