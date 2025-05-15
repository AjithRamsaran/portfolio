import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/url_handler.dart';

class MovingLinkedinWidget extends StatelessWidget {
   MovingLinkedinWidget({super.key,required this.cardKey});
  final Key cardKey;
  @override
  Widget build(BuildContext context) {
    return Container(
      key: cardKey,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/ar1.png',
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        'Ajith Ramsaran',
                        style: GoogleFonts.notoSans(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '@ajithramsaran',
                        style: GoogleFonts.notoSans(
                          color: Color.fromRGBO(100, 116, 139, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.blue,
                        // Button background color
                        foregroundColor: Colors.white,
                        // Text color
                        // padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
                        ),
                        elevation: 4, // Button shadow
                      ),
                      onPressed: () {
                        openUrl('https://linkedin.com/in/ajithramsaran');
                      },
                      child: Text(
                        'Follow',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Hey, connect with me on LinkedIn. I'm not really a social media person 🙃 I'm looking to connect with fellow developers and to learn about the latest",
                style: GoogleFonts.notoSans(
                  color: Color.fromRGBO(100, 116, 139, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                softWrap: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '500+',
                    style: GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    ' Connections',
                    style: GoogleFonts.notoSans(fontWeight: FontWeight.w400),
                  ),
                  Text(
                    '  871',
                    style: GoogleFonts.notoSans(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    ' Followers',
                    style: GoogleFonts.notoSans(fontWeight: FontWeight.w400),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
