import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_16_july_2023/Model/WallpaperModel.dart';
import 'package:http/http.dart'as http;
import 'package:wallpaper_16_july_2023/Widgets/GridWallpaper.dart';
// ignore: must_be_immutable
class CategoryDetail extends StatelessWidget{
  bool isLoading=false;
  final name;
  final image;
  Future<WallpaperModel> getWallpaperData()async{
    isLoading=false;
    final response=await http.get(Uri.parse('https://api.pexels.com/v1/search?query=$name&per_page=100'),
        headers: {'Authorization':'r7Sc9n2MR9SP0yyhGZ54mgGg0qWiwTq1obR9mCQdHs9LthJeNqCRJBlT'});
    var data=jsonDecode(response.body);
    isLoading=true;
    if(response.statusCode==200){
      return WallpaperModel.fromJson(data);
    }else{
      return throw Exception('error');
    }
  }
  CategoryDetail(this.name,this.image);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Container(
              child: Stack(
                children: [
                  Image.network(image,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*0.15,fit: BoxFit.cover,),
                  Container(
                    height:MediaQuery.of(context).size.height*0.15,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black38,
                  )
                ],
              )
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Expanded(
                child: FutureBuilder(
                  future: getWallpaperData(),
                  builder: (context,snapshot){
                    if(!isLoading){
                      return Center(child: CircularProgressIndicator(),);
                    }else{
                      return  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 7,
                              crossAxisSpacing: 7,
                              childAspectRatio: 1.6/3,
                            ),
                            itemCount: snapshot.data!.photos!.length,
                            itemBuilder: (context,index){
                              return GridWallpaper(image: snapshot.data?.photos![index].src!.portrait.toString());
                            }
                        ),
                      );
                    }
                  },
                )

            )

          ],
        )
      ),
    );
  }
}