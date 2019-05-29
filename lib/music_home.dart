import 'package:flutter/material.dart';

class MyMusicHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyMusicState();
  }
}

class MyMusicState extends State<MyMusicHome> {

  List<BottomItem> bottomItems;
  List bottomOptions;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    initBottomItems();
    return new WillPopScope(
        child: null,
        onWillPop: null
    );
  }

  initBottomItems() {
    bottomItems = [
      new BottomItem("Home", Icons.home, null, null),
      new BottomItem("Albums", Icons.album, null, null),
      new BottomItem("Songs", Icons.music_note, null, null),
      new BottomItem("Artists", Icons.person, null, null),
      new BottomItem("Playlists", Icons.playlist_play, null, null),
    ];
  }
}

class BottomItem {
  String tooltip;
  IconData icon;
  VoidCallback onPressed;
  bool isSelected;
  BottomItem([this.tooltip, this.icon, this.onPressed, this.isSelected = false]);
}