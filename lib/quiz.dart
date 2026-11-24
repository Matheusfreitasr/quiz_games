import 'dart:math';

import 'entrada.dart';
import 'pergunta.dart';
import 'perguntas.dart';

final Random _sorteio = Random();

const List<String> _frasesAcerto = [
  'Boa jogada, {nome}! Resposta certa.',
  'Combo perfeito! +1 ponto.',
  'Level up! Você acertou.',
  'Acertou em cheio, {nome}. XP garantido!',
  'É isso aí! Você manja dos games.',
];

const List<String> _frasesErro = [
  'Dano recebido! Não era essa.',
  'Perdeu uma vida, {nome}.',
  'Quase, {nome}, mas não foi dessa vez.',
  'Errou, mas o jogo continua. Bora!',
  'Essa foi uma armadilha, {nome}.',
];

class Resultado {
  final String nome;
  final Nivel nivel;
  final int acertos;
  final int total;

  const Resultado(this.nome, this.nivel, this.acertos, this.total);
}

List<Pergunta> perguntasDoNivel(Nivel nivel) {
  return perguntas.where((p) => p.nivel == nivel).toList();
}

String _sortearFrase(List<String> frases, String nome) {
  final frase = frases[_sorteio.nextInt(frases.length)];
  return frase.replaceAll('{nome}', nome);
}

List<int> sortearOrdem(int tamanho) {
  return List<int>.generate(tamanho, (i) => i)..shuffle(_sorteio);
}

String mensagemFinal(String nome, int acertos, int total) {
  final taxa = acertos / total;
  if (taxa == 1) {
    return 'Nível máximo, $nome! Você zerou o quiz sem perder uma vida.';
  }
  if (taxa >= 0.8) {
    return 'Ótima partida, $nome! Você é jogador de alto nível.';
  }
  if (taxa >= 0.5) {
    return 'Boa, $nome! Passou de fase, mas ainda dá para evoluir.';
  }
  if (acertos > 0) {
    return 'Game over por pouco, $nome. Que tal tentar de novo?';
  }
  return 'Eita, $nome... nenhum ponto. Aperte continue e tente outra vez!';
}

void apresentar(Pergunta pergunta, List<int> ordem, int numero, int total) {
  print('');
  print('[$numero/$total] ${pergunta.categoria}');
  print(pergunta.enunciado);
  for (var i = 0; i < ordem.length; i++) {
    print('  ${Pergunta.letras[i]}) ${pergunta.alternativas[ordem[i]]}');
  }
}

int jogarRodada(String nome, List<Pergunta> lista) {
  var acertos = 0;
  for (var i = 0; i < lista.length; i++) {
    final pergunta = lista[i];
    final ordem = sortearOrdem(pergunta.alternativas.length);
    final letraCerta = Pergunta.letras[ordem.indexOf(pergunta.indiceCorreto)];

    apresentar(pergunta, ordem, i + 1, lista.length);
    final resposta = lerAlternativa();

    if (resposta == letraCerta) {
      acertos++;
      print(_sortearFrase(_frasesAcerto, nome));
    } else {
      print(_sortearFrase(_frasesErro, nome));
      print(
        'A resposta certa era $letraCerta) '
        '${pergunta.alternativas[pergunta.indiceCorreto]}.',
      );
    }
  }
  return acertos;
}

void mostrarRanking(List<Resultado> ranking) {
  final ordenado = [...ranking]..sort((a, b) {
      final porAcertos = b.acertos.compareTo(a.acertos);
      if (porAcertos != 0) return porAcertos;
      return b.nivel.index.compareTo(a.nivel.index);
    });
  print('--- Placar da sessão ---');
  for (var i = 0; i < ordenado.length; i++) {
    final r = ordenado[i];
    print('${i + 1}º ${r.nome} (${r.nivel.nome}): ${r.acertos} de ${r.total}');
  }
}
