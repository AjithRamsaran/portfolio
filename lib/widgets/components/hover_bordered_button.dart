import 'package:flutter/material.dart';

class HoverBorderButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  bool _isHighlighted;

  HoverBorderButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required bool isHighlighted ,
  })
      : _isHighlighted = isHighlighted,
        super(key: key);

  @override
  _HoverBorderButtonState createState() =>
      _HoverBorderButtonState(_isHighlighted);
}

class _HoverBorderButtonState extends State<HoverBorderButton> {

  bool _isHovered = false;
  bool _isHighlighted;

  _HoverBorderButtonState(this._isHighlighted);

  //assign the value of _isHighlighted to the value of the widget's _isHighlighted


  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        if (_isHighlighted)
          return;
        setState(() => _isHovered = true);
      },
      onExit: (_) {
        if (_isHighlighted)
          return;
        setState(() => _isHovered = false);
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.transparent, // Background color
            border: _isHovered || _isHighlighted
                ? Border.all(color: Colors.blue, width: 2)
                : Border.all(color: Colors.transparent, width: 2),
            borderRadius: BorderRadius.circular(8), // Optional: Rounded corners
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: _isHovered ? Colors.blue : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
