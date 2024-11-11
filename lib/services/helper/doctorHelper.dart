import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:just_medical_center_automation/model/res/patient/doctorResponse.dart';

import '../config.dart';

class DoctorHelper {
// Get Job
// Onek gulo job thakbe tai akta List er vitor e job job return kora hosse
  static Future<List<DoctorResponse>> getDoctors() async {
    http.Response? response;
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
    };
    try {
      response = await http.get(Uri.parse('${Config.apiUrl}${Config.totalDoctorurl}'),
          headers: requestHeaders);
    } catch (e) {
      //print('doctors api call error: $e');
    }

    if (response!.statusCode == 200) {
      List<DoctorResponse> doctorList;
      // all time compare response data to model data. If any variable miss make it nullable
      // print(jsonDecode(response.body)); // this is helpful when not find proper error in response data

      // don't use try catch block here
      doctorList = DoctorResponse.fromJson(jsonDecode(response.body));

      return doctorList;
    }
    else {
      throw Exception('Failed to get JobsList');
    }
  }
}