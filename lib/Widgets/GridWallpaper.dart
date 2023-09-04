import 'package:flutter/material.dart';
import 'package:wallpaper_16_july_2023/Screens/FullImage.dart';
class GridWallpaper extends StatelessWidget{
  final image;
  GridWallpaper({required this.image});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>FullImage(image)));
      },
      child: Hero(
        tag: image,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}