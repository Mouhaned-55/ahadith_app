import 'package:ahadith_app/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../db/mydata.dart';
import '../../local_audio/local_audio.dart';
import '../../model/hadith.dart';

class AudioAhadithScreen extends StatefulWidget {
  @override
  State<AudioAhadithScreen> createState() => _AudioAhadithScreenState();
}

class _AudioAhadithScreenState extends State<AudioAhadithScreen> {
  Widget build(BuildContext context) {
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
                style: const TextStyle(fontSize: 16, color: AppColors.yellow1),
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.yellow1),
                textScaleFactor: .5,
              ),
            ],
          )
        ],
      );
    }

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
                          "إستمع للأحاديث من هنا",
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

                    //we call the method, which is in the folder db file database.dart
                    future: Mydata.getAlldata(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            Hadith item = snapshot.data[index];
                            //delete one register for id
                            return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => LocalAudio(
                                          hadith: item,
                                          localAudioPath:
                                              'assets/audio/' + item.audioHadith)));
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
