import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HoveredIcon extends StatefulWidget {
  const HoveredIcon(
      {super.key,
      required this.icon,
      this.onPressed,
      this.hoverColor = Colors.blue,
      this.color = Colors.black});

  final IconData icon;
  final Function? onPressed;
  final Color hoverColor;
  final Color color;

  @override
  State<HoveredIcon> createState() => _HoveredIconState();
}

class _HoveredIconState extends State<HoveredIcon> {
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
      child: GestureDetector(
        onTap: () {
          if (widget.onPressed != null) {
            widget.onPressed?.call();
          }
        },
        child: Icon(
          widget.icon,
          color: _isHovered ? widget.hoverColor : widget.color,
        ),
      ),
    );
  }
}
