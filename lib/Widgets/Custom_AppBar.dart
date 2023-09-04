import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Wallpaper',style: TextStyle(color: Colors.deepOrange,fontSize: 25,fontWeight: FontWeight.w600),),
        SizedBox(width: MediaQuery.of(context).size.height*0.01,),
        Text('Store',style: TextStyle(color: Colors.deepPurple,fontSize: 25,fontWeight: FontWeight.w600),),
      ],
    );
  }
}