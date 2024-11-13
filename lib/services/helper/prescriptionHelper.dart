import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:just_medical_center_automation/model/res/patient/prescriptionResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config.dart';
class PrescriptionHelper{
  static Future<List<PrescriptionResponse>> getAllPrescription() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");
    http.Response? response;
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "x-auth-token":'$token'
    };
    try {
      response = await http.get(Uri.parse('${Config.apiUrl}${Config.prescriptionurl}'),
          headers: requestHeaders);
    } catch (e) {
      //print('doctors api call error: $e');
    }

    if (response!.statusCode == 200) {
      List<PrescriptionResponse> prescriptionList;
      // all time compare response data to model data. If any variable miss make it nullable
      //print(jsonDecode(response.body)); // this is helpful when not find proper error in response data

      // don't use try catch block here
      prescriptionList = totalPrescriptionFromJson(response.body);

      return prescriptionList;
    }
    else {
      throw Exception('Failed to get prescriptionList');
    }
  }
}