import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:timeline/model/timeline_model.dart';
import 'package:timeline/timeline.dart';
import 'package:http/http.dart' as http;

class SessionListPage extends StatefulWidget {
  static String tag = "agenda-page";
  @override
    _SessionListPageState createState() => new _SessionListPageState();
}

class _SessionListPageState extends State<SessionListPage> {
  static String tag = "session-page";
  final String apiUrl = "https://api.myjson.com/bins/14349g";
  // 
  // Empty list for our posts
  List posts;
  @override
  void initState() {
    super.initState();
    this.getPosts();
  }
  // final List<TimelineModel> list = [];
  Future<String> getPosts() async {

    var res = await http.get(Uri.encodeFull(apiUrl), headers: {"Accept": "application/json"});

    // fill our posts list with results and update state
    setState(() {
      var resBody = json.decode(res.body);
      posts = resBody;
    });
    void Function(Object) post;
    // posts.forEach((post) => print(post.id));
    // posts.forEach((post) => list.add(TimelineModel(
    //   id: post.id,
    //   description: post.content,
    //   title: post.title)));

    return "Success!";
  }
  
  final List<TimelineModel> list = [
	TimelineModel(
      id: "1",
      description: "Event Desc1",
      title: "Event 1"),
	TimelineModel(
      id: "2",
      description: "Event Desc2",
      title: "Event 2")
  ];

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return  new TimelineComponent(
        timelineList: list,
      );
    }
}