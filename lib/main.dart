import 'package:flutter/material.dart';
import 'package:realestateapp/screens/LandingPage.dart';
import 'dart:ui';

import 'package:realestateapp/util/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth=window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REAL ESTATE APP',
      theme: ThemeData(primaryColor: COLOR_WHITE, accentColor: COLOR_DARK_BLUE, textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT, fontFamily: "Cairo"),
      home: LandingPage(),
    );
  }
}

