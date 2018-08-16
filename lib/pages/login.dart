import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app/pages/home.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
      idToken: gSA.idToken,
      accessToken: gSA.accessToken
    );

    print("User name : ${user.displayName}");
    return user;
  }
  void _signOut() {
    googleSignIn.signOut();
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Image.asset("logo.png"),
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new RaisedButton(
                padding: EdgeInsets.all(16.0),
                child: new Text("Login"),
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                onPressed: (){
                  _signIn()
                  .then((FirebaseUser user) => Navigator.of(context).pushNamed(HomePage.tag))
                  .catchError((e) => print(e));
                },
              ),
            ), 
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            // new RaisedButton(
            //   padding: EdgeInsets.zero,
            //   child: new Text("Logout"),
            //   color: Theme.of(context).accentColor,
            //   textColor: Colors.white,
            //   onPressed: (){_signOut();},
            // ), 
          ], 
        );
    }
}
