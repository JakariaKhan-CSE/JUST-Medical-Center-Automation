import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ImageUploader extends ChangeNotifier {
  var uuid = const Uuid();
  final ImagePicker _picker = ImagePicker();

  String? imageUrl;
  String? imagePath;

  List<String> imageFil = [];

  void pickImage() async {
    XFile? imageFile = await _picker.pickImage(source: ImageSource.gallery);



    if (imageFile != null) {
      imageFil.add(imageFile.path);
      // ai function upload function ke call korbe image store korar jonno
      imageUpload(imageFile);
      imagePath = imageFile.path;
    } else {
      return;
    }
  }


  // ai function firebase stroage a picture store korbe
  Future<String?> imageUpload(XFile upload) async {
    File image = File(upload.path);

// before use firebase storage make sure to create storage in firebase console
    final ref = FirebaseStorage.instance
        .ref()
        .child('users').child('patients')
        .child('${uuid.v1()}.jpg');
    // image ke store kora hosse
    await ref.putFile(image);

    imageUrl = (await ref.getDownloadURL());
    print(imageUrl);

    return imageUrl;
  }
}