import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_ajith/utils/constant.dart';
import 'package:portfolio_ajith/utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BookScreen extends StatelessWidget {
  BookScreen({super.key});

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: _scrollController,
      thumbColor: Colors.grey,
      thickness: ResponsiveBreakpoints.of(context).isDesktop ? 8 : 5,
      radius: Radius.circular(20),
      child: Container(
        height: MediaQuery.of(context).size.height - 66,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            width: double.infinity,
            child: ConstrainedBox(
                      constraints: BoxConstraints(
              maxWidth: ResponsiveBreakpoints.of(context).isDesktop
                  ? MediaQuery.of(context).size.width > 1200
                      ? 1200
                      : MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width),
                      child: books.isEmpty
              ? Center(
                  child: Text(
                    'No books found',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                )
              : Column(
                //mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*
                * Reading list
                                Collection of books that I've read
                                * */
                  Container(
                    margin: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 16.0),
                    child: Text(
                      'Reading list',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0EA5E9),
                      ),
                    ),
                  ),
                  //Collection of books that I've read
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Collection of books that I\'ve read',
                      style: GoogleFonts.roboto(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: ResponsiveGridView.builder(
                      //controller: _scrollController,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(16),
                      gridDelegate: ResponsiveGridDelegate(
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        maxCrossAxisExtent: 400,
                        minCrossAxisExtent: 220,
                        childAspectRatio: 0.6,
                      ),
                      alignment: Alignment.topCenter,
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        final book = books[index];
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              openUrl(book.url);
                            },
                            child: Container(
                              //color: Colors.pink,
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(
                                                  8),
                                          child: Image.network(
                                            book.image,
                                            fit: BoxFit.fitHeight,
                                            //width: double.infinity,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding:
                                        const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          book.name,
                                          style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            fontWeight:
                                                FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          book.author,
                                          style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
                    ),
          ),
        ),
      ),
    );
  }
}
