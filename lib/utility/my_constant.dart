import 'package:flutter/material.dart';

class MyConstant {
  //field
  static Color primary = const Color.fromARGB(255, 2, 97, 24);
  static Color dark = const Color.fromARGB(255, 9, 72, 2);
  static Color light = const Color.fromARGB(255, 1, 193, 59);
  static Color active = const Color.fromARGB(255, 236, 47, 217);

  //method

  BoxDecoration planBox(){
    return BoxDecoration(color: light.withOpacity(0.25));
  }

  TextStyle h1Style() {
    return TextStyle(
      color: dark,
      fontSize: 36,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle h2Style() {
    return TextStyle(
      color: dark,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle h3Style() {
    return TextStyle(
      color: dark,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle h3ActiveStyle() {
    return TextStyle(
      color: active,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }
}
