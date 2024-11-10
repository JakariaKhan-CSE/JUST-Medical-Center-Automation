import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:just_medical_center_automation/model/req/auth/profileEditModel.dart';
import 'package:just_medical_center_automation/screen/patient/patient_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/res/auth/profile response.dart';
import '../../services/helper/authHelper.dart';
import 'indexChange.dart';

class ProfileNotifier extends ChangeNotifier {
  final editProfileFormKey = GlobalKey<FormState>();

  bool validateFormAndSave() {
    final form = editProfileFormKey.currentState;
    if (form!.validate()) {
      form.save();

      return true;
    } else {
      return false;
    }
  }

  // see carefully. This is used instead of constructor
  ProfileResponse? _userData;
  ProfileResponse? getUserData() {
    return _userData;
  }

  void setUserData(ProfileResponse data) {
    _userData = data;

  }

  Future<ProfileResponse>? profile;
  getProfile() async {
    profile = AuthHelper.getProfile();
  }

  //user profile edit(anytime)
  editProfile(ProfileEditModel model)async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? userId = prefs.getString('userId');
    // print('userId is: $userId');
    AuthHelper.editProfile(model).then((response){
      if(response)
      {
        Get.snackbar("profile update", "Enjoy your search",
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(Icons.add_alert)
        );
        // very useful beauty of getX( Get.context)
        // Update index to navigate to the  ProfilePage after success
        final indexChange = Provider.of<IndexChange>(Get.context!, listen: false);
        indexChange.ChangeIndexValue(2); // `2` for ProfilePage

        Get.back(); // Close the drawer if it's open, and show updated screen
      }
      else {
        Get.snackbar("Updating Failed", "Please try again",
            colorText: Colors.white,
            backgroundColor: Colors.orange,
            icon: const Icon(Icons.add_alert)
        );
      }
    });
  }
}
