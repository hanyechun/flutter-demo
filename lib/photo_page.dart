import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPage extends StatefulWidget {
  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  List<File> _images = [];
  final picker = ImagePicker();

  Future getImage(bool isTakePhoto) async {
    final pickedFile = await picker.getImage(
        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);

    setState(() {
      _images.add(File(pickedFile.path));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拍照'),
        leading: BackButton(),
      ),
      body: Center(
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          children: _genImages(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePhoto,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  _takePhoto() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 120,
              child: Column(
                children: [
                  _item('拍照', true),
                  _item('从相册选择', false),
                ],
              ),
            ));
  }

  _item(String title, bool isTakePhoto) {
    return ListTile(
      title: Text(title),
      leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
      onTap: () => {
        getImage(isTakePhoto),
        Navigator.pop(context) //让弹框消失
      },
    );
  }

  _genImages() {
    return _images.map((file) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
              color: Colors.transparent,
              child: Image.file(
                file,
                width: 110,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _images.remove(file);
                  });
                },
                child: ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(color: Colors.black54),
                    child: Icon(
                      Icons.close,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ))
        ],
      );
    }).toList();
  }
}
