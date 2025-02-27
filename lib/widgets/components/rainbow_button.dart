import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RainbowButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  EdgeInsets? padding;

   RainbowButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.padding,
  }) : super(key: key);

  @override
  State<RainbowButton> createState() => _RainbowButtonState();
}

class _RainbowButtonState extends State<RainbowButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: widget.padding ?? EdgeInsets.symmetric(
            horizontal: !_isHovered ? 16 : 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.transparent, // Background color
          border: !_isHovered
              ? Border.all(color: Colors.blue.shade200, width: 2)
              : Border.symmetric(
                  horizontal: BorderSide(color: Colors.blue, width: 2),
                  vertical: BorderSide(color: Colors.blue, width: 2),
                ),
          borderRadius: BorderRadius.circular(8), // Optional: Rounded corners
        ),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: Text(
            widget.label,
            style: TextStyle(
              color: _isHovered ? Colors.blue : Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
