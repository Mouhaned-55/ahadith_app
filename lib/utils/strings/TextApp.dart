import 'package:flutter/material.dart';

abstract class TextApp {
  static Text splashScreen = const Text(
    "ألاربعون النوويه",
    style: TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 36),
  );

  static Text topHomeScreen = const Text(
    "ألاربعون النوويه",
    textDirection: TextDirection.rtl,
    style: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
  );
  static Text headerHomeScreen = const Text(
    "لحفظ وسماع الاحاديث النوويه",
    style: TextStyle(
        color: Colors.green, fontWeight: FontWeight.bold, fontSize: 30),
  );

  static Text bookOneScreen = const Text("ألأحاديث الاربعون");
  static Text bookTwoScreen = const Text("ألأستماع للأحاديث");
  static Text bookThreeScreen = const Text("ألأحاديث المحفوظه");
}
