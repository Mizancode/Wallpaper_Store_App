import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_16_july_2023/Model/CategoryModel.dart';
import 'package:wallpaper_16_july_2023/Model/WallpaperModel.dart';
import 'package:wallpaper_16_july_2023/Screens/CategoryDetail.dart';
import 'package:wallpaper_16_july_2023/Screens/SearchWallpaper.dart';
import 'package:wallpaper_16_july_2023/Widgets/CategoryWidget.dart';
import 'package:wallpaper_16_july_2023/Widgets/Custom_AppBar.dart';
import 'package:wallpaper_16_july_2023/Widgets/GridWallpaper.dart';
import 'package:http/http.dart' as http;
// ignore: must_be_immutable
class Home extends StatelessWidget{
  bool isLoading=false;
  TextEditingController searchController=TextEditingController();
  List<String> name=[
    'Car',
    'People',
    'SuperBike',
    'Dog',
    'Cat'
  ];
  CategoryModelList l=new CategoryModelList();
  Future<WallpaperModel> getWallpaperData()async{
    isLoading=false;
    final response=await http.get(Uri.parse('https://api.pexels.com/v1/search?query=nature&per_page=100'),
    headers: {'Authorization':'r7Sc9n2MR9SP0yyhGZ54mgGg0qWiwTq1obR9mCQdHs9LthJeNqCRJBlT'});
    var data=jsonDecode(response.body);
    isLoading=true;
    if(response.statusCode==200){
      return WallpaperModel.fromJson(data);
    }else{
      return throw Exception('error');
    }
  }
  @override
  Widget build(BuildContext context) {
    final mediaQuery=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomAppBar(),
      ),
      body: Container(
        height: mediaQuery.height,
        width: mediaQuery.width,
        child: Column(
          children: [
            SizedBox(height: mediaQuery.height*0.01,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              width: mediaQuery.width,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(30.0)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search Wallpaper',
                          border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SearchWallpaper(searchController.text.toString())));
                  }, icon: Icon(Icons.search,size: 35,color: Colors.black,))
                ],
              ),
            ),
            SizedBox(height: mediaQuery.height*0.01,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 100,
              width: mediaQuery.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: l.list.length,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryDetail(name[index].toString(),l.list[index].imgUrl)));
                      },
                        child: CategoryWidget(l.list[index]));
                  }),
            ),
            SizedBox(height: mediaQuery.height*0.01,),
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
        ),
      ),
    );
  }
}