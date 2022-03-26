import 'package:dictionary_app/services/dictionary_services.dart';
import 'package:dictionary_app/ui/screens/audio_player_screen.dart';
import 'package:dictionary_app/ui/screens/landing_screen.dart';
import 'package:flutter/material.dart';

abstract class CustomRoutes {
  static Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AudioPlayerScreen.routeName:
        final String url = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => AudioPlayerScreen(
                  url: url,
                ));
      default:
        return MaterialPageRoute(builder: (_) => LandingUi());
    }
  }
}
