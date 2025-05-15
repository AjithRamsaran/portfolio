import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_ajith/widgets/footer/footer.dart';

import '../../../utils/url_handler.dart';
import '../../components/gradient_text.dart';
import '../../components/rainbow_button.dart';

class WelcomeToMySiteWidget extends StatefulWidget {
  WelcomeToMySiteWidget({super.key, this.onPressed});

  OnPressed? onPressed;

  @override
  State<WelcomeToMySiteWidget> createState() => _WelcomeToMySiteWidgetState();
}

class _WelcomeToMySiteWidgetState extends State<WelcomeToMySiteWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to my site',
            style: GoogleFonts.openSans(
              color: Color(0xFF0EA5E9),
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Default color for the text
              ),
              children: [
                TextSpan(
                  text: "I'm ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 48,
                  ),
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: GradientText(
                    text: 'Ajith Ramsaran',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
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
                ),
                TextSpan(
                  text: ',',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 48,
                  ),
                ),
                TextSpan(
                  text: ' a Flutter developer.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 48,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              'I love building high-performance mobile apps with Flutter, creating smooth animations, seamless API integrations, and intuitive user experiences that make you go WOW!',
              style: GoogleFonts.notoSans(
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              "I'm always eager to learn and explore new technologies, frameworks, and tools. Currently, I'm diving into Flutter Web, adaptive UI design, and performance optimization.",
              style: GoogleFonts.notoSans(
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              RainbowButton(
                label: "Let's Work",
                onPressed: () {
                  openEmail();
                },
              ),
              SizedBox(width: 16),
              RainbowButton(
                label: 'Resume',
                onPressed: () {
                  setState(() {
                    //currentIndex = 3;
                    widget.onPressed?.call();
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
