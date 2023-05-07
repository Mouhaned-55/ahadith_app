import 'dart:async';

import 'package:ahadith_app/utils/strings/TextApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/colors/colors.dart';
import '../home_page_feature/HomePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 10), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    });
       SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            "assets/svg/splash.svg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ("assets/svg/logo.svg"),
                  height: 190.h,
                  width: 190.w,
           //       fit: BoxFit.fitHeight,
                ),
                SizedBox(height: 20.h),
                TextApp.splashScreen
              ],
            ),
          )
        ],
      ),
    );
  }
}
