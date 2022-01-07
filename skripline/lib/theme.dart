import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

const kBackgorund = Colors.blue;
const kRed = Color(0xFFEC0000);
const kCreame = Color(0xFFF7E9DE);
const kBlue = Color(0xFF58D5DB);
const kText = Color(0xFF476C75);

final myText = const TextStyle(
  fontSize: 15,
  color: Colors.white,
);
final headText = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
final myBoldText =
    TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600);
final myTextStyle =
    TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal);

const makeGradientColor = SweepGradient(
  startAngle: -1,
  endAngle: 2 + 0.3,
  center: Alignment.bottomLeft,
  tileMode: TileMode.repeated,
  colors: [
    Colors.white54,
    Colors.indigoAccent,
  ],
);

AppBarTheme myAppBar() {
  return AppBarTheme(
    backgroundColor: Colors.indigoAccent,
    elevation: 5,
    iconTheme: IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    toolbarTextStyle: myText,
    titleTextStyle: myText.copyWith(fontSize: 18),
  );
}

ThemeData mytheme() {
  return ThemeData(
    textTheme: mytextTheme,
    scaffoldBackgroundColor: Colors.grey[300],
    appBarTheme: myAppBar(),
    applyElevationOverlayColor: true,
    inputDecorationTheme: inputDecorationTheme(),
    errorColor: Colors.grey[900],
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: kBackgorund),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    focusColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

final TextTheme mytextTheme = TextTheme(
  headline1: GoogleFonts.workSans(
      fontSize: 97, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.workSans(
      fontSize: 61, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.workSans(fontSize: 48, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.workSans(
      fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.workSans(fontSize: 24, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.workSans(
      fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.workSans(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.workSans(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.workSans(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.workSans(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.workSans(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.workSans(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.workSans(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
