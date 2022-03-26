import 'package:dictionary_app/app_texts/app_text_string.dart';
import 'package:dictionary_app/app_texts/error_string.dart';
import 'package:dictionary_app/data/word.dart';
import 'package:dictionary_app/ui/widgets_Input/apps_colors.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MeaningCard extends StatelessWidget {
  MeaningCard({required this.word, required this.onAudioClickhandler});

  Word word;
  void Function() onAudioClickhandler;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.blueGrey.shade900,
          elevation: 20,
          shadowColor: Colors.grey.shade900,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                word.word.isNotEmpty
                    ? Text(
                        "${AppTexts.maintext} ${word.word}",
                        style: AppsColors.textstyle,
                      )
                    : Container(),
                Text(
                  word.meaning.isNotEmpty ? '${word.meaning}' : ErrorStrings.na,
                  style: AppsColors.textstyle,
                ),
                word.audioName.isNotEmpty
                    ? GestureDetector(
                        onTap: onAudioClickhandler,
                        child: Icon(
                          Icons.volume_up,
                          color: AppsColors.iconclr,
                          size: 32,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
