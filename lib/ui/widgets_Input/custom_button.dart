import 'package:dictionary_app/ui/widgets_Input/apps_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.onPressed,
    required this.title,
    this.backgroundcolor = AppsColors.butonbackgroundclr,
  });
  final void Function() onPressed;
  final Widget title;
  final Color backgroundcolor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: title,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundcolor)),
    );
  }
}
