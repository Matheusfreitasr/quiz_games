class Pergunta {
  static const List<String> letras = ['A', 'B', 'C', 'D'];

  final String categoria;
  final String enunciado;
  final List<String> alternativas;
  final int indiceCorreto;

  const Pergunta(
    this.categoria,
    this.enunciado,
    this.alternativas,
    this.indiceCorreto,
  );
}
