import 'package:flutter/material.dart';
import 'package:wallpaper_16_july_2023/Screens/Splash.dart';
void main(){
  runApp(MyMain());
}
class MyMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}