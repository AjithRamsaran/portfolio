import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_ajith/widgets/components/components.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'screens/about_screen.dart';

class App extends StatefulWidget {
  App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool _isLoading = true;
  bool _initializationComplete = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ));

    return MaterialApp(
        title: 'Ajith Ramsaran',
        theme: isDarkMode ? darkTheme : lightTheme/*ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue*//*Colors.deepPurple*//*),
          useMaterial3: true,
        )*/,
        builder: (context, child) => ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            ),
        home: AnimatedTheme(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            data: isDarkMode ? darkTheme : lightTheme,
            child: AboutScreen(title: 'Ajith Ramsaran')));
  }
}
