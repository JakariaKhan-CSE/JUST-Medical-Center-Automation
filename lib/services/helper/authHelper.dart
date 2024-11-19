import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:just_medical_center_automation/model/req/auth/profileEditModel.dart';
import 'package:just_medical_center_automation/model/res/auth/login%20response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/req/auth/loginModel.dart';
import '../../model/req/auth/profileUpdateModel.dart';
import '../../model/req/auth/signUpModel.dart';
import '../../model/res/auth/profile response.dart';
import '../config.dart';

class AuthHelper {
  //static var client = //https.Client();

  // login function
  static Future<List<dynamic>> login(LoginModel model) async {
    http.Response? response;
    Map<String, String> requestHeaders = {"Content-Type": "application/json"};
    try {
      response = await http.post(
          Uri.parse('${Config.apiUrl}${Config.loginUrl}'),
          body: model
              .toJson(), // body ta jsonEncode kora hosse toJson() call kore
          headers: requestHeaders);
    } catch (e) {
      print('login api call error: $e');
    }

    if (response!.statusCode == 200) {
      final SharedPreferences pref = await SharedPreferences.getInstance();
// print('res body is: ${response.body}');

//jsonDecode na korle aitar map value gulo access kora jai na
      //Converts the JSON string into a Dart map
      // var responseBody = jsonDecode(response.body);
// print(responseBody); // see the response then go to website json to dart converter to make login response model
      LoginResponse loginResponse =
          LoginResponse.fromJson(jsonDecode(response.body));
      String? token = loginResponse.token;
      String? userId = loginResponse.others?.sId;
      String? profile = loginResponse.others?.profile;
      bool? isUpdateProfile = loginResponse.others?.isUpdateProfile;
      String? role = loginResponse.role;

      await pref.setString('token', token!);
      await pref.setString('userId', userId!);
      await pref.setString('profile', profile!);
      await pref.setBool(
          'loggedIn', true); // bar bar login screen show korbena aitar karone
      await pref.setString('role', role!);

      return [true, isUpdateProfile ?? false, role];
    } else {
      return [false];
    }
  }

// SignUp function
  static Future<List<bool>> signUp(SignUpModel model) async {
    http.Response? response;
    Map<String, String> requestHeaders = {"Content-Type": "application/json"};
    try {
      response = await http.post(
          Uri.parse('${Config.apiUrl}${Config.signUpUrl}'),
          // body:  model.toJson() //// model er json ke call korsi aita automatically jsonEncode kore dibe json file ke
          body: model.toJson(),
          headers: requestHeaders);
    } catch (e) {
      //print('login api call error: $e');
    }
// go to OTP verification page
    if (response!.statusCode == 201) {
      return [true, true];
    } else if (response.statusCode == 202) {
      return [true];
    } else {
      return [false];
    }
  }

  // verify otp function
  static Future<bool> verifyOTP(String email, String otp) async {
    http.Response? response;
    Map<String, String> requestHeaders = {"Content-Type": "application/json"};
    try {
      response = await http.post(
          Uri.parse('${Config.apiUrl}${Config.emailVerifyUrl}'),
          // body:  model.toJson() //// model er json ke call korsi aita automatically jsonEncode kore dibe json file ke
          body: jsonEncode({"email": email, 'otp': otp}),
          headers: requestHeaders);
    } catch (e) {
      print('verifyOTP api call error: $e');
    }
// go to OTP verification page
    if (response!.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

// update profile (personalInformation user)
  static Future<bool> updateProfile(ProfileUpdateModel model) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");
    http.Response? response;

    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "x-auth-token":
          '$token' // this is x-auth-token same as backend req.header("x-auth-token");
    };
    try {
      response = await http.put(
          Uri.parse('${Config.apiUrl}${Config.profileurl}'),
          body: model
              .toJson(), // body ta jsonEncode kora hosse toJson() call kore
          headers: requestHeaders);
    } catch (e) {
      print('update profile api call error: $e');
    }

    if (response!.statusCode == 200) {
      //print('response coed is: ${response.statusCode}');
      return true;
    } else {
      //print('response code is: ${response.statusCode}');
      return false;
    }
  }

  // edit user profile (anytime)
  static Future<bool> editProfile(ProfileEditModel model) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");
    http.Response? response;

    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "x-auth-token":
          '$token' // this is x-auth-token same as backend req.header("x-auth-token");
    };
    try {
      response = await http.put(
          Uri.parse('${Config.apiUrl}${Config.profileurl}'),
          body: model
              .toJson(), // body ta jsonEncode kora hosse toJson() call kore
          headers: requestHeaders);
    } catch (e) {
      print('edit profile api call error: $e');
    }

    if (response!.statusCode == 200) {
      //print('response code is: ${response.statusCode}');
      return true;
    } else {
      //print('response code is: ${response.statusCode}');
      return false;
    }
  }

// Get Profile
  static Future<ProfileResponse> getProfile() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");
    // String? userId = pref.getString('userId');

    http.Response? response;
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "x-auth-token":
          '$token' // this is x-auth-token same as backend req.header("x-auth-token");
    };
    try {
      response = await http.get(
          Uri.parse('${Config.apiUrl}${Config.profileurl}'),
          headers: requestHeaders);
    } catch (e) {
      //print('update profile api call error: $e');
    }

    if (response!.statusCode == 200) {
      //  var data = jsonDecode(response.body);
      // print(data);

      ProfileResponse profile;

      profile = ProfileResponse.fromJson(jsonDecode(response.body));

      return profile;
    } else {
      throw Exception('Failed to get profile');
    }
  }

  // change password
  static Future<bool> changePassword(String current, String newPass) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");
    http.Response? response;

    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "x-auth-token":
          '$token' // this is x-auth-token same as backend req.header("x-auth-token");
    };
    try {
      response = await http.put(
          Uri.parse('${Config.apiUrl}${Config.changePasswordurl}'),
          body: jsonEncode({
            'currentPassword': current,
            'newPassword': newPass
          }), // body ta jsonEncode kora hosse toJson() call kore
          headers: requestHeaders);
    } catch (e) {
      print('change password api call error: $e');
    }

    if (response!.statusCode == 200) {
      //print('response coed is: ${response.statusCode}');
      return true;
    } else {
      //print('response code is: ${response.statusCode}');
      return false;
    }
  }
}
