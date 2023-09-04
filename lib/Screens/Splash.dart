import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wallpaper_16_july_2023/Screens/Home.dart';
class Splash extends StatefulWidget{
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/paint.png'),fit: BoxFit.cover
                ),
                gradient: LinearGradient(
                    colors: [
                      Color(0xfff5f7fa),
                      Color(0xffc3cfe2)
                    ]
                )
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black26,
          ),
          Center(
            child: Positioned(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Wallpaper',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w600),),
                    SizedBox(width: MediaQuery.of(context).size.height*0.01,),
                    Text('Store',style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.w600),),
                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}