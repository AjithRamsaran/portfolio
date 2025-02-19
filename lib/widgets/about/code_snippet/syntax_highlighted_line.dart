import 'package:flutter/material.dart';

import 'code_snippet.dart';

class SyntaxHighlightedLine extends StatelessWidget {
  final List<SyntaxText> textParts;

  const SyntaxHighlightedLine({Key? key, required this.textParts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: textParts.map((part) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            part.text,
            style: TextStyle(
                color: part.color,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'inter' //'monospace',
            ),
          ),
        );
      }).toList(),
    );
  }
}
