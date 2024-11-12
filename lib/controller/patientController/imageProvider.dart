import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class ImageUploader extends ChangeNotifier {

  var uuid = const Uuid();
  final ImagePicker _picker = ImagePicker();

  String? imageUrl; // URL of the uploaded image on the server
  String? imagePath;

  List<String> imageFil = [];

  Future<String?> uploadImageToServer(File imageFile) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");
    try {
      // after backend deploy fix domain name(web address)
      final request = http.MultipartRequest('POST', Uri.parse('http://localhost:5008/api/user/profile/profile'))
        ..headers['x-auth-token'] = token!
        ..files.add(await http.MultipartFile.fromPath('image', imageFile.path));
      final response = await request.send();
      if (response.statusCode == 200) {
        // Assuming server returns URL in response body
        final responseBody = await response.stream.bytesToString();
        print('Image uploaded: $responseBody');
        return responseBody; // Use response URL
      }
      return null;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  Future<void> deleteImageFromServer() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");
    if (imageUrl == null) return;

    try {
      final response = await http.delete(
        Uri.parse('http://localhost:5008/api/user/profile/profile'),
        headers: {'x-auth-token': '$token'},
      );
      if (response.statusCode == 200) {
        imageUrl = null;
        imagePath = null;
        notifyListeners();
        print('Image deleted successfully');
      }
    } catch (e) {
      print('Error deleting image: $e');
    }
  }
}



