import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {

  static const textFieldWidth = 320.0;

  // Big Toe button Style helper functions
  static Widget getElevatedButtonChild(String text,{ double fontSize = 30, double paddingAmount = 13.0 }) {
    final buttonStyle = GoogleFonts.arimo(
      fontSize: fontSize,
    );

    return Padding(
      padding: EdgeInsets.all(paddingAmount),
      child: Text(text, style: buttonStyle),
    );
  }

  static ButtonStyle getElevatedButtonStyle() {
    return ElevatedButton.styleFrom(primary: Colors.orange);
  }

// Big Toe Text Styles
  static TextStyle getMainHeadingStyle() {
    return GoogleFonts.exo2(
      fontSize: 70,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle getHeadingStyle() {
    return GoogleFonts.exo2(
      fontSize: 40,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle getRegularTextStyle({Color color = Colors.white}) {
    return GoogleFonts.arimo(
        fontSize: 20,
        color: color
    );
  }

  static TextStyle getPromptTextStyle() {
    return GoogleFonts.exo2(
        fontSize: 40,
        color: Colors.white,
        fontWeight: FontWeight.bold
    );
  }

// Big Toe Input Field styles

  static InputDecoration getTextFieldDecorationStyle() {
    return const InputDecoration(
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.white)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.orangeAccent)),
      hintStyle: TextStyle(
        color: Colors.white70,
      ),
      counterStyle: TextStyle(color: Colors.white),

    );
  }
}
