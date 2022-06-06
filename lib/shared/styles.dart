import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// Big Toe button Style helper functions
Widget getElevatedButtonChild(String text) {
  final buttonStyle = GoogleFonts.arimo(
    fontSize: 30,
  );

  return Padding(
    padding: const EdgeInsets.all(13.0),
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

TextStyle getRegularTextStyle() {
  return GoogleFonts.arimo(
    fontSize: 20
  );
}

TextStyle getPromptTextStyle() {
  return GoogleFonts.corben(
    fontSize: 40,
    color: Colors.white,
    fontWeight: FontWeight.bold
  );
}