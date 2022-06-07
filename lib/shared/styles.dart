import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// Big Toe button Style helper functions
Widget getElevatedButtonChild(String text,{ double fontSize = 30, double paddingAmount = 13.0 }) {
  final buttonStyle = GoogleFonts.arimo(
    fontSize: fontSize,
  );

  return Padding(
    padding: EdgeInsets.all(paddingAmount),
    child: Text(text, style: buttonStyle),
  );
}

ButtonStyle getElevatedButtonStyle() {
  return ElevatedButton.styleFrom(primary: Colors.orange);
}

// Big Toe Text Styles
TextStyle getMainHeadingStyle() {
  return GoogleFonts.corben(
    fontSize: 70,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}

TextStyle getHeadingStyle() {
  return GoogleFonts.corben(
    fontSize: 40,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}

TextStyle getRegularTextStyle({Color color = Colors.white}) {
  return GoogleFonts.arimo(
    fontSize: 20,
    color: color
  );
}

TextStyle getPromptTextStyle() {
  return GoogleFonts.corben(
    fontSize: 40,
    color: Colors.white,
    fontWeight: FontWeight.bold
  );
}