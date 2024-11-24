import 'dart:io';
import 'dart:convert'; // Import to handle JSON decoding
import 'package:cloudinary/cloudinary.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_medical_center_automation/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class ImageUploader extends ChangeNotifier {
  var uuid = const Uuid();
  final ImagePicker _picker = ImagePicker();
  //Configure Cloudinary instance with  Cloud name, API key, and API secret.
  final cloudinary = Cloudinary.signedConfig(
    apiKey: '894817547952752', //  API key
    apiSecret: 'IXf4WXegvNRs9qZKyouQrqz4UEU', //   API secret
    cloudName: 'dmpgw2hy1', //   Cloud name
  );

  String? imageUrl; // URL of the uploaded image on the cloudinary
  String? imagePath;
  String? publicID;
  List<String> imageFil = [];

  // write Future<void> instead void. I get long time error here
  Future<void> pickImageAndUpload() async {
    XFile? imageFile = await _picker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      File file = File(imageFile.path); // Convert XFile to File
      imageFil.add(file.path);
      // Call upload function to store image on the cloudinary
     uploadImageToCloudinary(file);
      imagePath = file.path;
    } else {
      return;
    }
  }

  // image upload to cloudinary
  Future<void> uploadImageToCloudinary(File imageFile) async {
    try {
      final response = await cloudinary.upload(
        file: imageFile.path,
        fileBytes: await imageFile.readAsBytes(),
        resourceType: CloudinaryResourceType.image,
        folder: 'profile', // Optional: Specify a folder in Cloudinary
        progressCallback: (count, total) {
          print('Progress: $count/$total');
        },
      );

      if (response.isSuccessful) {
        String publicId = response.publicId ?? ''; // Get the publicId from the response
        print('Image uploaded successfully with publicId: $publicId');
        print('Image uploaded successfully: ${response.secureUrl}');
        // Save or use the URL as needed
        imageUrl = response.secureUrl;
        publicID = publicId;
        notifyListeners();

      } else {
        print('Failed to upload image: ${response.error}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  // delete image
  Future<void> deleteImageFromCloudinary(String publicId) async {
    try {
      final response = await cloudinary.destroy(
        publicId, // Pass publicId as a positional argument
        resourceType: CloudinaryResourceType.image,
      );
print(response.isSuccessful);
      if (response.isSuccessful) {
        print('Image deleted successfully');
        imageUrl = null;
        publicID = null;
        // imageUrl = '';
        // publicID = '';
        notifyListeners();
      } else {
        print('Failed to delete image: ${response.error}');
      }
    } catch (e) {
      print('Error deleting image: $e');
    }
  }


// update image
//   Future<void> updateImageInCloudinary(File newImageFile, String publicId) async {
//     try {
//       final response = await cloudinary.upload(
//         file: newImageFile.path,
//         fileBytes: await newImageFile.readAsBytes(),
//         resourceType: CloudinaryResourceType.image,
//         publicId: publicId, // Ensure the same public_id to overwrite the image
//       );
//
//       if (response.isSuccessful) {
//         print('Image updated successfully: ${response.secureUrl}');
//       } else {
//         print('Failed to update image: ${response.error}');
//       }
//     } catch (e) {
//       print('Error updating image: $e');
//     }
//   }

  // image upload and delete server
  // Future<void> uploadImageToServer(File imageFile) async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? token = pref.getString("token");
  //   // print('upload image to server call. token is $token');
  //
  //   try {
  //     final request = http.MultipartRequest('POST', Uri.parse('${Config.apiUrl}/api/user/profile/profile'))
  //       ..headers['x-auth-token'] = token!
  //       ..files.add(await http.MultipartFile.fromPath('image', imageFile.path));
  //
  //     final response = await request.send();
  //     if (response.statusCode == 201) {
  //       // Parse the JSON response to extract the image URL
  //       final responseBody = await response.stream.bytesToString();
  //       final decodedResponse = json.decode(responseBody);
  //       if (decodedResponse != null && decodedResponse['user'] != null && decodedResponse['user']['profile'] != null) {
  //         imageUrl = '${Config.apiUrl}/${decodedResponse['user']['profile']}';
  //         print('Image uploaded and URL extracted: $imageUrl');
  //         notifyListeners(); // Update UI
  //       } else {
  //         print('Image upload successful, but URL not found in response');
  //       }
  //     } else {
  //       print('Image upload failed with status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error uploading image: $e');
  //   }
  // }

  // Future<void> deleteImageFromServer() async {
  //
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? token = pref.getString("token");
  //
  //   if (imageUrl == null) return;
  //
  //   try {
  //     final response = await http.delete(
  //       Uri.parse('${Config.apiUrl}/api/user/profile/profile'),
  //       headers: {'x-auth-token': '$token'},
  //     );
  //     print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       imageUrl = null;
  //       imagePath = null;
  //       notifyListeners();
  //       print('Image deleted successfully');
  //     }
  //   } catch (e) {
  //     print('Error deleting image: $e');
  //   }
  // }
}
