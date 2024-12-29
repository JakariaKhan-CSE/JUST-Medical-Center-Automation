import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ImageUploaderDoctor extends ChangeNotifier{
  var uuid = const Uuid();
  final ImagePicker _picker = ImagePicker();
  //Configure Cloudinary instance with  Cloud name, API key, and API secret.
  final cloudinary = Cloudinary.signedConfig(
    apiKey: '894817547952752', //  API key
    apiSecret: 'IXf4WXegvNRs9qZKyouQrqz4UEU', //   API secret
    cloudName: 'dmpgw2hy1', //   Cloud name
  );

  String? profileImageUrl; // URL of the uploaded image on the cloudinary
  String? SignatureImageUrl; // URL of the uploaded image on the cloudinary
  String? profileImagePath;
  String? signatureImagePath;
  String? profilePublicID;
  String? signaturePublicID;

  // write Future<void> instead void. I get long time error here
  Future<void> pickProfileImageAndUpload() async {
    XFile? imageFile = await _picker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      File file = File(imageFile.path); // Convert XFile to File
      // imageFil.add(file.path);
      // Call upload function to store image on the cloudinary
      uploadProfileImageToCloudinary(file);
      profileImagePath = file.path;
    } else {
      return;
    }
  }

  // image upload to cloudinary
  Future<void> uploadProfileImageToCloudinary(File imageFile) async {
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
        profileImageUrl = response.secureUrl;
        profilePublicID = publicId;
        notifyListeners();

      } else {
        print('Failed to upload image: ${response.error}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  // delete image
  Future<void> deleteProfileImageFromCloudinary(String publicId) async {
    try {
      profileImageUrl = null;
      profilePublicID = null;
      // imageUrl = '';
      // publicID = '';
      notifyListeners();
      final response = await cloudinary.destroy(
        publicId, // Pass publicId as a positional argument
        resourceType: CloudinaryResourceType.image,
      );

      print(response.isSuccessful);
      if (response.isSuccessful) {
        print('Image deleted successfully');
        // profileImageUrl = null;
        // profilePublicID = null;
        // // imageUrl = '';
        // // publicID = '';
        // notifyListeners();
      } else {
        print('Failed to delete image: ${response.error}');
      }
    } catch (e) {
      print('Error deleting image: $e');
    }
  }


  // for signature picture
  Future<void> pickSignatureImageAndUpload() async {
    XFile? imageFile = await _picker.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      File file = File(imageFile.path); // Convert XFile to File

      // Call upload function to store image on the cloudinary
      uploadSignatureImageToCloudinary(file);
      signatureImagePath = file.path;
    } else {
      return;
    }
  }

  // signature image upload to cloudinary
  Future<void> uploadSignatureImageToCloudinary(File imageFile) async {
    try {
      final response = await cloudinary.upload(
        file: imageFile.path,
        fileBytes: await imageFile.readAsBytes(),
        resourceType: CloudinaryResourceType.image,
        folder: 'signature', // Optional: Specify a folder in Cloudinary
        progressCallback: (count, total) {
          print('Progress: $count/$total');
        },
      );

      if (response.isSuccessful) {
        String publicId = response.publicId ?? ''; // Get the publicId from the response
        print('Image uploaded successfully with publicId: $publicId');
        print('Image uploaded successfully: ${response.secureUrl}');
        // Save or use the URL as needed
        SignatureImageUrl = response.secureUrl;
        signaturePublicID = publicId;
        notifyListeners();

      } else {
        print('Failed to upload image: ${response.error}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  // delete signature image
  Future<void> deleteSignatureImageFromCloudinary(String publicId) async {
    try {
      SignatureImageUrl = null;
      signaturePublicID = null;
      // imageUrl = '';
      // publicID = '';
      notifyListeners();
      final response = await cloudinary.destroy(
        publicId, // Pass publicId as a positional argument
        resourceType: CloudinaryResourceType.image,
      );

      print(response.isSuccessful);
      if (response.isSuccessful) {
        print('Image deleted successfully');
        // SignatureImageUrl = null;
        // signaturePublicID = null;
        // // imageUrl = '';
        // // publicID = '';
        // notifyListeners();
      } else {
        print('Failed to delete image: ${response.error}');
      }
    } catch (e) {
      print('Error deleting image: $e');
    }
  }

  // remove profile and signature picture locally(i mean, link)
Future<void> deleteProfileImageLink()async{
    print('call to delete profile link');
    profileImageUrl = null;
    profilePublicID = null;
    notifyListeners();
}
  Future<void> deleteSignatureImageLink()async{
    print('call to delete signature link');
    SignatureImageUrl = null;
    signaturePublicID = null;
    notifyListeners();
  }

}