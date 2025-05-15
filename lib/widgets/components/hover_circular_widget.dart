import 'package:flutter/material.dart';

class HoveredCircularWidget extends StatefulWidget {
  const HoveredCircularWidget({super.key, required this.color});

  final Color color;

  @override
  State<HoveredCircularWidget> createState() => _HoveredCircularWidgetState();
}

class _HoveredCircularWidgetState extends State<HoveredCircularWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: Container(
        height: 16,
        width: 16,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: _isHovered ? widget.color : Color(0xFF334155)),
      ),
    );
  }
}
