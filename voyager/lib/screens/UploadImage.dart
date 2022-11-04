import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? image;
  Future _pickImage1() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future _pickImage2() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 600,
        decoration: BoxDecoration(
            gradient: SweepGradient(colors: [
          Color.fromARGB(255, 162, 0, 187),
          Color.fromARGB(255, 230, 141, 171),
          Colors.purple,
          Color.fromARGB(255, 230, 141, 171),
          Color.fromARGB(255, 167, 0, 193),
        ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: image != null
                  ? Image.file(
                      image!,
                      width: 200,
                      height: 200,
                    )
                  : Image.network(
                      "https://flyclipart.com/thumb2/purple-camera-clip-art-594601.png",
                      width: 200,
                      height: 200,
                    ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Upload image from"),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  _pickImage1();
                                },
                                icon: Icon(Icons.browse_gallery)),
                            IconButton(
                                onPressed: () {
                                  _pickImage2();
                                },
                                icon: Icon(Icons.camera))
                          ],
                        ),
                      );
                    });
              },
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Upload"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            )
          ],
        ),
      ),
    );
  }
}
