import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:just_medical_center_automation/model/res/patient/doctorResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config.dart';

class DoctorHelper {

  // get total doctor from backend
  static Future<List<TotalDoctors>> getDoctors() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");
    http.Response? response;
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "x-auth-token":'$token'
    };
    try {
      response = await http.get(Uri.parse('${Config.apiUrl}${Config.totalDoctorurl}'),
          headers: requestHeaders);
    } catch (e) {
      //print('doctors api call error: $e');
    }

    if (response!.statusCode == 200) {
      List<TotalDoctors> doctorList;
      // all time compare response data to model data. If any variable miss make it nullable
       //print(jsonDecode(response.body)); // this is helpful when not find proper error in response data

      // don't use try catch block here
      doctorList = totalDoctorsFromJson(response.body);

      return doctorList;
    }
    else {
      throw Exception('Failed to get doctorList');
    }
  }
}