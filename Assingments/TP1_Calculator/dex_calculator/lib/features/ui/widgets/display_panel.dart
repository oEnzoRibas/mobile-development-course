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
      padding: const EdgeInsets.all(32.0),
      child: Text(
        content,
        style: TextStyle(
          fontSize: isError ? 17 : 48,
          fontWeight: FontWeight.w400,
          color: isError ? Theme.of(context).colorScheme.error : Colors.white,
        ),
      ),
    );
  }
}