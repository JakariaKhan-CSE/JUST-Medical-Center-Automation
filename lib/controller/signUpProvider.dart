import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../model/req/auth/signUpModel.dart';
import '../services/helper/authHelper.dart';
import '../view/auth/login_page.dart';
import '../view/auth/otp_verification.dart';

class SignUpNotifier extends ChangeNotifier {
  bool _obsecureText = true;

  bool get obsecureText => _obsecureText;

  set obsecureText(bool newState) {
    _obsecureText = newState;
    notifyListeners(); // for update state
  }

  // password validator check
  bool passwordValidator(String password) {
    if (password.isEmpty) {
      return false;
    }
    String pattern = r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)";

    RegExp regEx = RegExp(pattern); // see details how it work
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
  signUp(SignUpModel model) async {
    // backend theke response na asha porjonto ai circularprogress colte thakbe
    // Show loading dialog
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      // user cancel korte parbe na loading er somoi
      barrierDismissible: false, // Prevents the user from closing the dialog
    );

    AuthHelper.signUp(model).then((response) {
      // backend theke response pele circular progress cancel hoye jabe
      // Dismiss the loading dialog
      Get.back();
      // go to otp verification page
      if (response[0] && response[1]) {
        // this is important and useful see carefully
        // Get.off(() => OtpVerification(email: model.email,),
        //     transition: Transition.fade,
        //     duration: const Duration(seconds: 2)
        // );
        Get.off(() => LoginPage(),
            transition: Transition.fade,
            duration: const Duration(seconds: 2)
        );
      }
      // // go to main page (because when admin add any member not need to login admin)
      else if(response[0])
      {
        Get.off(() => LoginPage(),
            transition: Transition.fade,
            duration: const Duration(seconds: 2)
        );
// nothing happened
        // this is important and useful see carefully
        // Get.off(()=>const LoginPage(),
        //     transition: Transition.fade,
        //     duration:const Duration(seconds: 2)
        // );

      }
      else {
        Get.snackbar(
          "Sign up Failed",
          "Please Check your credentials and try again",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.add_alert),
        );
      }
    }
    );
  }

  // OTP verification Logic
  verifyOTP(String email, String otp) async {
    AuthHelper.verifyOTP(email, otp).then((response) {
      if (response) {
          Get.off(()=>const LoginPage(),
              transition: Transition.fade,
              duration:const Duration(seconds: 2)
          );
      }
      else {
        Get.snackbar(
          "Invalid OTP",
          "Please Check your email and try again",
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: const Icon(Icons.add_alert),
        );
      }
    });
  }
}

