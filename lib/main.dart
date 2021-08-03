import 'package:flutter/material.dart';
import 'package:prative/api.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Api(),
      appBar: AppBar(title: Text("API APP"),
      backgroundColor: Colors.blueAccent,),),
    );
  }
}