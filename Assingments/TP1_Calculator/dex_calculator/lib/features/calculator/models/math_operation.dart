enum MathOperation {
  addition('+'),
  subtraction('-'),
  multiplication('*'),
  division('/');

  final String symbol;
  const MathOperation(this.symbol);

  /// @summary: Método estático que recebe um símbolo de operação matemática e retorna a enumeração correspondente. Ele percorre os valores da enumeração e compara o símbolo fornecido com o símbolo de cada operação. Se encontrar uma correspondência, retorna a operação correspondente; caso contrário, retorna null.
  static MathOperation? fromSymbol(String symbol) {
    for (var op in values) {
      if (op.symbol == symbol) return op;
    }
    return null;
  }
}