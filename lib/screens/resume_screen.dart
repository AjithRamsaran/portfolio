import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_ajith/widgets/footer/footer_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'dart:math' as math;

import '../entities/entities.dart';

class ResumeScreen extends StatefulWidget {
  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  final ScrollController _scrollController = ScrollController();

  final List<GlobalKey> _itemKeys = List.generate(
    5,
    (index) => GlobalKey(),
  );

  int _selectedIndex = 0;

  bool ignoreScrolling = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _handleScroll();
    });

    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (ignoreScrolling) return;
    //print('Scrolling');
    double offset = _scrollController.offset;
    //print(offset);
    //print('POSITION:' + _scrollController.position.pixels.toString());
    double globalMinimum = -double.infinity;
    for (int i = 0; i < _itemKeys.length; i++) {
      final key = _itemKeys[i];
      final RenderBox? box =
          key.currentContext?.findRenderObject() as RenderBox?;
      //get the bottom center of the box
      //print(box?.size.height);

      if (box != null) {
        final topPosition = box.localToGlobal(Offset.zero).dy;
        final bottomPosition = box.localToGlobal(Offset(0, box.size.height)).dy;
        // print(
        //     'Item $i Top Position: $topPosition Bottom Position: $bottomPosition');

        if (topPosition > globalMinimum && topPosition < 100) {
          globalMinimum = topPosition;
          setState(() {
            _selectedIndex = i;
          });
        }
      }
    }
  }

  void _scrollToItem(int index) {
    _selectedIndex = index;
    ignoreScrolling = true;
    setState(() {});
    Scrollable.ensureVisible(
      _itemKeys[index].currentContext!,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    ).then((value) => setState(() {
          ignoreScrolling = false;
        }));

  }

  Widget introWidget() {
    return Text(
        "With a Master’s degree in Software Systems and 5 Years of Experience in Flutter App Development with Full SDLC, also worked in Agile methodology. Developed 5+ Flutter and 4 Native applications from scratch for mobile and tablet devices that offer users an intuitive, friendly interface and successfully executed a lot of updates to existing applications. I have experience in team management. I am able to quickly grasp new technology and begin working on it.",
        style: GoogleFonts.openSans(
            fontSize: 16,
            color: Color(0xff64748b),
            fontWeight: FontWeight.w500));
  }

  Widget interestWidget() {
    return Text(
        "I'm fascinated by the world around me, from the elegant simplicity of physics to the rich tapestry of history.  I love exploring online resources to learn about fundamental physics concepts, like why things fall or how light behaves.  My real passion, though, lies in history.  I'm captivated by stories of the past, the rise and fall of civilizations, and the lives of those who came before us.  Visiting historical sites brings these stories to life, and I always delve into the history behind each place I visit, trying to understand the people and events that shaped them.",
        style: GoogleFonts.openSans(
            fontSize: 16,
            color: Color(0xff64748b),
            fontWeight: FontWeight.w500));
  }

  Widget experienceWidget(BuildContext context) {
    List<Experience> experiences = [
      Experience(
          fromYear: 'Mar 2023',
          title: 'Software Engineer (Flutter)',
          company: 'RedBlackTree',
          location: 'Chennai',
          description: [
            'Building mobile applications (Android and iOS) for Methodical and associated apps, which is a modern workflow and automation platform for enterprises, offers a comprehensive all-in-one platform to meet diverse software needs.',
            'Worked on web sockets and Rest API integration',
          ]),
      Experience(
          fromYear: 'Aug 2020',
          toYear: 'Mar 2023',
          title: 'Lead Mobile Developer (Flutter & Native Android)',
          company: 'Kilofarms',
          location: 'Chennai',
          description: [
            'Designed and implemented all B2C and B2B applications from scratch to support the company operations starting from farming, transporting, trading, retail and e-commerce using Flutter and Native android.',
            'Team management and handling of 5 junior developers. Responsible for their learning and development.',
            'Coordination with UI/UX, Product management and business teams to deliver optimal output.',
            'Partnered with Ninjacart to integrate their APIs and implemented necessary features related to farming, input sales and entire loan application flow.',
            'Integrated various physical devices like Bluetooth printer, weighing scale and barcode reader with applications.',
            'Integrated Firebase services such as Push notification, Crashlytics and AWS services like Rekognition and S3.',
          ]),
      //generate similar content for different roles and different companies
      Experience(
          fromYear: 'Nov 2019 - July 2020',
          toYear: 'May 2019 – Jun 2019',
          kCombinedExperience: true,
          title: 'AI Engineer – R&D Intern',
          company: 'In D - Intain',
          location: 'Chennai',
          description: [
            'Implemented a table recognition module with computer vision and Keras neural network framework in Python for document processing.',
            'Faster RCNN was used for training the model.',
            'Implemented an Android application for FS Express that provides KYC verification through mobile using AI.'
          ]),
      Experience(
          fromYear: 'May 2018',
          toYear: 'Nov 2018',
          title: 'Android Developer Intern',
          company: 'Radius Agent',
          location: 'Bengaluru',
          description: [
            'Enhanced the architecture for the Radius Real Estate application using MVP architecture, implemented the same and changed UI for the existing design.',
            'Used RXJava for easier data transfer within the application, Dagger-2 for dependency injection and Retrofit for server connection.'
          ])
    ];
    return Column(
      children: [
        for (var i = 0; i < experiences.length; i++)
          experienceWidgetItem(
            context,
            experiences[i],
          )
      ],
    );
  }

  Widget educationWidget(BuildContext context) {
    List<Education> educations = [
      Education(
        completedYear: '2020',
        course: 'M.Sc - Software Systems',
        institution: 'PSG college of technology',
        location: 'Coimbatore',
      ),
      Education(
        completedYear: '2014',
        course: 'Higher Secondary',
        institution: 'Kurinji Higher Secondary School',
        location: 'Namakkal',
      ),
    ];
    return Column(
      children: [
        for (var i = 0; i < educations.length; i++)
          educationWidgetItem(
            context,
            educations[i],
          )
      ],
    );
  }

  Widget capabilitiesWidget(BuildContext context) {
    List<Capability> capabilities = [
      Capability(
          title: 'Languages',
          capabilities: ['Tamil - native', 'English - bilingual']),
      Capability(
          title: 'Programming Languages',
          capabilities: ['Dart', 'Python', 'Java']),
      Capability(title: 'APIs', capabilities: [
        'Rest API',
        'Web Sockets',
        'GraphQL',
      ]),
      Capability(title: 'Libraries & Frameworks', capabilities: [
        'Flutter',
        'Android',
        'iOS',
        'Geolocation',
        'Bluetooth device integration'
      ]),
      Capability(
          title: 'Service Providers',
          capabilities: ['AWS', 'Firebase', 'Github']),
      Capability(title: 'Tools', capabilities: [
        'Intellij Idea',
        'Git',
        'Android Studio',
        'Postman',
        'Ftp',
        'Dev Tools'
      ]),
    ];
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < capabilities.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(capabilities[i].title,
                      style: GoogleFonts.openSans(
                          fontSize: 17,
                          color: Color(0xff0F1727),
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 6,
                  ),
                  Text(capabilities[i].capabilities.join(', '),
                      style: GoogleFonts.openSans(
                          fontSize: 15,
                          color: Color(0xff64748b),
                          fontWeight: FontWeight.w500))
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget experienceWidgetItem(
    BuildContext context,
    Experience expirence,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveVisibility(
            hiddenConditions: [Condition.smallerThan(name: DESKTOP)],
            child: Flexible(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: Text(
                    '${expirence.fromYear} ${expirence.kCombinedExperience ? "" : "-"} ${expirence.toYear ?? 'Present'}',
                    style: GoogleFonts.openSans(
                        fontSize: 15,
                        color: Color(0xff94A3B8),
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                          color: Color(0xffE2E8F0), shape: BoxShape.circle),
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            color: Color(0xff94A3B8), shape: BoxShape.circle),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: Text(expirence.title,
                          softWrap: true,
                          style: GoogleFonts.openSans(
                              fontSize: 17,
                              color: Color(0xff0F1727),
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 9.0, top: 8.0),
                  decoration: BoxDecoration(
                      border: Border(
                          left:
                              BorderSide(color: Color(0xffE2E8F0), width: 2))),
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: expirence.company,
                              style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  color: Color(0xff475569),
                                  fontWeight: FontWeight.w600),
                              children: [
                            TextSpan(
                                text: ' - ${expirence.location ?? ''}',
                                style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    color: Color(0xCC94A3B8),
                                    fontWeight: FontWeight.w600)),
                            if (!ResponsiveBreakpoints.of(context).isDesktop)
                              TextSpan(
                                  text:
                                      ' ${expirence.fromYear} ${expirence.kCombinedExperience ? "" : "-"} ${expirence.toYear ?? 'Present'}',
                                  style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      color: Color(0xff94A3B8),
                                      fontWeight: FontWeight.w500)),
                          ])),
                      for (var i = 0; i < expirence.description.length; i++)
                        WorkItemWidget(
                          text: expirence.description[i],
                        )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget educationWidgetItem(
    BuildContext context,
    Education education,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveVisibility(
            hiddenConditions: [Condition.smallerThan(name: DESKTOP)],
            child: Flexible(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: Text(' ${education.completedYear}',
                    style: GoogleFonts.openSans(
                        fontSize: 15,
                        color: Color(0xff94A3B8),
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                          color: Color(0xffE2E8F0), shape: BoxShape.circle),
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            color: Color(0xff94A3B8), shape: BoxShape.circle),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(education.course,
                        style: GoogleFonts.openSans(
                            fontSize: 17,
                            color: Color(0xff0F1727),
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 9.0, top: 8.0),
                  decoration: BoxDecoration(
                      border: Border(
                          left:
                              BorderSide(color: Color(0xffE2E8F0), width: 2))),
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: education.institution,
                              style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  color: Color(0xff475569),
                                  fontWeight: FontWeight.w600),
                              children: [
                            TextSpan(
                                text: ' - ${education.location ?? ''}',
                                style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    color: Color(0xCC94A3B8),
                                    fontWeight: FontWeight.w600)),
                            if (!ResponsiveBreakpoints.of(context).isDesktop)
                              TextSpan(
                                  text: ' ${education.completedYear}',
                                  style: GoogleFonts.openSans(
                                      fontSize: 15,
                                      color: Color(0xff94A3B8),
                                      fontWeight: FontWeight.w500)),
                          ])),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget cardWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 8),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.91,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: Offset(1, 3), color: Colors.grey, blurRadius: 5),
              BoxShadow(
                  offset: Offset(-1, -3), color: Colors.grey, blurRadius: 5)
            ]),
        child: Row(
          children: [
            Icon(
              Icons.image_rounded,
              size: 22,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Title of Card",
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }

  Widget listItem(
      {int? index,
      Key? key,
      String? title,
      IconData? icon,
      required BuildContext context,
      Widget? child}) {
    return Material(
      key: key,
      color: Colors.transparent,
      child: Theme(
        data: ThemeData(hintColor: Colors.black),
        child: ExpansionTile(
          //dotted border at the bottom
          shape: _DottedBorderShape(horizontalPadding: 16),
          initiallyExpanded: true,
          collapsedShape: _DottedBorderShape(horizontalPadding: 16),
          title: Container(
 //dotted border
            child: Text(
              title ?? '',
              style: GoogleFonts.notoSans(
                  fontSize: 20,
                  color: Color(0xff1E293B),
                  fontWeight: FontWeight.w600),
            ),
          ),
          children: [child ?? Container()],
          childrenPadding: EdgeInsets.only(bottom: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: _scrollController,
      thumbColor: Colors.grey,
      thickness: ResponsiveBreakpoints.of(context).isDesktop ? 8 : 5,
      radius: Radius.circular(20),
      child: Container(
        height: MediaQuery.of(context).size.height - 66,
        margin: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 5,
              child: ScrollConfiguration(
                behavior: NoScrollbarBehavior(),
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height - 66,
                  ),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            //primary: false,
                            children: [
                              ResponsiveVisibility(
                                hiddenConditions: [
                                  Condition.equals(name: DESKTOP)
                                ],
                                child: Container(
                                  margin: const EdgeInsets.only(left: 24.0,top: 24),
                                  //height: MediaQuery.of(context).size.height - 66,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Transform.rotate(
                                              angle: 6 * math.pi / 180,
                                              child: GradientProfilePic(
                                                thickness: 2,
                                              ),
                                            ),
                                            ProfileHeader(
                                              direction: Axis.horizontal,
                                              selectedIndex: _selectedIndex,
                                              onSelectedIndexChanged:
                                                  (int index) {
                                                _scrollToItem(index);
                                              },
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),
                              ),
                              ResponsiveVisibility(
                                hiddenConditions: [Condition.smallerThan(name: DESKTOP)],
                                child: SizedBox(
                                  height: 24,
                                ),
                              ),
                              listItem(
                                  context: context,
                                  key: _itemKeys[0],
                                  title: "Intro",
                                  icon: Icons.dashboard_rounded,
                                  child: Container(
                                      margin: EdgeInsets.only(left: 16),
                                      child: introWidget())),
                              listItem(
                                  context: context,
                                  key: _itemKeys[1],
                                  title: "Experience",
                                  icon: Icons.help_rounded,
                                  child: Container(
                                      margin: EdgeInsets.only(left: 16),
                                      child: experienceWidget(context))),
                              listItem(
                                  context: context,
                                  key: _itemKeys[2],
                                  title: "Education",
                                  icon: Icons.settings,
                                  child: Container(
                                      margin: EdgeInsets.only(left: 16),
                                      child: educationWidget(context))),
                              listItem(
                                  context: context,
                                  key: _itemKeys[3],
                                  title: "Capabilities",
                                  icon: Icons.settings,
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.only(left: 16),
                                      child: capabilitiesWidget(context))),
                              listItem(
                                  context: context,
                                  key: _itemKeys[4],
                                  title: "Interests",
                                  icon: Icons.dashboard_rounded,
                                  child: Container(
                                      margin: EdgeInsets.only(left: 16),
                                      child: interestWidget())),
                              SizedBox(height: 20),
                              ResponsiveVisibility(hiddenConditions: [
                                Condition.equals(name: DESKTOP)
                              ], child: FooterWidget())
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ResponsiveVisibility(
              hiddenConditions: [Condition.smallerThan(name: DESKTOP)],
              child: Flexible(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(left: 24.0, top: 24),
                  //height: MediaQuery.of(context).size.height - 66,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Transform.rotate(
                                angle: 6 * math.pi / 180,
                                child: GradientProfilePic(
                                  thickness: 2,
                                ),
                              ),
                              Expanded(
                                  child: SingleChildScrollView(
                                      child: ProfileHeader(
                                selectedIndex: _selectedIndex,
                                onSelectedIndexChanged: (int index) {
                                  _scrollToItem(index);
                                },
                              ))),
                            ],
                          ),
                        ),
                        FooterWidget()
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatefulWidget {
  ProfileHeader(
      {super.key,
      required this.selectedIndex,
      this.onSelectedIndexChanged,
      this.direction = Axis.vertical});

  int selectedIndex;
  Function? onSelectedIndexChanged;
  Axis direction;

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  int? _hoveredIndex; // Track hovered index for buttons

  final List<String> _sections = [
    'Intro',
    'Experience',
    'Education',
    'Capabilities',
    'Interests',
  ];

  final List<String> _filters = [
    'all',
    'relevant',
    'web / tech dev',
    'management',
    'entrepreneurial',
    'restaurant',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section list
          widget.direction == Axis.horizontal
              ? Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  spacing: 16.0,
                  // horizontal space between buttons
                  runSpacing: 4.0,
                  // vertical space between buttons
                  children: buildList(),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: buildList(),
                ),
          const SizedBox(height: 20),
          // Filter view label
          /*const Text(
            'Filter view:',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          // Filter buttons
          Wrap(
            spacing: 8.0, // horizontal space between buttons
            runSpacing: 4.0, // vertical space between buttons
            children: List.generate(
              _filters.length,
              (index) => HoverBorderButton3(
                label: _filters[index],
                selected: false,
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                hoverTextColor: Color(0xFF334155),
                selectedTextColor: Color(0xFF334155),
                unselectedTextColor: Color(0xFF94A3B8),
                selectedBackgroundColor: Color(0xFFE0F2FE),
                hoverBackgroundColor: Color(0xFFE0F2FE),
                unselectedBackgroundColor: Color(0xFFF1F5F9),
                selectedAndHoverBorderColor: Colors.blue,
                unselectedBorderColor: Color.fromRGBO(226, 232, 240, 1),
                borderRadius: 4,
                borderWidth: 1,
                onPressed: () {},
              ),
            ),
          ),*/
        ],
      ),
    );
  }

  List<Widget> buildList() {
    return List.generate(
      _sections.length,
      (index) => MouseRegion(
        onEnter: (event) => setState(
            () => widget.selectedIndex == index ? null : _hoveredIndex = index),
        onExit: (event) => setState(() => _hoveredIndex = null),
        child: GestureDetector(
          onTap: () {
            setState(() => widget.selectedIndex = index);
            widget.onSelectedIndexChanged?.call(index);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              _sections[index],
              style: TextStyle(
                fontSize: 16,
                fontWeight: widget.selectedIndex == index
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: widget.selectedIndex == index
                    ? Colors.blue
                    : (_hoveredIndex == index
                        ? Colors.blue.shade100
                        : Colors.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GradientProfilePic extends StatelessWidget {
  final double thickness;

  const GradientProfilePic({super.key, this.thickness = 2.0});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            // Content of the container (replace with your actual content)
            Container(
              width: 190 /*constraints.maxWidth */ - (thickness * 2),
              height: 240 /*constraints.maxHeight*/ - (thickness * 2),
              color: Colors.white,
              // Example content color
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
                child: Image.asset(
                  'assets/images/profile.jpeg',
                  width: 150,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Top border
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: GradientBlurLine(thickness: thickness),
            ),

            // Bottom border
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GradientBlurLine(thickness: thickness),
            ),

            // Left border
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              child:
                  GradientBlurLine(axis: Axis.vertical, thickness: thickness),
            ),

            // Right border
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              child:
                  GradientBlurLine(axis: Axis.vertical, thickness: thickness),
            ),
          ],
        );
      },
    );
  }
}

class GradientBlurLine extends StatelessWidget {
  final Axis axis;
  final double thickness;
  double length;

  GradientBlurLine({
    super.key,
    this.axis = Axis.horizontal,
    this.thickness = 2.0,
    this.length = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;

        if (axis == Axis.vertical) {
          width = thickness;
        } else {
          height = thickness;
        }

        return SizedBox(
          width: width,
          height: height,
          child: Opacity(
            opacity: 0.5, // Adjust opacity as needed
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                  sigmaX: axis == Axis.horizontal ? 1 : 0,
                  sigmaY: axis == Axis.vertical ? 1 : 0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: axis == Axis.horizontal
                        ? Alignment.centerLeft
                        : Alignment.topCenter,
                    end: axis == Axis.horizontal
                        ? Alignment.centerRight
                        : Alignment.bottomCenter,
                    colors: [
                      const Color.fromRGBO(56, 189, 248, 0),
                      const Color(0x0038bdf8),
                      const Color(0xFF0EA5E9),
                      const Color.fromRGBO(236, 72, 153, 0.3),
                      const Color.fromRGBO(236, 72, 153, 0),
                    ],
                    stops: const [
                      0.0,
                      0.0,
                      0.3229,
                      0.6719,
                      1.0,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


class WorkItemWidget extends StatelessWidget {
  WorkItemWidget({
    super.key,
    required this.text,
  });

  String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          width: 8,
          height: 8,
          decoration:
              BoxDecoration(color: Color(0xff64748b), shape: BoxShape.circle),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text(text,
              style: GoogleFonts.openSans(
                  fontSize: 15,
                  color: Color(0xff64748b),
                  fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }
}





class _DottedBorderShape extends ShapeBorder {
  final double horizontalPadding;

  const _DottedBorderShape({this.horizontalPadding = 0.0});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    const double dashWidth = 5.0;
    const double dashSpace = 3.0;

    // Apply horizontal padding
    final paddedRect = Rect.fromLTRB(
      rect.left + horizontalPadding,
      rect.top,
      rect.right - horizontalPadding,
      rect.bottom,
    );

    final path = Path();
    double startX = paddedRect.left;
    final y = paddedRect.bottom;

    while (startX < paddedRect.right) {
      path.moveTo(startX, y);
      path.lineTo(startX + dashWidth, y);
      startX += dashWidth + dashSpace;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    canvas.drawPath(getOuterPath(rect), paint);
  }

  @override
  ShapeBorder scale(double t) => this;
}
