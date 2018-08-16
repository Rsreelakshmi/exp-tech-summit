import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AgendaPage extends StatefulWidget {
  static String tag = "agenda-page";
  @override
    _AgendaPageState createState() => new _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  final String apiUrl = "https://api.myjson.com/bins/14349g";
  // 
  // Empty list for our posts
  List posts;
  @override
  void initState() {
    super.initState();
    this.getPosts();
  }

  Future<String> getPosts() async {

    var res = await http.get(Uri.encodeFull(apiUrl), headers: {"Accept": "application/json"});

    // fill our posts list with results and update state
    setState(() {
      var resBody = json.decode(res.body);
      posts = resBody;
    });

    return "Success!";
  }

  void showFilters () {

  }
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return ListView.builder(
        itemCount: posts == null ? 0 : posts.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.all(10.0),
                      child: new ListTile(
                        title: new Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(posts[index]["title"]),
                              new Text(posts[index]["meta"]["time"] + " | " + posts[index]["meta"]["duration"]),
                              // new Text(posts[index]["meta"]["duration"])
                            ],
                          )
                        ),
                        subtitle: new Text(posts[index]["excerpt"].replaceAll(new RegExp(r'<[^>]*>'), ''))
                      ),
                    )
                  ],
                  )
              )
            ],
          );
        },
      );
    }
}