import 'package:dex_calculator/core/errors/exceptions.dart';
import 'package:dex_calculator/features/calculator/models/math_operation.dart';
import 'package:flutter/material.dart';


/// [summary] Classe responsável por controlar a lógica de cálculo da calculadora, incluindo as operações matemáticas e a atualização da interface do usuário.
/// [note] ChangeNotifier é uma classe que fornece uma maneira de notificar os ouvintes quando o estado do objeto muda. Ele é usado para gerenciar o estado da aplicação e atualizar a interface do usuário quando necessário.
class CalculatorController extends ChangeNotifier{
  String _operand1 = '';
  MathOperation? _operator; // O tipo MathOperation é uma monada que retorna um tipo de operação matemática válida ou objeto nulo.
  String _operand2 = '';
  String _errorMessage = '';
  
  
  String get display{
      if (_errorMessage.isNotEmpty) return _errorMessage;
      final opSymbol = _operator?.symbol ?? '';
      final text = '$_operand1 $opSymbol $_operand2'.trim();
      return text.isEmpty ? '0' : text;
  }

  bool get hasError => _errorMessage.isNotEmpty;

/// [summary] Método responsável por lidar com a entrada de dígitos na calculadora. Ele verifica se há um erro atual e, se não houver, atualiza o operando correspondente com o dígito pressionado.
  void onDigitPressed(String digit){
    if (hasError) clear();

    if (_operator == null){
      if (digit == '.' && _operand1.contains('.')) return; // Evita que o usuário insira mais de um ponto decimal no operando 1.
      _operand1 += digit;
    } else {
      if (digit == '.' && _operand2.contains('.')) return; // Evita que o usuário insira mais de um ponto decimal no operando 2.
      _operand2 += digit;
    }
    notifyListeners(); // Notifica os ouvintes que o estado do objeto mudou, para que a interface do usuário seja atualizada.
  }

  void onOperatorPressed(String symbol){
    if (hasError) clear();
    if (_operand1.isEmpty) return; // Evita que o usuário selecione um operador antes de inserir o primeiro operando. Pasme, isso não deveria ser considerado um erro, pois o usuário pode querer começar a calcular com um número negativo, por exemplo: -5 + 3. Mas para simplificar a lógica, vamos exigir que o usuário insira o primeiro operando antes de selecionar um operador. Ou calcular funções que não estão definidas nessa calculadora, como raiz quadrada, logaritmo, etc.

    if (_operand2.isNotEmpty){
      calculateResult();
      if (hasError) return;
    }

    _operator = MathOperation.fromSymbol(symbol);
    notifyListeners();
  }

  void calculateResult(){
    if (hasError) return;
    if (_operand1.isEmpty || _operator == null || _operand2.isEmpty) return;

    final num1 = double.tryParse(_operand1) ?? 0.0; // Tenta converter o operando 1 para um número, se falhar, retorna 0.0 como valor padrão.
    final num2 = double.tryParse(_operand2) ?? 0.0;
    double result = 0.0;

    try{
      switch (_operator!) {
        case MathOperation.addition:
          result = num1 + num2;
          break;
        case MathOperation.subtraction:
          result = num1 - num2;
          break;
        case MathOperation.multiplication:
          result = num1 * num2;
          break;
        case MathOperation.division:
          if (num2 == 0) throw DivisionByZeroException();
          result = num1 / num2;
          break;
      }

      _operand1 = _formatResult(result);
      _operator = null;
      _operand2 = '';
    } on DivisionByZeroException catch (e){
      _errorMessage = e.toString();
      _operand1 = '';
      _operator = null;
      _operand2 = '';
    }
    notifyListeners();
  }

  String _formatResult(double result) {
    if (result == result.truncateToDouble()) {
      return result.toInt().toString(); // Se o resultado for um número inteiro, retorna a parte inteira como string.
    }
    
    return result.toString().replaceAll('.', ',');
  }

  void clear(){
    _operand1 = '';
    _operator = null;
    _operand2 = '';
    _errorMessage = '';
    notifyListeners();
  }

  void deleteLast(){
    if (hasError) {
      clear();
      return;
    }

    if (_operand2.isNotEmpty){
      _operand2 = _operand2.substring(0, _operand2.length - 1);
    } else if (_operator != null){
      _operator = null;
    } else if (_operand1.isNotEmpty){
      _operand1 = _operand1.substring(0, _operand1.length - 1);
    }
    notifyListeners();
  }


}