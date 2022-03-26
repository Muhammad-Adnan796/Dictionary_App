import 'package:dictionary_app/app_texts/app_text_string.dart';
import 'package:dictionary_app/ui/widgets_Input/apps_colors.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerScreen extends StatelessWidget {
  static const String routeName = "/audioPlayer";

  AudioPlayerScreen({required this.url});

  final String? url;
  final _player = AudioPlayer();

  void playAudio() async {
    try {
      if (url != null) {
        await _player.setUrl(url!);
        await _player.play();
      }
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    print(url);
    return Scaffold(
      backgroundColor: AppsColors.backgroundclr,
      appBar: AppBar(
        backgroundColor: AppsColors.appbarcolor,
        title: Text(AppTexts.apTitlaudioplayer),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
              onTap: playAudio,
              child: Icon(
                Icons.play_arrow,
                size: 100,
                color: AppsColors.iconclr,
              )),
          Center(
              child: Text(
            AppTexts.playaudio,
            style: AppsColors.textstyle,
          ))
        ],
      ),
    );
  }
}
