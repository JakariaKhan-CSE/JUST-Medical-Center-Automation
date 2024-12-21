import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:just_medical_center_automation/model/res/patient/doctorResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/req/doctor/create_prescription.dart';
import '../../model/res/doctor/AllPatient.dart';
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

  // get total patient from backend
  static Future<List<allPatient>> getAllPatient() async {

    http.Response? response;
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",

    };
    try {
      response = await http.get(Uri.parse('${Config.apiUrl}${Config.allpatienturl}'),
          headers: requestHeaders);
    } catch (e) {
      //print('all patient api call error: $e');
    }

    if (response!.statusCode == 200) {
      List<allPatient> patientList;
      // all time compare response data to model data. If any variable miss make it nullable
      // print(jsonDecode(response.body)); // this is helpful when not find proper error in response data


      patientList = allPatientFromJson(response.body);

      return patientList;
    }
    else {
      throw Exception('Failed to get patientList');
    }
  }
 static Future<bool> createPrescription(CreatePrescriptionRequest request) async {
   final SharedPreferences pref = await SharedPreferences.getInstance();
   String? token = pref.getString("token");
   print(request.toJson());
    final response = await http.post(
      Uri.parse('${Config.apiUrl}${Config.createPrescriptionurl}'),
      headers: {'Content-Type': 'application/json',
        "x-auth-token":'$token'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 201) {
      // Prescription created successfully
      return true;
    } else {
      // Handle failure
      print('Failed to create prescription: ${response.statusCode}');
      return false;
    }
  }


// static Future<allPatient> searchPatient(int ID) async {
  static Future<List<dynamic>> searchPatient(int ID) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");

    http.Response? response;
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "x-auth-token": '$token',
    };

    try {
      response = await http.get(
        Uri.parse('${Config.apiUrl}${Config.searchPatientUrl}?query=$ID'),
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
          return [true,allPatient.fromJson(responseData.first)];
        } else if (responseData is Map<String, dynamic>) {
          return [true,allPatient.fromJson(responseData)];
        } else {
          return [false];
         // throw Exception('Unexpected response format');
        }
      } catch (e) {
        return [false];
        //throw Exception('Error parsing patient data: $e');
      }
    } else {
      throw Exception('Failed to search patient: ${response.statusCode}');
    }
  }


}