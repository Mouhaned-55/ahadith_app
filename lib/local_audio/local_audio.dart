import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/hadith.dart';

class LocalAudio extends StatefulWidget {
  final Hadith hadith;
  final String localAudioPath;
  LocalAudio({required this.localAudioPath,required this.hadith});

  @override
  State<LocalAudio> createState() => _LocalAudioState();
}

class _LocalAudioState extends State<LocalAudio> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
