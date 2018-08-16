import 'package:flutter/material.dart';
import 'package:login_app/pages/sessionList.dart';
import 'package:login_app/pages/agenda.dart';
import 'package:login_app/pages/favorite.dart';

class HomePage extends StatelessWidget {
  static String tag = "home-page";
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new MaterialApp(
        title: "XT Agenda",
        home: new DefaultTabController(
          length: 3,
          child: new Scaffold(
            appBar: new AppBar(
              title: new Text("XT Summit 2018"),
              bottom: new TabBar(
                indicatorPadding: EdgeInsets.zero,
                tabs: <Widget>[
                  new Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: new Text("Home"),
                  ),
                  new Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: new Text("Agenda"),
                  ),
                  new Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: new Text("Fovarites"),
                  )
                ],
              ),
            ),
            body: new TabBarView(
              children: <Widget>[
                new SessionListPage(),
                new AgendaPage(),
                new FavoritePage()
              ],
            ),
          )
        )
      );
    }
}