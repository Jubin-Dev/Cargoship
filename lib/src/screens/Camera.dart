import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

Future main() async {
  runApp(new Camera());
}

class Camera extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _CameraState ();
  }
  
  class _CameraState  extends State<Camera> {
   
    File _image;
   
   Future getImage() async{
     var image = await ImagePicker.pickImage(source:  ImageSource.camera);
     setState(() {
       _image = image;
       
     });

   }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Image Picker',
      home: new Scaffold(
        body: new Center(
          child: _image == null ? new Text('No image Selected'): new Image.file(_image,),

        ) ,
        floatingActionButton: new FloatingActionButton(
          onPressed: getImage,tooltip: 'Select Image',
        child: new Icon(Icons.camera_alt, color: Colors.white,),
        ),

      ),
    );
  
    
  }
}