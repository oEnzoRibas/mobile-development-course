class DivisionByZeroException implements Exception {
  final String message;

  DivisionByZeroException([this.message = 'Erro! Divisão por zero é uma operação inválida para esse sistema.']);
  
  @override
  String toString() {
    return message;
  }
}

class SyntaxException implements Exception {
  final String message;

  SyntaxException([this.message = 'Erro! Sintaxe inválida!']);
  
  @override
  String toString() {
    return message;
  }
}

class OverflowException implements Exception {
  final String message;

  OverflowException([this.message = 'Erro! Transbordamento!']);
  
  @override
  String toString() {
    return message;
  }
}

class UnderflowException implements Exception {
  final String message;

  UnderflowException([this.message = 'Erro! Subfluxo!']);
  
  @override
  String toString() {
    return message;
  }
}