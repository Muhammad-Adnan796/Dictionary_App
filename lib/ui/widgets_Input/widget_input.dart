import 'package:dictionary_app/app_texts/app_text_string.dart';
import 'package:dictionary_app/ui/widgets_Input/apps_colors.dart';
import 'package:flutter/material.dart';

class Custominput extends StatelessWidget {
  Custominput({required this.onChange});

  final void Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        child: TextField(
          onChanged: onChange,
          cursorColor: AppsColors.cursorclr,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: AppsColors.textfieldbordersideclr),
                  borderRadius: BorderRadius.circular(15)),
              hintText: AppTexts.textfieldhinttext,
              hintStyle: const TextStyle(color: AppsColors.hinttextclr),
              filled: true,
              fillColor: AppsColors.textfieldinputclr,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              icon: const Icon(
                Icons.text_fields,
                color: AppsColors.iconclr,
                size: 30,
              )),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
