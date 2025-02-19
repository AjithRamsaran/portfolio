import 'package:flutter/material.dart';

class HoverBorderButton2 extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  bool selected;
  EdgeInsets? padding;

  HoverBorderButton2({
    Key? key,
    required this.label,
    required this.onPressed,
    this.selected = false,
    this.padding,
  }) : super(key: key);

  @override
  _HoverBorderButtonState createState() => _HoverBorderButtonState();
}

class _HoverBorderButtonState extends State<HoverBorderButton2> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: widget.padding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.transparent, // Background color
            border: _isHovered || widget.selected
                ? Border.all(color: Colors.blue, width: 2)
                : Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(8), // Optional: Rounded corners
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: _isHovered || widget.selected ? Colors.blue : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
