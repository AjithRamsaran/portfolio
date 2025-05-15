import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../components/gradient_text.dart';
import '../summary/summary_widget.dart';

class BioIntroWidget extends StatelessWidget {
  const BioIntroWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResponsiveRowColumn(
          layout: !ResponsiveBreakpoints.of(context).isDesktop
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          rowCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: Column(
                children: [
                  GradientText(
                    text: '28',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF06B6D4),
                        // Cyan
                        Color(0xFF0EA5E9),
                        // Blue
                        Color(0xFF3B82F6),
                        // Dark Blue
                      ],
                    ),
                  ),
                  Text(
                    'Years Old',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(148, 163, 184, 1),
                    ),
                  ),
                ],
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: Container(
                //color: Colors.pink,
                //height: 400,
                child: const Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GradientText(
                      text: '5+',
                      softWrap: false,
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF06B6D4),
                          // Cyan
                          Color(0xFF0EA5E9),
                          // Blue
                          Color(0xFF3B82F6),
                          // Dark Blue
                        ],
                      ),
                    ),
                    /*const SizedBox(
              height: 2),*/
                    Text(
                      'Years Mobile Dev Experience',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(148, 163, 184, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: Container(
                //color: Colors.pink,
                //height: 400,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GradientText(
                      text: '1',
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF06B6D4),
                          // Cyan
                          Color(0xFF0EA5E9),
                          // Blue
                          Color(0xFF3B82F6),
                          // Dark Blue
                        ],
                      ),
                    ),
                    /*  const SizedBox(
              height: 2),*/
                    Text(
                      'Amazing Life',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(148, 163, 184, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: Column(
                children: [
                  GradientText(
                    softWrap: false,
                    text: '1000+',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.visible,
                      // overflow: TextOverflow.visible
                    ),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF06B6D4),
                        // Cyan
                        Color(0xFF0EA5E9),
                        // Blue
                        Color(0xFF3B82F6),
                        // Dark Blue
                      ],
                    ),
                  ),
                  /*const SizedBox(
            height: 2),*/
                  Text(
                    'Commits',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(148, 163, 184, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SummaryWidget()
      ],
    );
  }
}
