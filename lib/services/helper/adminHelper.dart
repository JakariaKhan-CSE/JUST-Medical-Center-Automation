import 'dart:convert';

import 'package:just_medical_center_automation/model/req/admin/add_doctor_res.dart';
import 'package:just_medical_center_automation/model/req/admin/add_pharmacist_req.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../model/res/admin/every_role_response.dart';
import '../config.dart';

class AdminHelper {
  static Future<List<dynamic>> searchEveryRole(int ID) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");

    http.Response? response;
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "x-auth-token": '$token',
    };

    try {
      response = await http.get(
        Uri.parse('${Config.apiUrl}${Config.searchAnyUsertUrl}?query=$ID'),
        headers: requestHeaders,
      );
    } catch (e) {
      throw Exception('Network error occurred: $e');
    }

    if (response.statusCode == 200) {
      /*
       [{_id: 6742c7cf0a175aac7a682aff, name: Md. Jakaria Ibna Azam Khan, gender: male, role: patient, email: mdjakariaibnaazamkhan@gmail.com, password: 123456, profile: https://res.cloudinary.com/dmpgw2hy1/image/upload/v1732429967/profile/pndffjfrd7cwm19iwwzk.jpg, isVerified: true, isUpdateProfile: true, createdAt: 2024-11-24T06:29:35.913Z, updatedAt: 2024-12-12T16:52:39.127Z, __v: 0, ID: 190152, age: 25, phone: 01612882257}]
       {
       'data': value
       }
       return not JSon type. Get Map List
       */
      // See Carefully this is very useful and important
      try {
        final responseData = jsonDecode(response.body);
// list kina check kora hosse
        if (responseData is List) {
          // Assuming the first item is the desired patient
          return [
            true,
            EveryRoleRes.fromJson(responseData.first)
          ]; // response data ta list tai tar first ta nissi
        } else if (responseData is Map<String, dynamic>) {
          return [
            true,
            EveryRoleRes.fromJson(responseData)
          ]; // response jodi list na hoye map hoi tahole aita nissi
        } else {
          return [false];
          // throw Exception('Unexpected response format');
        }
      } catch (e) {
        return [false];
        //throw Exception('Error parsing patient data: $e');
      }
    } else {
      throw Exception('Failed to search every role: ${response.statusCode}');
    }
  }

  // Add Doctor
  static Future<bool> AddDoctorHelper(AddDoctorReq model) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    print(model.toJson());
    String? token = pref.getString("token");
    http.Response? response;
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "x-auth-token": '$token'
    };
    try {
      response = await http.post(
          Uri.parse('${Config.apiUrl}${Config.addRole}'),

          body: jsonEncode(model.toJson()),
          headers: requestHeaders);
    } catch (e) {
      print('add user based on role api call error: $e');
    }
// print(response?.statusCode);
//     print(jsonDecode(response?.body??''));
    if (response?.statusCode == 201) {
      return true;
    }

    else {
      return false;
    }
  }

  // Add Pharmacist
  static Future<bool> AddPharmacistHelper(AddPharmaReq model) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    print(model.toJson());
    String? token = pref.getString("token");
    http.Response? response;
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "x-auth-token": '$token'
    };
    try {
      response = await http.post(
          Uri.parse('${Config.apiUrl}${Config.addRole}'),

          body: jsonEncode(model.toJson()),
          headers: requestHeaders);
    } catch (e) {
      print('add user based on role api call error: $e');
    }
// print(response?.statusCode);
//     print(jsonDecode(response?.body??''));
    if (response?.statusCode == 201) {
      return true;
    }

    else {
      return false;
    }
  }

  static Future<List<EveryRoleRes>> getAllDoctor() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");

    http.Response? response;
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "x-auth-token": '$token',
    };

    try {
      response = await http.get(
        Uri.parse('${Config.apiUrl}${Config.getAllDoctor}'),
        headers: requestHeaders,
      );
    } catch (e) {
      throw Exception('Network error occurred: $e');
    }

    if (response.statusCode == 200) {
     // List<EveryRoleRes> allDoctor;
      // Decode the response body
      final decodedResponse = jsonDecode(response.body);
// print(decodedResponse);
      //allDoctor = EveryRoleRes.fromJson(jsonDecode(response.body));
      List<EveryRoleRes> alldoctor = List<EveryRoleRes>.from(
          decodedResponse.map((x) => EveryRoleRes.fromJson(x)));

      return alldoctor;
    } else {
      throw Exception('Failed to search every role: ${response.statusCode}');

    }
  }

}
