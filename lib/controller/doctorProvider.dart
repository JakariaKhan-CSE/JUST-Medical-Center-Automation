import 'package:flutter/cupertino.dart';
import 'package:just_medical_center_automation/model/res/patient/doctorResponse.dart';
import 'package:just_medical_center_automation/services/helper/doctorHelper.dart';

class DoctorNotifier extends ChangeNotifier{
  List<TotalDoctors> _doctorList = [];
  bool _isLoaded = false; // To ensure data is only fetched once

  List<TotalDoctors> get doctorList => _doctorList;

  Future<void> getAllDoctorList() async {
    if (_isLoaded) return; // Prevent re-fetching
    try {
      _doctorList =await DoctorHelper.getDoctors(); // be careful to use await otherwise get error
      _isLoaded = true; // Mark data as loaded
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching prescriptions: $e');
    }
  }

}