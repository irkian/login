import 'package:flutter/material.dart';

class TempPage extends StatefulWidget {
  static String tag = "fpw";
  @override
  State createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
         title: new Text("FPW"),
      ),
      
    );
  }
}