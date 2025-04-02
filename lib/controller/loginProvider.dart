import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_medical_center_automation/controller/patientController/indexChange.dart';
import 'package:just_medical_center_automation/model/req/doctor/doctorProfileUpdateModel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/req/auth/loginModel.dart';
import '../model/req/auth/profileUpdateModel.dart';
import '../services/helper/authHelper.dart';
import '../view/doctor/firsttimeupdateprofile_page.dart';
import '../view/main_screen.dart';
import '../view/patient/PersonalDetails.dart';


class LoginNotifier extends ChangeNotifier{
  final profileFormKey = GlobalKey<FormState>();

  bool _obsecureText = true;

  bool get obsecureText => _obsecureText;

  set obsecureText(bool newState) {
    _obsecureText = newState;
    notifyListeners();  // for update state
  }

  bool? _loggedIn;

  bool get loggedIn => _loggedIn??false; // null thake false return korbe

  set loggedIn(bool newState) {
    _loggedIn = newState;
    notifyListeners();  // for update state
  }

  getPrefs()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    loggedIn = prefs.getBool('loggedIn')??false;
    //entrypoint = prefs.getBool('entrypoint')??false;
  }


  bool profileValidation(){
    final form = profileFormKey.currentState;
    if(form != null && form.validate())
    {
      form.save();
      return true;
    }
    else
    {
      return false;
    }
  }
  final loginFormKey = GlobalKey<FormState>();
  bool validateAndSave()
  {

    final form = loginFormKey.currentState;

    if(form != null && form.validate())
    {
      form.save();
      return true;
    }
    else{
      return false;
    }
  }

  userLogin(LoginModel model)
  {
    // backend theke response na asha porjonto ai circularprogress colte thakbe
    // Show loading dialog
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      // user cancel korte parbe na loading er somoi
      barrierDismissible: false, // Prevents the user from closing the dialog
    );
    AuthHelper.login(model).then((response){
      // backend theke response pele circular progress cancel hoye jabe
      // Dismiss the loading dialog
      Get.back();
      // incorrect passowrd or email not verified show this error
      if(!response[0])
      {
        Get.snackbar("SignIn Failed", "Please check your credentials",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.add_alert)
        );
      }
      // user er profile information update na thakle personal details page a niye jabe
      else if(response[0] & !response[1])
      {
        if(response[2].toString().toLowerCase() == 'patient')
        Get.off(PersonalDetails(role: response[2]));
        // doctor er profile information update na thakle personal details page a niye jabe
        if(response[2].toString().toLowerCase() == 'doctor')
          Get.off(FirstTimeUpdateProfilePage(role: response[2]));
        if(response[2].toString().toLowerCase() == 'admin')
          Get.off(MainScreen(role: response[2]));
      }

      // first time na hole mainscreen a cole jabe
      else if(response[0] && response[1])
      {
        Get.off(MainScreen(role: response[2],));
      }
      else{
        Get.snackbar("SignIn Failed", "Please check your credentials",
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.add_alert)
        );
      }
    }
    );
  }

  //user profile update (first time login)
  updateProfile(ProfileUpdateModel model)async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? userId = prefs.getString('userId');
    // print('userId is: $userId');
    AuthHelper.updateProfile(model).then((response){
      // user resgistration korle first time take update profile page niye jawa hobe
      if(response)
      {
        Get.snackbar("profile update", "Enjoy your search",
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(Icons.add_alert)
        );
        // 3 second delay kore mainscreen a niye jabe
        Future.delayed(const Duration(seconds: 1)).then((value){
          // Get.offAll deya hoese jeno r back na hoi
          Get.offAll( MainScreen(role: model.role,));
        });
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

  //doctor profile update (first time login)
  updateDoctorProfile(DoctorProfileUpdateModel model)async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? userId = prefs.getString('userId');
    // print('userId is: $userId');
    AuthHelper.updateDoctorProfile(model).then((response){
      // user resgistration korle first time take update profile page niye jawa hobe
      if(response)
      {
        Get.snackbar("profile update", "Enjoy your search",
            colorText: Colors.white,
            backgroundColor: Colors.blue,
            icon: const Icon(Icons.add_alert)
        );
        // 3 second delay kore mainscreen a niye jabe
        Future.delayed(const Duration(seconds: 1)).then((value){
          // Get.offAll deya hoese jeno r back na hoi
          Get.offAll( MainScreen(role: model.role!,));
        });
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

  //user password change
  changePassword(BuildContext context,String current, String newPass)async
  {
    /*
    Provider Usage: Get.context! may not always provide the correct context for Provider.of. It's safer to pass the context directly as a parameter to the changePassword function to ensure the correct widget context is used.
     */
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? userId = prefs.getString('userId');
    // print('userId is: $userId');
    AuthHelper.changePassword(current,newPass).then((response){
      // user resgistration korle first time take update profile page niye jawa hobe
      if(response)
      {
        /*
        Icon: Used Icons.check_circle to better indicate a successful action.
Additional Options:
snackPosition: Set to SnackPosition.BOTTOM to show the snackbar at the bottom.
duration: Optional parameter to control how long the snackbar is displayed.
         */
        Get.snackbar(
          "Password Changed",
          "Your password has been updated successfully.",
          colorText: Colors.white,
          backgroundColor: Colors.blue,
          icon: const Icon(Icons.check_circle, color: Colors.white),
         // snackPosition: SnackPosition.BOTTOM,  // Optional: position at the bottom of the screen
          duration: const Duration(seconds: 2),  // Optional: duration to show the snackbar
        );

      }
      else {
        Get.snackbar("Password Change Failed", "Please try again",
            colorText: Colors.white,
            backgroundColor: Colors.orange,
            icon: const Icon(Icons.add_alert)
        );
      }
    }
    );
  }

  // logout hole cache memory theke token remove hoye jabe
  logout()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove("userId");
    await prefs.remove("profile");
    await prefs.setBool('loggedIn', false);
    await prefs.remove('role');

  }
}