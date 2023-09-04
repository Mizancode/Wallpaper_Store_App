import 'package:flutter/material.dart';
import 'package:wallpaper_16_july_2023/Model/CategoryModel.dart';
// ignore: must_be_immutable
class CategoryWidget extends StatelessWidget{
  CategoryModel list;
  CategoryWidget(this.list);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Stack(
        children: [
          Container(
            height: 100,
            width: 160,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(list.imgUrl,),fit: BoxFit.cover
              )
            ),
          ),
          Container(
            height: 100,
            width: 160,
            color: Colors.black26,
          ),
          Positioned(
            left: 40.0,
              top: 40.0,
              child: Text(list.name,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}