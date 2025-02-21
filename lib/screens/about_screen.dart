import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:portfolio_ajith/screens/resume_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'dart:math' as math;
import 'book_screen.dart';
import '../utils/utils.dart';
import 'mainpage/website_menubar.dart';
import '../widgets/about/about.dart';
import '../widgets/components/components.dart';
import '../widgets/footer/footer.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({super.key, required this.title});

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

  //write code to find height of key widget
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
    if (kIsWeb) {
      MetaSEO meta = MetaSEO();
      meta.author(author: 'Ajith Ramsaran');
      meta.description(description: "Ajith's portfolio");
      /*
      * Ajith Ramsaran
Ajith Ramsaran portfolio
Flutter developer
Flutter web developer
Mobile app developer
Flutter portfolio
Ajith Ramsaran projects
Ajith Ramsaran books
Ajith Ramsaran resume
Flutter web projects
Flutter mobile apps
High-performance mobile apps
Flutter animations
API integrations
User experience design
Adaptive UI design
Performance optimization
Flutter web development
Flutter app development
Mobile app development
Flutter developer portfolio
Ajith Ramsaran contact
Ajith Ramsaran LinkedIn
Ajith Ramsaran GitHub
Ajith Ramsaran blog
Flutter developer blog
Flutter tutorials
Flutter projects
Flutter examples
Flutter code snippets
Flutter widgets
Flutter packages
Flutter plugins
Flutter libraries
Flutter tools
Flutter resources
Flutter community
Flutter events
Flutter conferences
Flutter meetups
Flutter workshops
Flutter courses
Flutter training
Flutter certification
Flutter jobs
Flutter career
Flutter freelance
Flutter consulting
Flutter services
Flutter solutions
Flutter support
Flutter maintenance
Flutter updates
Flutter upgrades
Flutter migration
Flutter integration
Flutter testing
Flutter debugging
Flutter performance
Flutter optimization
Flutter security
Flutter best practices
Flutter design patterns
Flutter architecture
Flutter state management
Flutter navigation
Flutter routing
Flutter animations
Flutter transitions
Flutter gestures
Flutter touch events
Flutter accessibility
Flutter localization
Flutter internationalization
Flutter theming
Flutter styling
Flutter UI design
Flutter UX design
Flutter prototyping
Flutter wireframing
Flutter mockups
Flutter design systems
Flutter design tools
Flutter design resources
Flutter design inspiration
Flutter design trends
Flutter design tips
Flutter design tutorials
Flutter design examples
Flutter design projects
Flutter design portfolio
Flutter design showcase
Flutter design gallery
Flutter design blog
Flutter design articles
Flutter design guides
Flutter design documentation
Flutter design patterns
Flutter design principles
Flutter design techniques*/
      meta.keywords(keywords: "Ajith Ramsaran");
      meta.keywords(keywords: "Ajith Ramsaran portfolio");
      meta.keywords(keywords: "Flutter developer");
      meta.keywords(keywords: "Flutter web developer");
      meta.keywords(keywords: "Mobile app developer");
      meta.keywords(keywords: "Flutter portfolio");
      meta.keywords(keywords: "Ajith Ramsaran projects");
      meta.keywords(keywords: "Ajith Ramsaran books");
      meta.keywords(keywords: "Ajith Ramsaran resume");
      meta.keywords(keywords: "Flutter web projects");
      meta.keywords(keywords: "Flutter mobile apps");
      meta.keywords(keywords: "High-performance mobile apps");
      meta.keywords(keywords: "Flutter animations");
      meta.keywords(keywords: "API integrations");
      meta.keywords(keywords: "User experience design");
      meta.keywords(keywords: "Adaptive UI design");
      meta.keywords(keywords: "Performance optimization");
      meta.keywords(keywords: "Flutter web development");
      meta.keywords(keywords: "Flutter app development");
      meta.keywords(keywords: "Mobile app development");
      meta.keywords(keywords: "Flutter developer portfolio");
      meta.keywords(keywords: "Ajith Ramsaran contact");
      meta.keywords(keywords: "Ajith Ramsaran LinkedIn");
      meta.keywords(keywords: "Ajith Ramsaran GitHub");
      meta.keywords(keywords: "Ajith Ramsaran blog");
      meta.keywords(keywords: "Flutter developer blog");
      meta.keywords(keywords: "Flutter tutorials");
      meta.keywords(keywords: "Flutter projects");
      meta.keywords(keywords: "Flutter examples");
      meta.keywords(keywords: "Flutter code snippets");
      meta.keywords(keywords: "Flutter widgets");
      meta.keywords(keywords: "Flutter packages");
      meta.keywords(keywords: "Flutter plugins");
      meta.keywords(keywords: "Flutter libraries");
      meta.keywords(keywords: "Flutter tools");
      meta.keywords(keywords: "Flutter resources");
      meta.keywords(keywords: "Flutter community");
      meta.keywords(keywords: "Flutter events");
      meta.keywords(keywords: "Flutter conferences");
      meta.keywords(keywords: "Flutter meetups");
      meta.keywords(keywords: "Flutter workshops");
      meta.keywords(keywords: "Flutter courses");
      meta.keywords(keywords: "Flutter training");
      meta.keywords(keywords: "Flutter certification");
      meta.keywords(keywords: "Flutter jobs");
      meta.keywords(keywords: "Flutter career");
      meta.keywords(keywords: "Flutter freelance");
      meta.keywords(keywords: "Flutter consulting");
      meta.keywords(keywords: "Flutter services");
      meta.keywords(keywords: "Flutter solutions");
      meta.keywords(keywords: "Flutter support");
      meta.keywords(keywords: "Flutter maintenance");
      meta.keywords(keywords: "Flutter updates");
      meta.keywords(keywords: "Flutter upgrades");
      meta.keywords(keywords: "Flutter migration");
      meta.keywords(keywords: "Flutter integration");
      meta.keywords(keywords: "Flutter testing");
      meta.keywords(keywords: "Flutter debugging");
      meta.keywords(keywords: "Flutter performance");
      meta.keywords(keywords: "Flutter optimization");
      meta.keywords(keywords: "Flutter security");
      meta.keywords(keywords: "Flutter best practices");
      meta.keywords(keywords: "Flutter design patterns");
      meta.keywords(keywords: "Flutter architecture");
      meta.keywords(keywords: "Flutter state management");
      meta.keywords(keywords: "Flutter navigation");
      meta.keywords(keywords: "Flutter routing");
      meta.keywords(keywords: "Flutter animations");
      meta.keywords(keywords: "Flutter transitions");
      meta.keywords(keywords: "Flutter gestures");
      meta.keywords(keywords: "Flutter touch events");
      meta.keywords(keywords: "Flutter accessibility");
      meta.keywords(keywords: "Flutter localization");
      meta.keywords(keywords: "Flutter internationalization");
      meta.keywords(keywords: "Flutter theming");
      meta.keywords(keywords: "Flutter styling");
      meta.keywords(keywords: "Flutter UI design");
      meta.keywords(keywords: "Flutter UX design");
      meta.keywords(keywords: "Flutter prototyping");
      meta.keywords(keywords: "Flutter wireframing");
      meta.keywords(keywords: "Flutter mockups");
      meta.keywords(keywords: "Flutter design systems");
      meta.keywords(keywords: "Flutter design tools");
      meta.keywords(keywords: "Flutter design resources");
      meta.keywords(keywords: "Flutter design inspiration");
      meta.keywords(keywords: "Flutter design trends");
      meta.keywords(keywords: "Flutter design tips");
      meta.keywords(keywords: "Flutter design tutorials");
      meta.keywords(keywords: "Flutter design examples");
      meta.keywords(keywords: "Flutter design projects");
      meta.keywords(keywords: "Flutter design portfolio");
      meta.keywords(keywords: "Flutter design showcase");
      meta.keywords(keywords: "Flutter design gallery");
      meta.keywords(keywords: "Flutter design blog");
      meta.keywords(keywords: "Flutter design articles");
      meta.keywords(keywords: "Flutter design guides");
      meta.keywords(keywords: "Flutter design documentation");
      meta.keywords(keywords: "Flutter design patterns");
      meta.keywords(keywords: "Flutter design principles");
      meta.keywords(keywords: "Flutter design techniques");
      meta.keywords(keywords: "Kilofarms");
      meta.keywords(keywords: "RedBlackTree");
      meta.keywords(keywords: "Radius Agent");
      meta.keywords(keywords: "Ind by Intain");
    }

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
                                                        /*top: !(ResponsiveBreakpoints.of(context).isMobile ||
                                                                  ResponsiveBreakpoints.of(context)
                                                                      .isPhone ||
                                                                  ResponsiveBreakpoints.of(context)
                                                                      .isTablet) &&
                                                              (MediaQuery.of(context).size.height - height) / 4 >
                                                                  0
                                                          ? (MediaQuery.of(context).size.height - height) /
                                                              4
                                                          : 0,*/
                                                        bottom: /*!(ResponsiveBreakpoints.of(
                                                                        context)
                                                                    .isMobile ||
                                                                ResponsiveBreakpoints.of(
                                                                        context)
                                                                    .isPhone ||
                                                                ResponsiveBreakpoints.of(
                                                                        context)
                                                                    .isTablet)
                                                            ? (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height -
                                                                66 - height)
                                                            :*/
                                                            0),
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
                                                      /*rowPadding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      80,
                                                                  vertical: 80),
                                                          columnPadding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      25,
                                                                  vertical: 50),*/
                                                      columnSpacing: 50,
                                                      rowSpacing: 50,
                                                      children: [
                                                        ResponsiveRowColumnItem(
                                                          rowFlex: 2,
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 16),
                                                            /*constraints: BoxConstraints(
                                                                minHeight: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height -
                                                                    66 -
                                                                    100),*/
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Welcome to my site',
                                                                  style: GoogleFonts
                                                                      .openSans(
                                                                    color: Color(
                                                                        0xFF0EA5E9),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        16,
                                                                  ),
                                                                ),
                                                                RichText(
                                                                  text:
                                                                      const TextSpan(
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          48,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .black, // Default color for the text
                                                                    ),
                                                                    children: [
                                                                      TextSpan(
                                                                        text:
                                                                            "I'm ",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              48,
                                                                        ),
                                                                      ),
                                                                      WidgetSpan(
                                                                        alignment:
                                                                            PlaceholderAlignment.middle,
                                                                        child:
                                                                            GradientText(
                                                                          text:
                                                                              'Ajith Ramsaran',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                48,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                          gradient:
                                                                              LinearGradient(
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
                                                                        text:
                                                                            ',',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              48,
                                                                        ),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            ' a Flutter developer.',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              48,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              16),
                                                                  child: Text(
                                                                    'I love building high-performance mobile apps with Flutter, creating smooth animations, seamless API integrations, and intuitive user experiences that make you go WOW!',
                                                                    style: GoogleFonts
                                                                        .notoSans(
                                                                      color: Color(
                                                                          0xFF64748B),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          16,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              16),
                                                                  child: Text(
                                                                    "I'm always eager to learn and explore new technologies, frameworks, and tools. Currently, I'm diving into Flutter Web, adaptive UI design, and performance optimization.",
                                                                    style: GoogleFonts
                                                                        .notoSans(
                                                                      color: Color(
                                                                          0xFF64748B),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          16,
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height: 16),
                                                                Row(
                                                                  children: [
                                                                    RainbowButton(
                                                                      label:
                                                                          "Let's Work",
                                                                      onPressed:
                                                                          () {
                                                                        openEmail();
                                                                      },
                                                                    ),
                                                                    SizedBox(
                                                                        width:
                                                                            16),
                                                                    RainbowButton(
                                                                      label:
                                                                          'Resume',
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          currentIndex =
                                                                              3;
                                                                        });
                                                                      },
                                                                    )
                                                                  ],
                                                                )
                                                              ],
                                                            ),
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
                                                                    /*alignment: WrapAlignment.end,
                                                            crossAxisAlignment:
                                                            WrapCrossAlignment.end,
                                                            spacing: 10,
                                                            // Spacing between buttons
                                                            runSpacing: 10,*/
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
                                                                  66 /*kToolbarHeight*/ -
                                                                  heightCard -
                                                                  30 -
                                                                  100) +
                                                          _animation.value,
                                                      child: Container(
                                                        key: cardKey,
                                                        width: 300,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                        child: Card(
                                                          elevation: 5,
                                                          margin:
                                                              EdgeInsets.zero,
                                                          color: Colors.white,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Row(
                                                                  children: [
                                                                    Image.asset(
                                                                      'assets/images/ar1.png',
                                                                      width: 40,
                                                                      height:
                                                                          40,
                                                                    ),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        Text(
                                                                          'Ajith Ramsaran',
                                                                          style:
                                                                              GoogleFonts.notoSans(
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            fontSize:
                                                                                14,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          '@ajithramsaran',
                                                                          style:
                                                                              GoogleFonts.notoSans(
                                                                            color: Color.fromRGBO(
                                                                                100,
                                                                                116,
                                                                                139,
                                                                                1),
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            fontSize:
                                                                                14,
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    FilledButton(
                                                                        style: FilledButton
                                                                            .styleFrom(
                                                                          backgroundColor:
                                                                              Colors.blue,
                                                                          // Button background color
                                                                          foregroundColor:
                                                                              Colors.white,
                                                                          // Text color
                                                                          // padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8), // Rounded corners
                                                                          ),
                                                                          elevation:
                                                                              4, // Button shadow
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          openUrl(
                                                                              'https://linkedin.com/in/ajithramsaran');
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'Follow',
                                                                          style:
                                                                              TextStyle(color: Colors.white),
                                                                        ))
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Text(
                                                                  "Hey, connect with me on LinkedIn. I'm not really a social media person 🙃 I'm looking to connect with fellow developers and to learn about the latest",
                                                                  style: GoogleFonts
                                                                      .notoSans(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            100,
                                                                            116,
                                                                            139,
                                                                            1),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        14,
                                                                  ),
                                                                  softWrap:
                                                                      true,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      '500+',
                                                                      style: GoogleFonts.notoSans(
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                    Text(
                                                                      ' Connections',
                                                                      style: GoogleFonts.notoSans(
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                    Text(
                                                                      '  871',
                                                                      style: GoogleFonts.notoSans(
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    ),
                                                                    Text(
                                                                      ' Followers',
                                                                      style: GoogleFonts.notoSans(
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    )
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )

                                                  /*
                                          ResponsiveVisibility(
                                              visible: !ResponsiveBreakpoints.of(context)
                                                  .smallerThan(DESKTOP),
                                              child: Positioned(
                                                left: MediaQuery.of(context).size.width / 3,
                                                top: MediaQuery.of(context).size.height / 2,
                                                child: ShakeWidget(),
                                              ))
                                                                  */
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
                                          //rowMainAxisSize: MainAxisSize.max,
                                          /*rowPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 80,
                                                  vertical: 80),*/
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
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 30,
                                                    right: 30,
                                                    top: 30),
                                                child: Stack(
                                                  children: [
                                                    Transform.rotate(
                                                      angle:
                                                          -20 * math.pi / 180,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.white,
                                                            width: 4,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.2),
                                                              blurRadius: 5,
                                                              offset:
                                                                  const Offset(
                                                                      2, 2),
                                                            ),
                                                          ],
                                                        ),
                                                        //padding: EdgeInsets.all(4),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          child: Image.asset(
                                                            'assets/images/thiruvallur.jpeg',
                                                            height: 350,
                                                            width: 450,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Transform.rotate(
                                                      angle:
                                                          -15 * math.pi / 180,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.white,
                                                            width: 4,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.2),
                                                              blurRadius: 5,
                                                              offset:
                                                                  const Offset(
                                                                      2, 2),
                                                            ),
                                                          ],
                                                        ),
                                                        //padding: EdgeInsets.all(4),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          child: Image.asset(
                                                            'assets/images/thiruvallur.jpeg',
                                                            height: 350,
                                                            width: 450,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Transform.rotate(
                                                      angle: -8 * math.pi / 180,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.white,
                                                            width: 4,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.2),
                                                              blurRadius: 5,
                                                              offset:
                                                                  const Offset(
                                                                      2, 2),
                                                            ),
                                                          ],
                                                        ),
                                                        //padding: EdgeInsets.all(4),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          child: Image.asset(
                                                            'assets/images/thiruvallur.jpeg',
                                                            height: 350,
                                                            width: 450,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.white,
                                                          width: 4,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.2),
                                                            blurRadius: 5,
                                                            offset:
                                                                const Offset(
                                                                    2, 2),
                                                          ),
                                                        ],
                                                      ),
                                                      //padding: EdgeInsets.all(4),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child: Image.asset(
                                                          'assets/images/thiruvallur.jpeg',
                                                          height: 350,
                                                          width: 450,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            ResponsiveRowColumnItem(
                                                rowFlex: 4,
                                                rowFit: FlexFit.loose,
                                                child: Column(
                                                  children: [
                                                    ResponsiveRowColumn(
                                                      layout: /*ResponsiveBreakpoints.of(context)
                                                      .smallerThan(DESKTOP)*/
                                                          !ResponsiveBreakpoints
                                                                      .of(
                                                                          context)
                                                                  .isDesktop
                                                              ? ResponsiveRowColumnType
                                                                  .COLUMN
                                                              : ResponsiveRowColumnType
                                                                  .ROW,
                                                      rowCrossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ResponsiveRowColumnItem(
                                                          rowFlex: 1,
                                                          rowFit: FlexFit.tight,
                                                          child: Column(
                                                            children: [
                                                              GradientText(
                                                                text: '27',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        50,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                                gradient:
                                                                    const LinearGradient(
                                                                  colors: [
                                                                    Color(
                                                                        0xFF06B6D4),
                                                                    // Cyan
                                                                    Color(
                                                                        0xFF0EA5E9),
                                                                    // Blue
                                                                    Color(
                                                                        0xFF3B82F6),
                                                                    // Dark Blue
                                                                  ],
                                                                ),
                                                              ),
                                                              /*const SizedBox(
                                                        height: 2),*/
                                                              Text(
                                                                'Years Old',
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          148,
                                                                          163,
                                                                          184,
                                                                          1),
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
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                GradientText(
                                                                  text: '5+',
                                                                  softWrap:
                                                                      false,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          50,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                  gradient:
                                                                      const LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFF06B6D4),
                                                                      // Cyan
                                                                      Color(
                                                                          0xFF0EA5E9),
                                                                      // Blue
                                                                      Color(
                                                                          0xFF3B82F6),
                                                                      // Dark Blue
                                                                    ],
                                                                  ),
                                                                ),
                                                                /*const SizedBox(
                                                          height: 2),*/
                                                                Text(
                                                                  'Years Mobile Dev',
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            148,
                                                                            163,
                                                                            184,
                                                                            1),
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
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                GradientText(
                                                                  text: '1',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          50,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                  gradient:
                                                                      const LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFF06B6D4),
                                                                      // Cyan
                                                                      Color(
                                                                          0xFF0EA5E9),
                                                                      // Blue
                                                                      Color(
                                                                          0xFF3B82F6),
                                                                      // Dark Blue
                                                                    ],
                                                                  ),
                                                                ),
                                                                /*  const SizedBox(
                                                          height: 2),*/
                                                                Text(
                                                                  'Amazing Life',
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            148,
                                                                            163,
                                                                            184,
                                                                            1),
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
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 50,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .visible,
                                                                  // overflow: TextOverflow.visible
                                                                ),
                                                                gradient:
                                                                    const LinearGradient(
                                                                  colors: [
                                                                    Color(
                                                                        0xFF06B6D4),
                                                                    // Cyan
                                                                    Color(
                                                                        0xFF0EA5E9),
                                                                    // Blue
                                                                    Color(
                                                                        0xFF3B82F6),
                                                                    // Dark Blue
                                                                  ],
                                                                ),
                                                              ),
                                                              /*const SizedBox(
                                                        height: 2),*/
                                                              Text(
                                                                'Commits',
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          148,
                                                                          163,
                                                                          184,
                                                                          1),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SummaryWidget()
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ),

                                      /* Container(
                                          margin: EdgeInsets.all(16),
                                          child: TimeLineView()),*/
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
