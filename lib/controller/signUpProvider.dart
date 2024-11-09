import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpNotifier extends ChangeNotifier{
  bool _obsecureText = true;

  bool get obsecureText => _obsecureText;

  set obsecureText(bool newState) {
    _obsecureText = newState;
    notifyListeners();  // for update state
  }

  // password validator check
  bool passwordValidator(String password){
    if(password.isEmpty) {
      return false;
    }
    String pattern = r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)";

    RegExp regEx = RegExp(pattern);  // see details how it work
    return regEx.hasMatch(password);
  }

// check form is valid or not (not empty field ensure)
  final registerFormKey = GlobalKey<FormState>();
  bool validateFormAndSave() {
    final form = registerFormKey.currentState;

    if (form!.validate()) {
      form.save();

      return true;
    } else {

      return false;
    }
  }

  // signUp logic
  // signUp(SignUpModel model)async{
  //   AuthHelper.signUp(model).then((response){
  //     if(response)
  //     {
  //
  //       // this is important and useful see carefully
  //       Get.off(()=>const LoginPage(),
  //           transition: Transition.fade,
  //           duration:const Duration(seconds: 2)
  //       );
  //
  //     }else
  //     {
  //
  //       Get.snackbar(
  //         "Sign up Failed",
  //         "Please Check your credentials and try again",
  //         colorText: Colors.white,
  //         backgroundColor: Colors.red,
  //         icon: const Icon(Icons.add_alert),
  //       );
  //     }
  //   });
  // }

}