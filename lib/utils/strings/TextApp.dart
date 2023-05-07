import 'package:flutter/material.dart';

abstract class TextApp {
  static Text splashScreen = const Text(
    "تطبيق أحاديث",
    style: TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 36,fontFamily: "Tajawal"),
  );

  static Text topHomeScreen = const Text(
    "تطبيق أحاديث",
    textDirection: TextDirection.rtl,
    style: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16,fontFamily: "Tajawal"),
  );
  static Text headerHomeScreen = const Text(
    "لحفظ وسماع الاحاديث النبوية",
    style: TextStyle(
        color: Colors.green, fontWeight: FontWeight.bold, fontSize: 24,fontFamily: "Tajawal"),
  );

  static Text bookOneScreen = const Text("ألأحاديث النبوية",style: TextStyle(fontFamily: "Tajawal",color: Colors.white,fontWeight: FontWeight.bold));
  static Text bookTwoScreen = const Text("ألأستماع للأحاديث",style: TextStyle(fontFamily: "Tajawal",color: Colors.white,fontWeight: FontWeight.bold));
  static Text bookThreeScreen = const Text("ألأحاديث المحفوظه",style: TextStyle(fontFamily: "Tajawal",color: Colors.white,fontWeight: FontWeight.bold));
}
