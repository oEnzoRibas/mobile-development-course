import 'package:dex_calculator/features/calculator/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import '../widgets/display_panel.dart';
import '../widgets/keypad_button.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  // Injeção manual simples.
  final CalculatorController _controller = CalculatorController();

  // Destructor para liberar recursos do controller quando a página for descartada. Isso evita vazamentos de memória.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleButtonTap(String label) {
    if (label == 'C') {
      _controller.clear();
    } else if (label == '<--') {
      _controller.deleteLast();
    } else if (label == '=') {
      _controller.calculateResult();
    } else if (['/', '*', '-', '+'].contains(label)) {
      _controller.onOperatorPressed(label);
    } else {
      _controller.onDigitPressed(label);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Escuta as mudanças do controller e refaz apenas o painel superior
            Expanded(
              flex: 2,
              child: ListenableBuilder(
                listenable: _controller,
                builder: (context, _) {
                  return DisplayPanel(
                    content: _controller.display,
                    isError: _controller.hasError,
                  );
                },
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    _buildButtonRow(['C', '<--', '/', '*']),
                    _buildButtonRow(['7', '8', '9', '-']),
                    _buildButtonRow(['4', '5', '6', '+']),
                    _buildButtonRow(['1', '2', '3', '=']),
                    _buildButtonRow(['0', '.']),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Constrói uma linha de botões a partir de uma lista de rótulos. O botão '0' ocupa o dobro do espaço.
  Widget _buildButtonRow(List<String> labels) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: labels.map((label) {
          int flex = label == '0' ? 2 : 1;
          return Expanded(
            flex: flex,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: KeypadButton(
                label: label,
                onTap: () => _handleButtonTap(label),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}