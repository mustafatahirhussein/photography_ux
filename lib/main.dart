import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photography_ux/Screens/choice.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "photography_ux",
        theme: ThemeData(
          hintColor: Colors.black,
          primaryColor: Colors.black,
          canvasColor: Colors.transparent,
        ),
        home: Scaffold(
          body: Choice(),
        ),
      ),
    );
  });
}
