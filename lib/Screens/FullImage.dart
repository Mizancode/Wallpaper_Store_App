import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:wallpaper_16_july_2023/utils/ToastMessage.dart';
class FullImage extends StatefulWidget{
  final image;
  FullImage(this.image);

  @override
  State<FullImage> createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {
  double? _progress;
  @override
  Widget build(BuildContext context) {
    downloadImg(String img){
      try{
        Toast.toastMessage('Downloading Started...');
        FileDownloader.downloadFile(url: img,
            onProgress: (name,progress){
              _progress=progress;
              setState(() {

              });
            },
            onDownloadCompleted: (value){
              Toast.toastMessage('Download Completed...');
              _progress=null;
              setState(() {

              });
            },
            onDownloadError: (value){
              Toast.toastMessage(value);
              _progress=null;
              setState(() {

              });
            }
        );
      }catch(e){
        Toast.toastMessage(e.toString());
      }
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Hero(
        tag: widget.image,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.image),fit: BoxFit.cover
            )
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            downloadImg(widget.image);
          },
          label: Text('Download',style: TextStyle(fontSize: 20),),
        icon: Icon(Icons.download),
      ),
    );
  }
}