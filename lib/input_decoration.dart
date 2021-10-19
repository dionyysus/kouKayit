import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(
    IconData icons, String hinttext, IconButton clearIcons) {
  return InputDecoration(
    hintText: hinttext,
    prefixIcon: Icon(icons),
    suffixIcon: IconButton(
      icon: Icon(Icons.delete),
      onPressed: () {},
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(color: Colors.green, width: 1.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.black,
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.black,
        width: 1.5,
      ),
    ),
  );
}

InputDecoration birthDayDecoration(IconData icons, String hinttext) {
  return InputDecoration(
    hintText: hinttext,
    prefixIcon: IconButton(
      icon: Icon(Icons.calendar_today),
      onPressed: () {},
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(color: Colors.green, width: 1.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.black,
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.black,
        width: 1.5,
      ),
    ),
  );
}
