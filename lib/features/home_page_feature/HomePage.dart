import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors/colors.dart';
import '../../utils/strings/TextApp.dart';
import '../ahadith_feature/ahadith_screen.dart';
import '../audio_hadith_feature.dart/audio_hadith_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SvgPicture.asset(
          "assets/svg/background.svg",
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            SizedBox(
              height: 70.h,
            ),
            SvgPicture.asset("assets/svg/logo.svg"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                    margin: EdgeInsets.only(right: 20.w, top: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextApp.topHomeScreen,
                        SizedBox(
                          height: 5.h,
                        ),
                        TextApp.headerHomeScreen,
                      ],
                    )),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => AhadithScreen()));
                    },
                    child: myCard(
                        AppColors.green1,
                        AppColors.green2,
                        "الاحاديث الاربعين",
                        "assets/quran.png",
                        'assets/svg/one.svg')),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) =>  AudioAhadithScreen()));
                    },
                    child: myCard(
                        AppColors.yellow1,
                        AppColors.red2,
                        "الاستماع للاحاديث",
                        "assets/play.png",
                        'assets/svg/twoo.svg')),
                myCard(AppColors.red1, AppColors.red2, "الاحاديث المحفوظه",
                    "assets/save-instagram.png", "assets/svg/three.svg")
              ],
            ),
          ],
        )
      ],
    ));
  }
}

Widget myCard(Color color1, color2, String text, path1, path2) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 48),
    child: Container(
      height: 117,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(10, 10), blurRadius: 40)
          ],
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
              colors: [
                color1,
                color2,
              ],
              begin: AlignmentDirectional.topEnd,
              end: AlignmentDirectional.bottomStart)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(path1),
          Text(
            text,
            style: TextStyle(
                fontFamily: "Tajawal",
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          SvgPicture.asset(path2)
        ],
      ),
    ),
  );
}
