import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'timeline_item.dart';

class TimeLineItemView extends StatefulWidget {
  TimeLineItemView({super.key, required this.item});

  TimeLineItem item;

  @override
  State<TimeLineItemView> createState() => _TimeLineItemViewState();
}

class _TimeLineItemViewState extends State<TimeLineItemView> {
  bool _isHovered = false;
  final GlobalKey<TooltipState> _tooltipKey = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Tooltip(
          key: _tooltipKey,
          triggerMode: TooltipTriggerMode.manual,
          exitDuration: Duration(seconds: 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          richMessage: TextSpan(
            children: [
              TextSpan(
                text: widget.item.title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              TextSpan(
                text: '\n${widget.item.description}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              !(ResponsiveBreakpoints.of(context).isMobile ||
                  ResponsiveBreakpoints.of(context).isPhone ||
                  ResponsiveBreakpoints.of(context).isTablet)
                  ? MouseRegion(
                onEnter: (_) {
                  setState(() => _isHovered = true);
                  Future.delayed(Duration(milliseconds: 500))
                      .then((value) {
                    _tooltipKey.currentState?.ensureTooltipVisible();
                  });
                },
                onExit: (_) {
                  Future.delayed(Duration(seconds: 1), () {
                    setState(() => _isHovered = false);
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      height: _isHovered ? 25 : 25,
                      width: 5,
                      duration: Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                          color: /*_isHovered ? Colors.grey :*/
                          Colors.blue),
                    ),
                    SizedBox(height: 8),
                    /*if (!_isHovered)*/
                    Icon(Icons.school_outlined),
                  ],
                ),
              )
                  : GestureDetector(
                onTap: () {
                  Future.delayed(Duration(milliseconds: 500))
                      .then((value) {
                    _tooltipKey.currentState?.ensureTooltipVisible();
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      height: _isHovered ? 25 : 25,
                      width: 5,
                      duration: Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                          color: _isHovered ? Colors.grey : Colors.blue),
                    ),
                    SizedBox(height: 8),
                    /*if (!_isHovered)*/
                    Icon(Icons.school_outlined),
                  ],
                ),
              ),

              /*if (_isHovered)
                Text(widget.item.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              if (_isHovered)
                Text(widget.item.description, style: TextStyle(fontSize: 16)),*/
            ],
          ),
        ),
      ],
    );
  }
}