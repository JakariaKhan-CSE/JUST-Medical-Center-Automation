import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/req/auth/loginModel.dart';
import '../model/req/auth/profileUpdateModel.dart';
import '../screen/main_screen.dart';
import '../screen/patient/PersonalDetails.dart';
import '../services/helper/authHelper.dart';


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
    AuthHelper.login(model).then((response){

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

        Get.off(PersonalDetails(role: response[2]));
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