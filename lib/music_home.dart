import 'package:flutter/material.dart';
import 'package:my_music/views/home.dart';
import 'theme.dart';
import 'database/database_client.dart';

class MyMusicHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyMusicState();
  }
}

class MyMusicState extends State<MyMusicHome> {
  String title = "Music player";
  List<BottomItem> bottomItems;
  List bottomOptions;
  DatabaseClient db;
  int _selectedDrawerIndex = 0;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() async {
    db = new DatabaseClient();
    await db.create();
  }

  @override
  Widget build(BuildContext context) {
    initBottomItems();

    var bottomOptions = <BottomNavigationBarItem>[];

    for(var i in bottomItems) {
      bottomOptions.add(
        new BottomNavigationBarItem(
          icon: new Icon(i.icon),
          title: new Text(i.title),
          backgroundColor: accentColor
        )
      );
    }

    return new WillPopScope(
        child: new Scaffold(
          appBar: new AppBar(
            backgroundColor: accentColor,
            title: new Text(title),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search), color: Colors.white, onPressed: null,),
            ],
          ),
          floatingActionButton: new FloatingActionButton(
            child: Icon(Icons.play_circle_outline),
            backgroundColor: Colors.white,
            foregroundColor: accentColor,
            onPressed: null,
          ),
          body: RefreshIndicator(
            child: getDrawerItemWidget(_selectedDrawerIndex), onRefresh: () {}
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomOptions,
            onTap: (index) => _onSelectedItem(index),
            currentIndex: _selectedDrawerIndex,
            type: BottomNavigationBarType.fixed,
            fixedColor: accentColor.withOpacity(0.7),
            iconSize: 25,
          ),
        ),

        onWillPop: _onWillPop
    );
  }

  initBottomItems() {
    bottomItems = [
      new BottomItem("Home", Icons.home),
      new BottomItem("Albums", Icons.album),
      new BottomItem("Songs", Icons.music_note),
      new BottomItem("Artists", Icons.person),
      new BottomItem("Playlists", Icons.playlist_play),
    ];
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Are you sure?"),
          content: new Text("Music player will be stopped."),
          actions: <Widget>[
            new FlatButton(onPressed: () => Navigator.of(context).pop(false), child: new Text("No")),
            new FlatButton(onPressed: () {
              Navigator.of(context).pop(true);
              },
              child: new Text("Yes"))
          ],
        );
      }
    ) ?? false;
  }

  _onSelectedItem(int index) {
    setState(() {
      _selectedDrawerIndex = index;
    });
    title = bottomItems[index].title;
  }

  getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Home(db);
    }
  }
}

class BottomItem {
  String title;
  IconData icon;
  BottomItem([this.title, this.icon]);
}