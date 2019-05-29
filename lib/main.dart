import 'package:flutter/material.dart';
import 'package:my_music/music_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        canvasColor: Colors.transparent,
        errorColor: Colors.transparent,

        fontFamily: "Quicksand",
      ),
      home: MyMusicHome(),
    );
  }
}

