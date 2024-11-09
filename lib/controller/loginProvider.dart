import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginNotifier extends ChangeNotifier{
  final profileFormKey = GlobalKey<FormState>();

  // first time signup/registration korle update profile page a niye jabe and firsttime = false kore dibe jokhon signup button a click kora hobe
  bool _firstTime = true;
  bool get firstTime=> _firstTime;
  set firstTime(bool newState)
  {
    _firstTime = newState;
    notifyListeners();
  }


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

  // userLogin(LoginModel model)
  // {
  //   AuthHelper.login(model).then((response){
  //     // user resgistration korle first time take update profile page niye jawa hobe
  //     if(response && firstTime)
  //     {
  //
  //       Get.off(const PersonalDetails());
  //     }
  //     // first time na hole mainscreen a cole jabe
  //     else if(response && !firstTime)
  //     {
  //       Get.off(const MainScreen());
  //     }
  //     else if(!response){
  //       Get.snackbar("SignIn Failed", "Please check your credentials",
  //           colorText: Colors.white,
  //           backgroundColor: Colors.red,
  //           icon: const Icon(Icons.add_alert)
  //       );
  //     }
  //   });
  // }

  //user profile update
  // updateProfile(ProfileUpdateModel model)async
  // {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userId = prefs.getString('userId');
  //   // print('userId is: $userId');
  //   AuthHelper.updateProfile(model,userId??"").then((response){
  //     // user resgistration korle first time take update profile page niye jawa hobe
  //     if(response)
  //     {
  //       Get.snackbar("profile update", "Enjoy your search",
  //           colorText: Colors.white,
  //           backgroundColor: Colors.blue,
  //           icon: const Icon(Icons.add_alert)
  //       );
  //       // 3 second delay kore mainscreen a niye jabe
  //       Future.delayed(const Duration(seconds: 3)).then((value){
  //         // Get.offAll deya hoese jeno r back na hoi
  //         Get.offAll(const MainScreen());
  //       });
  //     }
  //     else {
  //       Get.snackbar("Updating Failed", "Please try again",
  //           colorText: Colors.white,
  //           backgroundColor: Colors.orange,
  //           icon: const Icon(Icons.add_alert)
  //       );
  //     }
  //   });
  // }

  // logout hole cache memory theke token remove hoye jabe
  // logout()async{
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('token');
  //   await prefs.remove("userId");
  //   await prefs.remove("profile");
  //   await prefs.setBool('loggedIn', false);
  //
  //   // akbar logout korar por jokhon abar login korbe tokhon jeno update profile a niye na jai ai jonno first time false kora hosse
  //   _firstTime = false;
  // }
}