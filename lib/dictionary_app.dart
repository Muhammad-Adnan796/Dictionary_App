import 'package:dictionary_app/ui/screens/landing_screen.dart';
import 'package:dictionary_app/ui/widgets_Input/routes.dart';
import 'package:flutter/material.dart';

class DictionaryApp extends StatefulWidget {
  const DictionaryApp({Key? key}) : super(key: key);

  @override
  State<DictionaryApp> createState() => _DictionaryAppState();
}

class _DictionaryAppState extends State<DictionaryApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LandingUi.routeName,
      onGenerateRoute: CustomRoutes.generateRoutes,
    );
  }
}
