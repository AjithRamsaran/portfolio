import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_ajith/screens/resume_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../utils/seo.dart';

import '../widgets/about/ui_widget/ui_widget.dart';
import 'book_screen.dart';
import '../utils/utils.dart';
import 'mainpage/website_menubar.dart';
import '../widgets/about/about.dart';
import '../widgets/components/components.dart';
import '../widgets/footer/footer.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key, required this.title});

  final String title;

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  GlobalKey key = GlobalKey();
  GlobalKey cardKey = GlobalKey();
  double height = 0;
  double heightCard = 0;

  int currentIndex = 0;
  ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey projectKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    log("Updated");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setHeight();
    });
    // Create the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Slow animation speed
    )..repeat(reverse: true); // Loop animation continuously

    // Define the animation with a Tween
    _animation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void setHeight() {
    try {
      final RenderBox renderBox =
          key.currentContext!.findRenderObject() as RenderBox;
      setState(() {
        height = renderBox.size.height;
      });
    } catch (e) {}
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        final RenderBox renderBoxCard =
            cardKey.currentContext!.findRenderObject() as RenderBox;
        setState(() {
          heightCard = renderBoxCard.size.height;
        });
        print('height: $height' + 'heightCard: $heightCard');
      } catch (e) {
        print(e);
      }
    });
  }

  setCurrentIndex(int index) {
    if (index == 1) {
      //make the project key visible
      setState(() {
        currentIndex = 0;
      });
      Future.delayed(Duration(milliseconds: 200), () {
        Scrollable.ensureVisible(projectKey.currentContext!,
            duration: Duration(milliseconds: 500));
      });
    } else {
      setState(() {
        currentIndex = index;
      });
    }
  }

  Widget _buildDrawerListTile(
      BuildContext context, int index, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon), // Add an icon
      title: Text(title),
      selected: currentIndex == index, // Highlight the selected item
      onTap: () {
        setCurrentIndex(index);
        Navigator.pop(context); // Close the drawer
      },
    );
  }

  Widget _buildDrawerHeader() {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: Colors.blue, // Example background color
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center the content
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(39),
              child: Image.asset('assets/images/profile.jpeg', height: 78)),
          // Example
          const Text(
            'Ajith Ramsaran',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const Text(
            'Flutter Developer',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    addSeoContent();

    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 66),
          child: WebsiteMenuBar(
            key: ValueKey(currentIndex.toString()),
            onPressed: setCurrentIndex,
            scaffoldKey: scaffoldKey,
            currentIndex: currentIndex,
          )),
      drawer: Drawer(
        child: ListView(
          children: [
            _buildDrawerHeader(), // Custom header
            _buildDrawerListTile(context, 0, 'About', Icons.person),
            _buildDrawerListTile(context, 1, 'Projects', Icons.work),
            _buildDrawerListTile(context, 2, 'Books', Icons.book),
            _buildDrawerListTile(context, 3, 'Resume', Icons.description),
          ],
        ),
      ),
      body: Container(
        child: currentIndex == 2
            ? BookScreen()
            : currentIndex == 3
                ? Center(
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth:
                                ResponsiveBreakpoints.of(context).isDesktop
                                    ? MediaQuery.of(context).size.width > 1200
                                        ? 1200
                                        : MediaQuery.of(context).size.width
                                    : MediaQuery.of(context).size.width),
                        child: ResumeScreen()),
                  )
                : RawScrollbar(
                    //add color to scrollbar
                    controller: _scrollController,
                    thumbColor: Colors.grey,
                    thickness:
                        ResponsiveBreakpoints.of(context).isDesktop ? 8 : 5,
                    radius: Radius.circular(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: BoxConstraints(
                              maxWidth:
                                  ResponsiveBreakpoints.of(context).isDesktop
                                      ? MediaQuery.of(context).size.width > 1200
                                          ? 1200
                                          : MediaQuery.of(context).size.width
                                      : MediaQuery.of(context).size.width),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16, /*vertical: 16*/
                          ),
                          child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(
                              scrollbars: false,
                            ),
                            child: SingleChildScrollView(
                              controller: _scrollController,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AnimatedBuilder(
                                          animation: _animation,
                                          builder: (context, child) {
                                            return Container(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    constraints: BoxConstraints(
                                                        minHeight:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height -
                                                                150),
                                                    alignment: Alignment.center,
                                                    margin: EdgeInsets.only(
                                                        bottom: 0),
                                                    child: ResponsiveRowColumn(
                                                      key: key,
                                                      layout: ResponsiveBreakpoints
                                                                  .of(context)
                                                              .equals(DESKTOP)
                                                          ? ResponsiveRowColumnType
                                                              .ROW
                                                          : ResponsiveRowColumnType
                                                              .COLUMN,
                                                      rowCrossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      columnCrossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      columnMainAxisSize:
                                                          MainAxisSize.min,
                                                      columnSpacing: 50,
                                                      rowSpacing: 50,
                                                      children: [
                                                        ResponsiveRowColumnItem(
                                                          rowFlex: 2,
                                                          child:
                                                              WelcomeToMySiteWidget(
                                                            onPressed: () {
                                                              setState(() {
                                                                currentIndex =
                                                                    3;
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        ResponsiveRowColumnItem(
                                                          rowFlex: 1,
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 16),
                                                            child: Column(
                                                              children: [
                                                                SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    // Spacing between rows of buttons
                                                                    children: [
                                                                      InteresedButton(
                                                                        label:
                                                                            "Cricketer",
                                                                        color: Color.fromRGBO(
                                                                            207,
                                                                            250,
                                                                            254,
                                                                            1),
                                                                        textColor: Color.fromRGBO(
                                                                            22,
                                                                            78,
                                                                            99,
                                                                            1),
                                                                        highlightedColor: Colors
                                                                            .cyan
                                                                            .shade200,
                                                                        //Color.fromRGBO(207, 250, 254,1),
                                                                        borderColor: Color.fromRGBO(
                                                                            14,
                                                                            116,
                                                                            144,
                                                                            0.2),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      InteresedButton(
                                                                        label:
                                                                            "Coder",
                                                                        color: Colors
                                                                            .lightGreen
                                                                            .shade100,
                                                                        textColor: Color.fromRGBO(
                                                                            20,
                                                                            83,
                                                                            45,
                                                                            1),
                                                                        highlightedColor: Color.fromRGBO(
                                                                            220,
                                                                            252,
                                                                            231,
                                                                            1),
                                                                        borderColor: Color.fromRGBO(
                                                                            21,
                                                                            218,
                                                                            61,
                                                                            0.2),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      InteresedButton(
                                                                        label:
                                                                            "Runner",
                                                                        color: Colors
                                                                            .orange
                                                                            .shade100,
                                                                        textColor: Color.fromRGBO(
                                                                            124,
                                                                            45,
                                                                            18,
                                                                            1),
                                                                        highlightedColor: Colors
                                                                            .orange
                                                                            .shade200,
                                                                        borderColor: Color.fromRGBO(
                                                                            194,
                                                                            65,
                                                                            12,
                                                                            0.2),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      InteresedButton(
                                                                        label:
                                                                            "Traveller",
                                                                        color: Colors
                                                                            .pink
                                                                            .shade100,
                                                                        textColor:
                                                                            Colors.brown,
                                                                        highlightedColor: Colors
                                                                            .pink
                                                                            .shade200,
                                                                        borderColor: Color.fromRGBO(
                                                                            190,
                                                                            24,
                                                                            93,
                                                                            0.2),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      InteresedButton(
                                                                        label:
                                                                            "Science Enthusiast",
                                                                        color: Colors
                                                                            .grey
                                                                            .shade200,
                                                                        textColor: Color.fromRGBO(
                                                                            15,
                                                                            23,
                                                                            42,
                                                                            1),
                                                                        highlightedColor: Colors
                                                                            .grey
                                                                            .shade300,
                                                                        borderColor: Color.fromRGBO(
                                                                            51,
                                                                            65,
                                                                            85,
                                                                            0.2),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 16,
                                                                ),
                                                                CodeSnippetUI(),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (ResponsiveBreakpoints.of(
                                                              context)
                                                          .isDesktop ||
                                                      ResponsiveBreakpoints.of(
                                                              context)
                                                          .isTablet)
                                                    Positioned(
                                                      left: (MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          2.5),
                                                      top: (height == 0
                                                              ? (MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  2)
                                                              : MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height -
                                                                  196 - //-66 - 30 -100
                                                                  heightCard) +
                                                          _animation.value,
                                                      child:
                                                          MovingLinkedinWidget(
                                                        cardKey: cardKey,
                                                      ),
                                                    )
                                                ],
                                              ),
                                            );
                                          }),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 40, bottom: 0),
                                        child: ResponsiveRowColumn(
                                          layout:
                                              ResponsiveBreakpoints.of(context)
                                                      .smallerThan(DESKTOP)
                                                  ? ResponsiveRowColumnType
                                                      .COLUMN
                                                  : ResponsiveRowColumnType.ROW,
                                          rowCrossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          columnCrossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          columnMainAxisSize: MainAxisSize.min,
                                          rowPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 80),
                                          columnPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 30),
                                          columnSpacing: 60,
                                          rowSpacing: 60,
                                          rowMainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          // Space between rows
                                          children: [
                                            ResponsiveRowColumnItem(
                                              rowFlex: 4,
                                              rowFit: FlexFit.loose,
                                              child: ThiruvalluvarImageWidget(),
                                            ),
                                            ResponsiveRowColumnItem(
                                                rowFlex: 4,
                                                rowFit: FlexFit.loose,
                                                child: BioIntroWidget()),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          key: projectKey,
                                          margin: EdgeInsets.all(16),
                                          child: MyProjects()),
                                      FooterWidget()
                                    ],
                                  )
                                ],
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
