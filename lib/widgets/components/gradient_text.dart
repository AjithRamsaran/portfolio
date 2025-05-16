import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;
  final bool softWrap;

  const GradientText(
      {Key? key,
      required this.text,
      required this.style,
      required this.gradient,
      this.softWrap = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        );
      },
      blendMode: BlendMode.srcIn,
      child: Text(
        text,
        style: style,
        softWrap: softWrap,
      ),
    );
  }
}
