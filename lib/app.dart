import 'package:flutter/material.dart';
import 'package:portfolio_ajith/widgets/components/components.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'dart:js' as js;
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
    //_initialize(); // Load CanvasKit
  }

/*
  Future<void> _initialize() async {
    try {
      // Your actual initialization logic here (e.g., CanvasKit loading, API calls, etc.)
      await Future.delayed(Duration(seconds: 3)); // Simulate initialization

      setState(() {
        _initializationComplete = true; // Initialization finished
        _isLoading = false; // Hide the loader
      });

      // Trigger the 'flutter-web-initialized' event
      js.context.callMethod('dispatchEvent', [
        js.JsObject.jsify({'type': 'flutter-web-initialized'}),
      ]);
    } catch (e) {
      print('Error initializing: $e');
      setState(() {
        _isLoading = false; // Hide loader even on error
        _initializationComplete = true; // Initialization finished
      });
      // Optionally show an error message in the UI
    }
  }
*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ajith Ramsaran',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        builder: (context, child) => ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            ),
        initialRoute: "/",
        home: AnimatedTheme(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            data: isDarkMode ? darkTheme : lightTheme,
            child: AboutScreen(title: 'Ajith Ramsaran'))
/*_isLoading // Show loading while initializing
            ? Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text("Flutter initializing..."),
                  ],
                ),
              )
            : _initializationComplete // Show app only after initialization
                ? AnimatedTheme(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    data: isDarkMode ? darkTheme : lightTheme,
                    child: AboutScreen(title: 'Ajith Ramsaran'))
                : Scaffold(body: Text("Initialization failed."))*/
        );
  }
}
