import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../db/mydata.dart';
import '../../model/hadith.dart';
import '../../utils/colors/colors.dart';
import '../single_hadith_feature/home_hadith.dart';

class FavortiesScreen extends StatefulWidget {
  final Hadith? hadith;

  const FavortiesScreen({Key? key, this.hadith}) : super(key: key);

  @override
  State<FavortiesScreen> createState() => _FavortiesScreenState();
}

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

class _FavortiesScreenState extends State<FavortiesScreen> {
  List<Hadith> listOfAhadith = [];

  void moveToFavoriteHadith(Hadith item) async {
    final information = await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => HomeHadith(hadith: item)));
    if (information) {
      setState(() {
        final index = listOfAhadith.indexOf(item);
        listOfAhadith[index].fav = !listOfAhadith[index].fav;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Mydata.getAlldata()
        .then((value) => setState(() => {listOfAhadith = value}));
  }

  @override
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
                          "الأحاديث المحفوظة",
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
                GridView.builder(
                  itemCount: listOfAhadith
                      .where((element) => element.fav)
                      .toList()
                      .length,
                  itemBuilder: (BuildContext context, int index) {
                    Hadith item = listOfAhadith[index];
                    //delete one register for id
                    return GestureDetector(
                        onTap: () {
                          moveToFavoriteHadith(item);
                        },
                        child: ayah(item.key, item.nameHadith));
                  },
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    mainAxisSpacing: 20,
                    childAspectRatio: 3 / 2,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
