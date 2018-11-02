import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:login/reset.dart';
import 'package:login/temp.dart';
import 'package:login/views/homepage.dart';
import 'package:login/views/splashScreen.dart';


void main()
{runApp(new MyApp());
}

class MyApp extends StatelessWidget{
  final routes = <String, WidgetBuilder>{
    HomePage.tag:(context) => HomePage(),
    LoginPage.tag:(context) => LoginPage(),
    TempPage.tag:(context) => TempPage(),

    //ResetPassword.tag:(context) => ResetPassword(),
  
  };
  @override
  Widget build(BuildContext context){

    return new MaterialApp(
      title: 'Login demo',
      home: new SplashScreen(),
      theme : new ThemeData(primarySwatch: Colors.blue),
      routes: routes,

    );
  }
}

