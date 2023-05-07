import 'package:ahadith_app/features/ahadith_feature/audio_ahadith_screen.dart';
import 'package:ahadith_app/features/showing_data_feature/data_page.dart';
import 'package:ahadith_app/local_audio/local_audio.dart';
import 'package:ahadith_app/utils/colors/colors.dart';

import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../../model/hadith.dart';


class HomeHadith extends StatefulWidget {
  final Hadith hadith;

  HomeHadith({required this.hadith});

  @override
  State<StatefulWidget> createState() {
    return HomeHadithState();
  }
}

class HomeHadithState extends State<HomeHadith> {
  bool bol = true;
  bool clickedCentreFAB =
      false; //boolean used to handle container animation which expands from the FAB
  int selectedIndex =
      0; //to handle which item is currently selected in the bottom app bar
  String text = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text = widget.hadith.textHadith;
  }

  //call this method on click of each bottom app bar item to update the screen
  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText + ' \n';
    });
  }

  Widget getWedjet(bool bol) {
    if (bol) {
      return DataPage(
        hadith: widget.hadith,
        data: text,
      );
    } else {
      return LocalAudio(
          hadith: widget.hadith,
          localAudioPath: 'audio/' + widget.hadith.audioHadith);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            getWedjet(bol),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black38,
          onPressed: () {
            setState(() {
              clickedCentreFAB =
                  !clickedCentreFAB; //to update the animated container
            });
            //          Share text
            Share.share(text, subject: widget.hadith.nameHadith);
          },
          tooltip: "Centre FAB",
          child: Container(
            margin: EdgeInsets.all(15.0),
            child: Icon(Icons.share),
          ),
          elevation: 4.0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: BottomAppBar(
          // ignore: sort_child_properties_last
          child: Container(
            height: 60,
            margin: EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  //update the bottom app bar view each time an item is clicked
                  onPressed: () {
                    bol = true;
                    updateTabSelection(0, widget.hadith.textHadith);
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.book,
                    //darken the icon if it is selected or else give it a different color
                    color: selectedIndex == 0
                        ? AppColors.yellow1
                        : Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    bol = true;
                    updateTabSelection(1, widget.hadith.explanationHadith);
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.library_books,
                    color: selectedIndex == 1
                        ? AppColors.yellow1
                        : Colors.white,
                  ),
                ),
                //to leave space in between the bottom app bar items and below the FAB
                SizedBox(
                  width: 50.0,
                ),
                IconButton(
                  onPressed: () {
                    bol = true;
                    updateTabSelection(2, widget.hadith.translateNarrator);
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.collections_bookmark,
                    color: selectedIndex == 2
                        ? AppColors.yellow1
                        : Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    bol = false;
                    updateTabSelection(3,
                        widget.hadith.key + ' \n' + widget.hadith.nameHadith);
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.volume_up,
                    color: selectedIndex == 3
                        ? AppColors.yellow1
                        : Colors.white,
                  ),
                ),
              ],
            ),
          ),
          //to add a space between the FAB and BottomAppBar
          shape: CircularNotchedRectangle(),
          //color of the BottomAppBar
          color: AppColors.green1,
        ));
  }
}
