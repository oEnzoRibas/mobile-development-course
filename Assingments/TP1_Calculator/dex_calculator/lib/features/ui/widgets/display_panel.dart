import 'package:flutter/material.dart';

class DisplayPanel extends StatelessWidget {
  final String content;
  final bool isError;

  const DisplayPanel({
    super.key,
    required this.content,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.all(24.0),
      child: Text(
        content,
        style: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w300,
          color: isError ? Theme.of(context).colorScheme.error : Colors.white,
        ),
      ),
    );
  }
}