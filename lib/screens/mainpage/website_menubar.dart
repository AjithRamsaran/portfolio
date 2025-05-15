import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio_ajith/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../widgets/components/components.dart';

class WebsiteMenuBar extends StatefulWidget {
  WebsiteMenuBar(
      {super.key,
      this.onPressed,
      required this.scaffoldKey,
      required this.currentIndex});

  int currentIndex;
  Function? onPressed;
  GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<WebsiteMenuBar> createState() => _WebsiteMenuBarState();
}

class _WebsiteMenuBarState extends State<WebsiteMenuBar> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    const Color navLinkColor = Color(0xFF6E7274);
    return Container(
      height: 66,
      width: double.infinity,
      decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0x1A000000), offset: Offset(0, 2), blurRadius: 4)
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth: ResponsiveBreakpoints.of(context).isDesktop
                    ? MediaQuery.of(context).size.width > 1200
                        ? 1200
                        : MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.width),
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/ar1.png',
                    height: 66,
                    //width: 120,
                    fit: BoxFit.fitHeight,
                  ),
                  ResponsiveVisibility(
                    visible: false,
                    visibleConditions: const [
                      Condition.largerThan(name: TABLET)
                    ],
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ResponsiveVisibility(
                          visible: false,
                          visibleConditions: const [
                            Condition.largerThan(name: TABLET)
                          ],
                          child: HoverBorderButton(
                            label: 'About',
                            onPressed: () {
                              widget.onPressed?.call(0);
                            },
                            isHighlighted: _currentIndex == 0,
                          ),
                        ),
                        ResponsiveVisibility(
                          visible: false,
                          visibleConditions: const [
                            Condition.largerThan(name: TABLET)
                          ],
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: HoverBorderButton(
                              label: 'Projects',
                              onPressed: () {
                                widget.onPressed?.call(1);
                              },
                              isHighlighted: _currentIndex == 1,
                            ),
                          ),
                        ),
                        ResponsiveVisibility(
                          visible: false,
                          visibleConditions: const [
                            Condition.largerThan(name: TABLET)
                          ],
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: HoverBorderButton(
                                label: 'Books',
                                onPressed: () {
                                  widget.onPressed?.call(2);
                                },
                                isHighlighted: _currentIndex == 2,
                              )),
                        ),
                        ResponsiveVisibility(
                          visible: false,
                          visibleConditions: const [
                            Condition.largerThan(name: TABLET)
                          ],
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: HoverBorderButton(
                                label: 'Resume',
                                onPressed: () {
                                  widget.onPressed?.call(3);
                                },
                                isHighlighted: _currentIndex == 3,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      /*AnimatedSwitcher(
                          duration: Duration(milliseconds: 100),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isDarkMode = !isDarkMode;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                isDarkMode
                                    ? Icons.dark_mode
                                    : Icons.light_mode_outlined,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                          )),*/
                      /*Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.ac_unit),
                      ),*/
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: RainbowButton(
                          label: "Let's Work",
                          onPressed: () {
                            openEmail();
                          },
                        ),
                      ),
                      ResponsiveVisibility(
                        visible: false,
                        visibleConditions: const [
                          Condition.smallerThan(name: DESKTOP)
                        ],
                        child: Builder(builder: (context) {
                          return IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              widget.scaffoldKey.currentState?.openDrawer();
                            },
                          );
                        }),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
