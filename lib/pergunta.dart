enum Nivel {
  facil('Fácil', 'jogos e personagens que todo mundo conhece'),
  medio('Médio', 'lançamentos recentes e curiosidades de jogador'),
  dificil('Difícil', 'história dos games e detalhes para veteranos');

  final String nome;
  final String descricao;

  const Nivel(this.nome, this.descricao);
}

class Pergunta {
  static const List<String> letras = ['A', 'B', 'C', 'D'];

  final Nivel nivel;
  final String categoria;
  final String enunciado;
  final List<String> alternativas;
  final int indiceCorreto;

  const Pergunta(
    this.nivel,
    this.categoria,
    this.enunciado,
    this.alternativas,
    this.indiceCorreto,
  );
}