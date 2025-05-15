import 'package:flutter/material.dart';
import 'dart:math' as math;

class ThiruvalluvarImageWidget extends StatelessWidget {
  const ThiruvalluvarImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: 30),
      child: Stack(
        children: [
          Transform.rotate(
            angle: -20 * math.pi / 180,
            child: _ThiruvalluvarImageWidget(),
          ),
          Transform.rotate(
            angle: -15 * math.pi / 180,
            child: _ThiruvalluvarImageWidget(),
          ),
          Transform.rotate(
            angle: -8 * math.pi / 180,
            child: _ThiruvalluvarImageWidget(),
          ),
          _ThiruvalluvarImageWidget(),
        ],
      ),
    );
  }
}

class _ThiruvalluvarImageWidget extends StatelessWidget {
  const _ThiruvalluvarImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      //padding: EdgeInsets.all(4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/images/thiruvallur.jpeg',
          height: 350,
          width: 450,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
