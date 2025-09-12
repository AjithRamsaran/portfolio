import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const Color primary = Color(0xFF1389FD);
const Color primaryDark = Color(0xFF0276e8);
const Color primaryLight = Color(0xFFE7F8FF);

const Color textPrimary = Color(0xFF4A4A4A);

const Color buttonPrimaryDark = Color(0xFF0075E6);
const Color buttonPrimaryDarkPressed = Color(0xFF006ED9);
const Color buttonPrimaryPressedOutline = Color(0xFF8DCDFD);

const Color background = Color(0xFFF8F9FA);
const Color backgroundDark = Color(0xFF303c42);
const Color border = Color(0x20000000);
bool isDarkMode = false;
final lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.black,
  textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
);

