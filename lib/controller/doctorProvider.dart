import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';
import 'package:just_medical_center_automation/model/res/doctor/AllPatient.dart';
import 'package:just_medical_center_automation/model/res/patient/doctorResponse.dart';
import 'package:just_medical_center_automation/services/helper/doctorHelper.dart';
import 'package:provider/provider.dart';

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

  // get all patient
  List<allPatient> _patientList = [];
  bool _isLoadedPatient = false; // To ensure data is only fetched once

  List<allPatient> get patientList => _patientList;

  Future<void> getAllPatientList() async {
    if (_isLoadedPatient) return; // Prevent re-fetching
    try {
      _patientList =await DoctorHelper.getAllPatient(); // be careful to use await otherwise get error
      _isLoadedPatient = true; // Mark data as loaded
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching patient: $e');
    }
  }


  // search patient
  allPatient? _patient;
  allPatient? get patient => _patient;  // get patient data here

  Future<void> searchPatient(int ID, BuildContext context) async {
final _doctorController = Provider.of<DoctorController>(context,listen: false);
    // try {
    //
    //   //_patient =await DoctorHelper.searchPatient(ID); // be careful to use await otherwise get error
    //   // if(_patient==null)
    //   //   Get.snackbar("No Patient Found","Please search by valid patient ID",
    //   //       backgroundColor: Colors.deepOrange);
    //  // go to search patient show screen
    //   _doctorController.SetIndex(11);
    //
    // } catch (e) {
    //   debugPrint('Error fetching patient: $e');
    // }
    DoctorHelper.searchPatient(ID).then((response){
      if(!response[0])
        {
          Get.snackbar("No Patient Found", "Please search by valid patient ID",
              colorText: Colors.white,
              backgroundColor: Colors.deepOrange,
              icon: const Icon(Icons.add_alert)
          );
        }
      else if(response[0])
        {
          _patient = response[1];
          //go to search patient show screen
            _doctorController.SetIndex(11);
        }
    });
  }

}