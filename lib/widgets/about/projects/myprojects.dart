import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../entities/entities.dart';
import '../../../utils/utils.dart';
import '../../components/components.dart';

class MyProjects extends StatefulWidget {
  @override
  _MyProjectsState createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  int _currentIndex = 0;

  List<Map<String, List<Project>>> projectsMap = [
    {'All Projects': projects},
    {'RedBlackTree': rbtApps},
    {'Kilofarms': kfApps},
    {'Radius Agent': raApps}
  ];

  PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if ((ResponsiveBreakpoints.of(context).isMobile ||
        ResponsiveBreakpoints.of(context).isPhone ||
        ResponsiveBreakpoints.of(context).isTablet))
      _pageController = PageController(viewportFraction: 0.8);
    if (!(ResponsiveBreakpoints.of(context).isMobile ||
        ResponsiveBreakpoints.of(context).isPhone ||
        ResponsiveBreakpoints.of(context).isTablet))
      _pageController = PageController(
        viewportFraction: 0.25,
      );
    return Container(
      width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int i = 0; i < projectsMap.length; i++)
                    Padding(
                      padding: EdgeInsets.only(
                          right: projectsMap.length - 1 == 1 ? 0 : 8.0),
                      child: HoverBorderButton2(
                        label: projectsMap[i].keys.first,
                        selected: _currentIndex == i,
                        onPressed: () {
                          setState(() {
                            _currentIndex = i;
                          });
                        },
                      ),
                    )
                ],
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            key: ValueKey(_currentIndex.toString()),
            width: MediaQuery.of(context).size.width,
            height: 344,
            alignment: Alignment.centerLeft,
            child: PageView.builder(
              //key: PageStorageKey<String>(projectsMap[_currentIndex].keys.first),
              itemCount: projectsMap[_currentIndex]
                          [projectsMap[_currentIndex].keys.first]
                      ?.length ??
                  0,
              pageSnapping: (ResponsiveBreakpoints.of(context).isMobile ||
                  ResponsiveBreakpoints.of(context).isPhone ||
                  ResponsiveBreakpoints.of(context).isTablet),
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                //setState(() => _currentIndex = index);
              },
              padEnds: false,
              itemBuilder: (context, index) {
                return Transform.rotate(
                  angle: (ResponsiveBreakpoints.of(context).isMobile ||
                          ResponsiveBreakpoints.of(context).isPhone ||
                          ResponsiveBreakpoints.of(context).isTablet)
                      ? 0
                      : (index % 2 == 0 ? 1.5 : -1.5) *
                          (3.141592653589793 / 180),
                  child: ProjectCard(
                      project: projectsMap[_currentIndex]
                          [projectsMap[_currentIndex].keys.first]![index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;

  ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: 304,
      height: 100,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          //color: Color.fromRGBO(225, 29, 72, .2),
          gradient: LinearGradient(
            colors: [Color(0xFFF4EAFB), Color(0xFFF9D5E5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(
            color: Color(0x1a334155),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images/bg-pattern.webp',
                        height: 100, width: double.infinity, fit: BoxFit.cover),
                    project.isNetwork
                        ? Image.network(
                            project.image,
                            height: 100,
                            width: double.infinity,
                            //fit: BoxFit.cover,
                          )
                        : Image.asset(
                            project.image,
                            height: 100,
                            width: double.infinity,
                            //fit: BoxFit.cover,
                          ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(project.name,
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                        color: Color(0xFF1e293b))),
                SizedBox(
                  height: 8.0,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var tech in project.technologies)
                        Padding(
                          padding: EdgeInsets.only(
                              right:
                                  project.technologies.last == tech ? 0 : 8.0),
                          child: InteresedButton(
                            label: tech,
                            fontSize: 12,
                            color: Color(0x4DE8E8F0),
                            textColor: Color(0xFF475569),
                            highlightedColor: Colors.white54,
                            borderColor: Color.fromRGBO(14, 116, 144, 0.2),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  project.description,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.openSans(
                      color: Color(0xFF475569),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                '${project.year}',
                style: GoogleFonts.openSans(
                    color: Color(0xCC334155),
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
