import 'package:ahadith_app/features/home_page_feature/HomePage.dart';
import 'package:ahadith_app/features/single_hadith_feature/home_hadith.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../db/mydata.dart';
import '../../model/hadith.dart';
import '../../utils/colors/colors.dart';

class AhadithScreen extends StatefulWidget {
  const AhadithScreen({super.key});

  @override
  State<AhadithScreen> createState() => _AhadithScreenState();
}

class _AhadithScreenState extends State<AhadithScreen> {
  Widget ayah(String key, name) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/img.png"),
        SvgPicture.asset("assets/svg/grey.svg"),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              key,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.yellow1,
                fontFamily: "Tajawal",
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Tajawal",
                  color: AppColors.yellow1),
              textScaleFactor: .5,
            ),
          ],
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/svg/background.svg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 50.h,
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
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/svg/background.svg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                FutureBuilder(
                    future: Mydata.getAlldata(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            Hadith item = snapshot.data[index];
                            return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          HomeHadith(hadith: item,)));
                                },
                                child: ayah(item.key, item.nameHadith));
                          },
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            mainAxisSpacing: 20,
                            childAspectRatio: 3 / 2,
                          ),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*     Expanded(
              flex: 1,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    "assets/svg/background.svg",
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset("assets/svg/logo.svg"),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      Text(
                        "الاحاديث الاربعين",
                        style: TextStyle(
                            fontFamily: "Tajawal",
                            fontWeight: FontWeight.bold,
                            fontSize: 24.sp,
                            color: AppColors.green1),
                      )
                    ],
                  )
                ],
              )),
          Expanded(flex: 3, child: Stack()),*/