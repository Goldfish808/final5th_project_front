import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

TextTheme textTheme() {
  return TextTheme(
    headline1: GoogleFonts.notoSans(fontSize: 18.0, color: const Color(0xff1C1C1C), fontWeight: FontWeight.bold),
    headline2: GoogleFonts.openSans(fontSize: 16.0, color: const Color(0xff1C1C1C), fontWeight: FontWeight.bold, letterSpacing: -0.05),
    headline3: GoogleFonts.openSans(fontSize: 14.0, color: const Color(0xff1C1C1C)),
    bodyText1: GoogleFonts.openSans(fontSize: 12.0),
    bodyText2: GoogleFonts.openSans(fontSize: 10.0, color: const Color(0xff1C1C1C)),
    subtitle1: GoogleFonts.openSans(fontSize: 15.0, color: const Color(0xff1C1C1C)),
  );
}

const MaterialColor primary = MaterialColor(0xff6E34DA, <int, Color>{
  900: Color(0xff6f36d9),
  800: Color(0xff7641d9),
  700: Color(0xff7d4cd9),
  600: Color(0xff8457d9),
  500: Color(0xff8b62d9),
  400: Color(0xff926cd9),
  300: Color(0xff9977d9),
  200: Color(0xffa082d9),
  150: Color(0xffa78dd9),
  100: Color(0xffae98d9),
  50: Color(0xffb6a3d9),
});

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

ThemeData theme() {
  return ThemeData(
    primarySwatch: createMaterialColor(Color(0xff6E34DA)),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    textTheme: textTheme(),
    appBarTheme: appTheme(),
  );
}

AppBarTheme appTheme() {
  return AppBarTheme(
    centerTitle: false,
    //color: Colors.white,
    elevation: 0.0,
    titleTextStyle: textTheme().headline6,
  );
}
