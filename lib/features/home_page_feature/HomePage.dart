import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/splash_screen_background.svg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Container(
            height: 300,
            width: 315,
            color: Colors.red,
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
