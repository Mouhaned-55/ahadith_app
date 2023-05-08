import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../model/hadith.dart';

const defaultPlayerCount = 4;

class LocalAudio extends StatefulWidget {
  final Hadith hadith;
  final String localAudioPath;

  const LocalAudio(
      {Key? key, required this.hadith, required this.localAudioPath})
      : super(key: key);

  @override
  State<LocalAudio> createState() => _LocalAudioState();
}

class _LocalAudioState extends State<LocalAudio> {
  List<AudioPlayer> audioPlayers = List.generate(
    defaultPlayerCount,
    (_) => AudioPlayer()..setReleaseMode(ReleaseMode.stop),
  );

  int selectedPlayerIdx = 0;

  AudioPlayer get selectedAudioPlayer => audioPlayers[selectedPlayerIdx];

  List<StreamSubscription> streams = [];

  @override
  void dispose() {
    streams.forEach((it) {
      it.cancel();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Play Audio in Flutter App"),
          backgroundColor: Colors.redAccent),
      body: Container(),
    );
  }
}
