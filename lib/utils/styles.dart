import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class AppColors {
  static const _baseBlue = 0xFF9168ed;
  static const _basePink = 0xFFe00092;
  static const Color accent = Color(_basePink);
  static const Color primary = Color(_baseBlue);
  static const Color light_grey = Color(0xFF9B9B9B);
  static const Color success = Color(0xFF7ED321);
  static const Color danger = Color(0xFFEB5757);
  static const Color info = Color(0xFF2D9CDB);
  static const Color warning = Color(0xFFF1B61E);
  static const Color gold = Color(0xFFD58929);
}

Padding leftAlignText({text, leftPadding, textColor, fontSize, fontWeight}) {
  return Padding(
    padding: EdgeInsets.only(left: leftPadding),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(text ?? "",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: 'Exo2',
              fontSize: fontSize,
              fontWeight: fontWeight ?? FontWeight.w500,
              color: textColor)),
    ),
  );
}

class AppFonts {
  static const String base = "TitilliumWeb";
  static const String second = "Raleway";

  static const FontWeight light = FontWeight.w200;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w600;
  static const FontWeight semibold = FontWeight.w700;
  static const FontWeight bold = FontWeight.w900;
}

class AppTheme {
  static const TextStyle display1 = TextStyle(
    fontFamily: 'TitilliumWeb',
    color: Colors.black,
    fontSize: 38,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  );

  static const TextStyle display2 = TextStyle(
    fontFamily: 'TitilliumWeb',
    color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.1,
  );

  static final TextStyle heading = TextStyle(
    fontFamily: 'TitilliumWeb',
    fontWeight: FontWeight.w900,
    fontSize: 24,
    color: Colors.black,
    letterSpacing: 1.2,
  );

  static final TextStyle subHeading = TextStyle(
    inherit: true,
    fontFamily: 'TitilliumWeb',
    fontWeight: FontWeight.w500,
    fontSize: 24,
    color: Colors.white.withOpacity(0.8),
  );

  static String appName = "Kanguka";

  static Color primaryColor = Color(0xff3C53B5);//1433a1
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.blue;
  static Color darkAccent = Color(0xff3170c0);
  static Color secondaryColor = Color(0xff00C364);

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightPrimary,
    primaryColor: primaryColor,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightPrimary,
    fontFamily: 'TitilliumWeb',
    // appBarTheme: AppBarTheme(
    //   textTheme: TextTheme(
    //     title: TextStyle(
    //       fontSize: 18.0,
    //     ),
    //   ),
    //   iconTheme: IconThemeData(
    //     color: lightAccent,
    //   ),
    // ),
  );
}
