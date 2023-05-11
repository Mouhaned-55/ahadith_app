import 'package:ahadith_app/utils/colors/colors.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../model/hadith.dart';

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
  // Define audio player instance and state variable
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.STOPPED;

  // Keep track of audio position
  Duration audioPosition = Duration.zero;
  Duration audioDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    // Set up a callback to update the audio position when the audio is playing
    audioPlayer.onAudioPositionChanged.listen((Duration newPosition) {
      setState(() {
        audioPosition = newPosition;
      });
    });

    // Set up a callback to update the audio duration when it is loaded
    audioPlayer.onDurationChanged.listen((Duration newDuration) {
      setState(() {
        audioDuration = newDuration;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40.w),
          Column(
            children: [
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
                  SizedBox(width: 30.w)
                ],
              ),
            ],
          ),
          SizedBox(height: 100.w),
          Image.asset("assets/audio_photo.png"),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            SizedBox(
              width: 50.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  "${widget.hadith.key}",
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
                  "${widget.hadith.nameHadith}",
                  style: TextStyle(
                      fontFamily: "Tajawal",
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                      color: AppColors.green1),
                  textAlign: TextAlign.end,
                )
              ],
            ),
          ]),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                // Text(_durationToString(audioPosition)),
                Expanded(
                  child: Slider(
                    activeColor: AppColors.yellow1,
                    value: audioPosition.inMilliseconds.toDouble(),
                    max: audioDuration.inMilliseconds.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        audioPosition = Duration(milliseconds: value.toInt());
                      });
                      audioPlayer.seek(audioPosition);
                    },
                  ),
                ),
                // Text(_durationToString(audioDuration)),
              ],
            ),
          ),
          SizedBox(height: 25.h),
          Center(
            child: GestureDetector(
              child: Icon(
                _getIconForState(),
                size: 50,
              ),
              onTap: _onPressed,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForState() {
    switch (audioPlayerState) {
      case PlayerState.PLAYING:
        return Icons.pause_circle_outline_rounded;
      case PlayerState.PAUSED:
        return Icons.play_arrow_outlined;
      default:
        return Icons.play_arrow_outlined;
    }
  }

  void _onPressed() {
    if (audioPlayerState == PlayerState.PLAYING) {
      _pauseAudio();
    } else if (audioPlayerState == PlayerState.PAUSED) {
      _resumeAudio();
    } else {
      _playAudio();
    }
  }

  // Play audio method
  void _playAudio() async {
    ByteData bytes =
        await rootBundle.load(widget.localAudioPath); //load sound from assets
    Uint8List soundbytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    int result = await audioPlayer.playBytes(soundbytes);
    if (result == 1) {
      //play success
      setState(() {
        audioPlayerState = PlayerState.PLAYING;
      });
      print("Sound playing successful.");
    } else {
      print("Error while playing sound.");
    }
  }

// Pause audio method
  void _pauseAudio() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      setState(() {
        audioPlayerState = PlayerState.PAUSED;
      });
      // Save audio position
      audioPosition = (await audioPlayer.getCurrentPosition()) as Duration;
    }
  }

  void _resumeAudio() async {
    int result = await audioPlayer.resume();
    if (result == 1) {
      setState(() {
        audioPlayerState = PlayerState.PLAYING;
      });
    }
  }

  // Stop audio method
  void _stopAudio() async {
    int result = await audioPlayer.stop();
    if (result == 1) {
      setState(() {
        audioPlayerState = PlayerState.STOPPED;
      });
    }
  }

  // Override dispose method to release resources when widget is removed
  @override
  void dispose() {
    audioPlayer.release();
    super.dispose();
  }
}
