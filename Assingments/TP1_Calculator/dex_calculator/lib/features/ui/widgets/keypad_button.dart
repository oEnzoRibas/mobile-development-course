import 'package:flutter/material.dart';

class KeypadButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const KeypadButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isOperator = ['/', '*', '-', '+', '='].contains(label);
    final isAction = ['C', 'Del'].contains(label);

    Color bgColor = const Color(0xFF3E3E3E);
    if (isOperator) bgColor = Theme.of(context).colorScheme.primary;
    if (isAction) bgColor = Theme.of(context).colorScheme.error.withOpacity(0.8);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: onTap,
      child: Text(
        label,
        style: const TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}