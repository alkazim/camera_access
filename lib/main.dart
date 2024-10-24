import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(home: CameraAcess(),debugShowCheckedModeBanner: false,));
}

class CameraAcess extends StatefulWidget {
  CameraAcess({super.key});

  @override
  State<CameraAcess> createState() => _CameraAcessState();
}

class _CameraAcessState extends State<CameraAcess> {
  final ImagePicker imagePick = ImagePicker();

  String? imageUrl;

  XFile? imageFile;

  Future<void> getImage() async {
    final XFile? pickedImage =
        await imagePick.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        imageFile = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Camera Access"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  getImage();
                },
                child: Text("Upload Image")),
            SizedBox(
              height: 10,
            ),
            imageFile != null
                ? Container(
                    height: 170,
                    width: 170,
                    child: Image.file(File(imageFile!.path)))
                : Text("No Image")
          ],
        ),
      ),
    );
  }
}
