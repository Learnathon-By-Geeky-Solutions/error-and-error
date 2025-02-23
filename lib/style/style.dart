
import 'package:flutter/material.dart';

BoxDecoration backgroundStyle() {
  return BoxDecoration(
      gradient: LinearGradient(colors: [
    Color(0xffB81736),
    Color(0xff281537),
  ]));
}

TextStyle headerText() {
  return TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}

BoxDecoration loginFild() {
  return BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(40),
      topRight: Radius.circular(40),
    ),
    color: Colors.white,
  );
}

InputDecoration AppInptDecoration(label, icon) {
  return InputDecoration(
    suffixIcon: Icon(icon, color: Colors.grey),
    focusedBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 1),
    ),
    fillColor: Colors.white12,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    enabledBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey, width: 2),
    ),
    border: OutlineInputBorder(),
    labelText: label,
    labelStyle: inputTextStyle(),
  );
}

InputDecoration InptDecoration(label) {
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 1),
    ),
    fillColor: Colors.white12,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    enabledBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey, width: 2),
    ),
    border: OutlineInputBorder(),
    labelText: label,
    labelStyle: inputTextStyle(),
  );
}

TextStyle inputTextStyle() {
  return TextStyle(
    fontWeight: FontWeight.bold,
    color: Color(0xffB81736),
  );
}

BoxDecoration backgroundButtonStyle() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      gradient: LinearGradient(colors: [
        Color(0xffB81736),
        Color(0xff281537),
      ]));
}

ButtonStyle elevetedButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent, // Transparent background
    shadowColor: Colors.transparent, // Transparent shadow
    elevation: 2, // Remove elevation for flat appearance
  );
}

Ink SuccessButtonChild(String ButtonText) {
  return Ink(
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
        Color(0xffB81736),
        Colors.black87,
      ]),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Container(
      height: 50,
      alignment: Alignment.center,
      child:
          Text(ButtonText, style: TextStyle(fontSize: 20, color: Colors.white)),
    ),
  );
}
