import 'dart:io';

String _lerLinha() {
  final linha = stdin.readLineSync();
  if (linha == null) {
    print('');
    print('Entrada encerrada. Até a próxima!');
    exit(0);
  }
  return linha.trim();
}

String lerNome() {
  while (true) {
    stdout.write('Como você se chama? ');
    final nome = _lerLinha();
    if (nome.isNotEmpty) return nome;
    print('Ei, preciso de um nome para anotar a sua pontuação!');
  }
}

String lerAlternativa() {
  while (true) {
    stdout.write('Sua resposta (A, B, C ou D): ');
    final texto = _lerLinha().toUpperCase();
    if (texto.isEmpty) {
      print('Você não digitou nada. Escolha A, B, C ou D.');
    } else if (texto.length == 1 && 'ABCD'.contains(texto)) {
      return texto;
    } else {
      print('"$texto" não é uma alternativa. Escolha A, B, C ou D.');
    }
  }
}

bool lerSimOuNao(String pergunta) {
  while (true) {
    stdout.write('$pergunta (S/N): ');
    final texto = _lerLinha().toUpperCase();
    if (texto == 'S' || texto == 'SIM') return true;
    if (texto == 'N' || texto == 'NAO' || texto == 'NÃO') return false;
    print('Digite S para sim ou N para não.');
  }
}
