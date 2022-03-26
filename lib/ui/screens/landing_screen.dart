import 'package:dictionary_app/app_texts/app_text_string.dart';
import 'package:dictionary_app/data/word.dart';
import 'package:dictionary_app/services/dictionary_services.dart';
import 'package:dictionary_app/ui/screens/audio_player_screen.dart';
import 'package:dictionary_app/ui/widgets_Input/apps_colors.dart';
import 'package:dictionary_app/ui/widgets_Input/custom_button.dart';
import 'package:dictionary_app/ui/widgets_Input/meaning_card.dart';
import 'package:dictionary_app/ui/widgets_Input/widget_input.dart';
import 'package:flutter/material.dart';

class LandingUi extends StatefulWidget {
  static const String routeName = '/';

  @override
  State<LandingUi> createState() => _LandingUiState();
}

class _LandingUiState extends State<LandingUi> {
  String searchStr = "";
  DictionaryServices _dictionaryServices = DictionaryServices();
  Word? wordMeaning;
  bool isloading = false;

  void updateUi(value) {
    setState(() {
      searchStr = value;
    });
  }

  void toggleisloading() {
    isloading = !isloading;
  }

  void changeFocus() {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void onpress() async {
    changeFocus();
    toggleisloading();
    final response = await _dictionaryServices.getData(searchStr);
    setState(() {
      wordMeaning = response;
    });
    toggleisloading();
  }

  void handleaudio() {
    Navigator.pushNamed(context, AudioPlayerScreen.routeName,
        arguments: _dictionaryServices.getAudioUrl(wordMeaning?.audioName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppsColors.backgroundclr,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppTexts.appbarTitle),
        backgroundColor: AppsColors.appbarcolor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Custominput(
              onChange: updateUi,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CustomButton(
                    onPressed: onpress,
                    title: const Icon(
                      Icons.near_me,
                      size: 30,
                      color: AppsColors.iconclr,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: AppsColors.divderclr,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "${isloading ? AppTexts.searchingword : AppTexts.maintext} : $searchStr",
                  style: AppsColors.textstyle),
            ),
            wordMeaning != null
                ? MeaningCard(
                    word: wordMeaning!,
                    onAudioClickhandler: handleaudio,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
