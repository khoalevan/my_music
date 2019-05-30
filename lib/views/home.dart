import 'package:flutter/material.dart';
import 'package:my_music/database/database_client.dart';

class Home extends StatefulWidget {
  DatabaseClient db;

  Home(this.db);

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  List songs;
  bool isLoading = false;
  int noOfFavorites;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}