import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
    void initState() {
      super.initState();
      print("Splash Page");
      Timer(Duration(seconds: 5),() => Navigator.of(context).pushReplacementNamed(LoginPage.tag));
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.red[900]
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 190.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.satellite,
                          color: Colors.black,
                          size: 50.0,
                          

                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      "Wait",style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),),
              Expanded(flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.only(top:20.0),

                  ),
                  
                ],

              ),)
            ],
          )
        ],
      ),

      
    );
  }
}