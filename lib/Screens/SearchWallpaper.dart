import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_16_july_2023/Model/WallpaperModel.dart';
import 'package:wallpaper_16_july_2023/Widgets/GridWallpaper.dart';
import 'package:http/http.dart'as http;
class SearchWallpaper extends StatefulWidget{
  final que;

  SearchWallpaper(this.que);

  @override
  State<SearchWallpaper> createState() => _SearchWallpaperState();
}

class _SearchWallpaperState extends State<SearchWallpaper> {
  bool isLoading=false;
  TextEditingController searchController=TextEditingController();

  late String query=widget.que;

  Future<WallpaperModel> getWallpaperData()async{
    isLoading=false;
    final response=await http.get(Uri.parse('https://api.pexels.com/v1/search?query=$query&per_page=100'),
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
      body: Container(
      height: mediaQuery.height,
        width: mediaQuery.width,
        child: SafeArea(
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
                       query=searchController.text;
                       setState(() {
                       searchController.clear();
                       });
                    }, icon: Icon(Icons.search,size: 35,color: Colors.black,))
                  ],
                ),
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
      ),
    );
  }
}