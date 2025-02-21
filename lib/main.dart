import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta_seo/meta_seo.dart';
import 'app.dart';

void main() {
  if (kIsWeb) {
    MetaSEO().config();
  }
  runApp(App());
}







