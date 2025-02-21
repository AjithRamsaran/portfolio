import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../components/components.dart';
import 'code_snippet.dart';



class CodeSnippetUI extends StatelessWidget {
  Color _keywords = Colors.orange; //Color(0xFFCC7832);
  Color _annotation = Color(0xFFBBB529);
  final Color _type = Colors.white; //Color(0xFFA9B7C6);
  Color _variableAndParams = Colors.pink.shade200; //Color(0xFF9876AA);
  Color _function = Colors.blue; //Color(0xFFFFC66D);
  Color _string = Colors.lightGreen; //Color(0xFF6A8759);
  Color _number = Color(0xFF6897BB);
  Color _enum = Color(0xFFCC7832);
  Color _operatorsAndSymbols = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Background color similar to the editor
      height: ResponsiveBreakpoints.of(context).isDesktop ||
          ResponsiveBreakpoints.of(context).isTablet
          ? MediaQuery.of(context).size.height / 2
          : MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFF10172a),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF10172a), // Code editor background
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(226, 232, 240, 0.4),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  //bottom border only
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF1E2A47),
                      width: 1,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        HoveredCircularWidget(
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        HoveredCircularWidget(
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        HoveredCircularWidget(
                          color: Colors.green,
                        ),
                      ],
                    ),
                    Text(
                      'main.dart',
                      style: GoogleFonts.notoSans(
                          color: Color(0xFF64748B),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    HoveredIcon(
                      icon: Icons.copy,
                      onPressed: () {},
                      hoverColor: Colors.green,
                      color: Color(0xFF64748B),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: NoScrollbarBehavior(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      //physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Code Lines

                          SyntaxHighlightedLine(
                            textParts: [
                              SyntaxText('import ', _keywords),
                              SyntaxText(
                                  'package:flutter/material.dart', _string),
                              SyntaxText(';', _operatorsAndSymbols),
                            ],
                          ),

                          SyntaxHighlightedLine(
                            textParts: [
                              SyntaxText('class ', _keywords),
                              SyntaxText('Welcome', _type),
                              SyntaxText(' extends', _keywords),
                              SyntaxText(' StatelessWidget {', _type),
                            ],
                          ),

                          SyntaxHighlightedLine(
                            textParts: [
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('final ', _keywords),
                              SyntaxText('String', _type),
                              SyntaxText(' useCase', _variableAndParams),
                              SyntaxText(';', _type),
                            ],
                          ),

                          SyntaxHighlightedLine(
                            textParts: [
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('const ', _keywords),
                              SyntaxText('Welcome({', _type),
                              SyntaxText('super', _keywords),
                              SyntaxText('.key, ', _type),
                              SyntaxText('required this', _keywords),
                              SyntaxText('.useCase', _variableAndParams),
                              SyntaxText('});', _type),
                            ],
                          ),
                          SyntaxHighlightedLine(textParts: [
                            SyntaxText('   ', Colors.transparent),
                            SyntaxText('@', Colors.yellow),
                            SyntaxText('override', Colors.white),
                          ]),
                          SyntaxHighlightedLine(
                            textParts: [
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('Widget ', _type),
                              SyntaxText('build', _function),
                              SyntaxText('(BuildContext context) {', _type),
                            ],
                          ),
                          SyntaxHighlightedLine(
                            textParts: [
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('return ', _keywords),
                              SyntaxText('Column(', _function),
                            ],
                          ),
                          SyntaxHighlightedLine(
                            textParts: [
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('mainAxisAlignment: ', _keywords),
                              SyntaxText('MainAxisAlignment.center,', _type),
                            ],
                          ),

                          SyntaxHighlightedLine(
                            textParts: [
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('children: [', _type),
                            ],
                          ),

                          SyntaxHighlightedLine(
                            textParts: [
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('const ', _keywords),
                              SyntaxText('Text(', _function),
                              SyntaxText(
                                  '"This is my little slice of the internet.",',
                                  _string),
                              SyntaxText('style: ', _keywords),
                              SyntaxText('TextStyle', _function),
                              SyntaxText('(fontSize: ', _type),
                              SyntaxText('20', _number),
                              SyntaxText(', fontWeight: ', _type),
                              SyntaxText('FontWeight', _type),
                              SyntaxText('.bold)', _variableAndParams),
                              SyntaxText('),', _type),
                            ],
                          ),

                          SyntaxHighlightedLine(
                            textParts: [
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('Text(', _function),
                              SyntaxText(
                                  '"I use this site to \$useCase.",', _string),
                              SyntaxText('style: ', _keywords),
                              SyntaxText('TextStyle', _function),
                              SyntaxText('(fontSize: ', _type),
                              SyntaxText('16', _number),
                              SyntaxText(', fontStyle: ', _type),
                              SyntaxText('FontStyle', _type),
                              SyntaxText('.italic)', _variableAndParams),
                              SyntaxText('),', _type),
                            ],
                          ),

                          SyntaxHighlightedLine(
                            textParts: [
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('],', _type),
                            ],
                          ),

                          SyntaxHighlightedLine(
                            textParts: [
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText(');', _type),
                            ],
                          ),

                          SyntaxHighlightedLine(
                            textParts: [
                              SyntaxText('   ', Colors.transparent),
                              SyntaxText('}', _type),
                            ],
                          ),

                          SyntaxHighlightedLine(
                            textParts: [
                              SyntaxText('}', _type),
                            ],
                          ),

                          SyntaxHighlightedLine(textParts: [
                            SyntaxText('void ', _keywords),
                            SyntaxText('main', _function),
                            SyntaxText('() => runApp(', _type),
                            SyntaxText('const ', _keywords),
                            SyntaxText('MaterialApp(', _function),
                            SyntaxText('home: ', _type),
                            SyntaxText('Scaffold(', _function),
                            SyntaxText('body: ', _type),
                            SyntaxText('Center(', _function),
                            SyntaxText('child: ', _type),
                            SyntaxText('Welcome(', _function),
                            SyntaxText('useCase: ', _type),
                            SyntaxText('"explore new tech"', _string),
                            SyntaxText(')))));', _type),
                          ])
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
