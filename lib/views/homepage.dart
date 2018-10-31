import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:login/login.dart';

class HomePage extends StatefulWidget {
  static String tag = "Home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Welcome'),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top:38.0),
        child: new Column(
          children: <Widget>[
            new Container(
          child: Center(child: new Text('Homepage', style: TextStyle(
            fontSize: 30.0,
          ),)),
        ),
        Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: new RaisedButton(
            child: new Text("Sign out"),
              color: Colors.green,
              onPressed: (){
                print("inside Sign out button");
                _auth.signOut().whenComplete((){
                  print("Sign out Completed");
                    Navigator.of(context).pushReplacementNamed(LoginPage.tag);
                });


              }
          ),
        ),
          ],
        ),
      ),
      
      
      
      
      
      
    );
  }
}