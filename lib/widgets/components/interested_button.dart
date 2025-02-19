import 'package:flutter/material.dart';

class InteresedButton extends StatefulWidget {
  final String label;
  VoidCallback? onPressed;
  final Color color;
  final Color highlightedColor;
  final Color textColor;
  final Color borderColor;
  double? fontSize;

  InteresedButton({
    Key? key,
    required this.label,
    this.onPressed,
    required this.color,
    required this.highlightedColor,
    required this.textColor,
    required this.borderColor,
    this.fontSize,
  }) : super(key: key);

  @override
  State<InteresedButton> createState() => _InteresedButtonState();
}

class _InteresedButtonState extends State<InteresedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: BoxDecoration(
          color: !_isHovered ? widget.color : widget.highlightedColor,
          // Background color
          border: Border.all(color: widget.borderColor, width: 2),
          borderRadius: BorderRadius.circular(4), // Optional: Rounded corners
        ),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: Text(
            widget.label,
            style: TextStyle(
              color: widget.textColor,
              fontSize: widget.fontSize ?? 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
