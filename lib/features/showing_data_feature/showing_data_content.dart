import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/colors/colors.dart';

class ShowingDataContent extends StatefulWidget {
  final String hadith;

  const ShowingDataContent({super.key, required this.hadith});

  @override
  State<ShowingDataContent> createState() => _ShowingDataContentState();
}

class _ShowingDataContentState extends State<ShowingDataContent> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  SvgPicture.asset("assets/svg/logo.svg"),
                  SizedBox(
                    width: 20.w,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "الاحاديث الاربعين",
                    style: TextStyle(
                        fontFamily: "Tajawal",
                        fontWeight: FontWeight.bold,
                        fontSize: 24.sp,
                        color: AppColors.green1),
                    textAlign: TextAlign.end,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

RichText _convertHadith(BuildContext context, String text) {
  text = text.replaceAll("(", "{");
  text = text.replaceAll(")", "}");

  List<String> split = text.split(RegExp("{"));

  List<String> hadiths =
      split.getRange(1, split.length).fold([], (previousValue, element) {
    var texts = element.split("}");

    if (texts.length > 1) {
      return List.from(previousValue)
        ..addAll([
          "{${texts.first}}",
          "${element.substring(texts.first.length + 1)}"
        ]);
    }
    return List.from(previousValue)..add("{${texts.first}");
  });

  return RichText(
    textAlign: TextAlign.right,
    text: TextSpan(
      style: TextStyle(fontSize: 20, color: Colors.brown),
      children: [TextSpan(text: split.first)]..addAll(hadiths
          .map((text) => text.contains("{")
              ? TextSpan(
                  text: text,
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold))
              : TextSpan(text: text))
          .toList()),
    ),
    textDirection: TextDirection.rtl,
  );
}
