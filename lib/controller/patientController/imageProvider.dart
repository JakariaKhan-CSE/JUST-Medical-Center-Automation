import 'dart:io';
import 'dart:convert'; // Import to handle JSON decoding
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_medical_center_automation/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class ImageUploader extends ChangeNotifier {
  var uuid = const Uuid();
  final ImagePicker _picker = ImagePicker();

  String? imageUrl; // URL of the uploaded image on the server
  String? imagePath;
  List<String> imageFil = [];

  // write Future<void> instead void. I get long time error here
  Future<void> pickImageAndUpload() async {
    XFile? imageFile = await _picker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      File file = File(imageFile.path); // Convert XFile to File
      imageFil.add(file.path);
      // Call upload function to store image on the server
      uploadImageToServer(file);
      imagePath = file.path;
    } else {
      return;
    }
  }

  Future<void> uploadImageToServer(File imageFile) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");
    // print('upload image to server call. token is $token');

    try {
      final request = http.MultipartRequest('POST', Uri.parse('${Config.apiUrl}/api/user/profile/profile'))
        ..headers['x-auth-token'] = token!
        ..files.add(await http.MultipartFile.fromPath('image', imageFile.path));

      final response = await request.send();
      if (response.statusCode == 201) {
        // Parse the JSON response to extract the image URL
        final responseBody = await response.stream.bytesToString();
        final decodedResponse = json.decode(responseBody);
        if (decodedResponse != null && decodedResponse['user'] != null && decodedResponse['user']['profile'] != null) {
          imageUrl = '${Config.apiUrl}/${decodedResponse['user']['profile']}';
          print('Image uploaded and URL extracted: $imageUrl');
          notifyListeners(); // Update UI
        } else {
          print('Image upload successful, but URL not found in response');
        }
      } else {
        print('Image upload failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<void> deleteImageFromServer() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");
    if (imageUrl == null) return;

    try {
      final response = await http.delete(
        Uri.parse('${Config.apiUrl}/api/user/profile/profile'),
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
