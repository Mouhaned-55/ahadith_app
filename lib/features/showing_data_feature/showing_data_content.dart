import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/hadith.dart';
import '../../utils/colors/colors.dart';

class ShowingDataContent extends StatefulWidget {
  final String hadith;
  final Hadith ahadith;

  const ShowingDataContent(
      {super.key, required this.hadith, required this.ahadith});

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
                height: 50.w,
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
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 27.w,
                      height: 27.w,
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    "${widget.ahadith.key}",
                    style: TextStyle(
                        fontFamily: "Tajawal",
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Colors.black54),
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "${widget.ahadith.nameHadith}",
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
          ),
          SizedBox(
            height: 70.h,
          ),
          _convertHadith(context, widget.hadith),
        ],
      ),
    );
  }
}

Padding _convertHadith(BuildContext context, String text) {
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

  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: 15.w),
    child: RichText(
      textAlign: TextAlign.right,
      text: TextSpan(
        style: const TextStyle(
          fontSize: 20,
          color: AppColors.green1,
          fontFamily: "Tajawal",
          height: 1.5,
        ),
        children: [
          TextSpan(text: split.first),
          ...hadiths
              .map((text) => text.contains("{")
                  ? TextSpan(
                      text: text,
                      style: const TextStyle(
                          height: 1.5,
                          color: AppColors.yellow1,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Tajawal"))
                  : TextSpan(text: text))
              .toList()
        ],
      ),
      textDirection: TextDirection.rtl,
    ),
  );
}
