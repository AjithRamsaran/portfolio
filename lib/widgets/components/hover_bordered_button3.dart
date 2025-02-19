import 'package:flutter/material.dart';

class HoverBorderButton3 extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  bool selected;
  EdgeInsets? padding;
  Color? selectedTextColor;
  Color? unselectedTextColor;
  Color? hoverTextColor;
  Color? selectedAndHoverBorderColor;
  Color? unselectedBorderColor;
  double borderWidth;
  double borderRadius;
  Color? unselectedBackgroundColor;
  Color? hoverBackgroundColor;
  Color? selectedBackgroundColor;

  HoverBorderButton3({
    Key? key,
    required this.label,
    required this.onPressed,
    this.selected = false,
    this.padding,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.hoverTextColor,
    this.selectedAndHoverBorderColor,
    this.unselectedBorderColor,
    this.borderWidth = 2,
    this.borderRadius = 8,
    this.unselectedBackgroundColor,
    this.hoverBackgroundColor,
    this.selectedBackgroundColor,
  }) : super(key: key);

  @override
  _HoverBorderButtonState createState() => _HoverBorderButtonState();
}

class _HoverBorderButtonState extends State<HoverBorderButton3> {
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
            color: _isHovered ? widget.hoverBackgroundColor : widget.selected ? widget.selectedBackgroundColor : widget.unselectedBackgroundColor ?? Colors.transparent, // Background color
            border: _isHovered || widget.selected
                ? Border.all(
                    color: widget.selectedAndHoverBorderColor ?? Colors.blue,
                    width: widget.borderWidth)
                : Border.all(
                    color: widget.unselectedBorderColor ?? Colors.grey,
                    width: widget.borderWidth),
            borderRadius: BorderRadius.circular(widget.borderRadius), // Optional: Rounded corners
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: _isHovered
                  ? widget.hoverTextColor
                  : widget.selected
                      ? widget.selectedTextColor ?? Colors.blue
                      : widget.unselectedTextColor ?? Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
