import 'package:flutter/material.dart';
import 'package:login_app/pages/login.dart';
import 'package:login_app/pages/home.dart';
import 'package:login_app/pages/agenda.dart';


void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => new _MyAppState();
}
class _MyAppState extends State<MyApp> {
  String _title = 'XT Summit 2018';
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    AgendaPage.tag: (context) => AgendaPage(),
  };

  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Login App",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Padding(
            padding: const EdgeInsets.all(16.0),
            child:new Image.asset("company-logo.png"),
          )
        ),
        body: new LoginPage(),
        backgroundColor: Colors.white
      ),
      routes: routes,
    );
  }
}