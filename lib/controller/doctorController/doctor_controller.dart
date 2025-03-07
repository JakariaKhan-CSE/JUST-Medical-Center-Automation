// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart'; // this is very dangerous when come it program not work


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_medical_center_automation/model/res/doctor/AllPatient.dart';
import 'package:just_medical_center_automation/services/helper/doctorHelper.dart';

import '../../data/diagnosticTestData.dart';
import '../../data/patientData.dart';
import '../../model/req/doctor/create_prescription.dart';
import '../../model/res/common/PatientPrescriptionHistory.dart';

class DoctorController extends ChangeNotifier{
  int current_index = 0;
  bool _oldPasswordSecure = true;
  bool _newPasswordSecure = true;
  bool _confirmPasswordSecure = true;

  DiagonasticData? _labTestInfo;
// for patient info
//   Patient? _patient;
// Patient? get patient => _patient;
// void setPatientData(Patient data)
// {
//   _patient = data;
//   notifyListeners();
// }

  AllPatient? _patient;
  AllPatient? get patient => _patient;
  void setPatientData(AllPatient data){
    _patient = data;
    notifyListeners();
  }

// for labTestReport info
  DiagonasticData? get diagonasticData => _labTestInfo;
  void setDiagonasticData(DiagonasticData data)
  {
    _labTestInfo = data;
    notifyListeners();
  }

  bool get oldPasswordSecure => _oldPasswordSecure;
  void  setOldPasswordSecure(){
    _oldPasswordSecure = !_oldPasswordSecure;
    notifyListeners();
  }
  bool get newPasswordSecure => _newPasswordSecure;
  void  setNewPasswordSecure(){
    _newPasswordSecure = !_newPasswordSecure;
    notifyListeners();
  }
  bool get confirmPasswordSecure => _confirmPasswordSecure;
  void  setConfirmPasswordSecure(){
    _confirmPasswordSecure = !_confirmPasswordSecure;
    notifyListeners();
  }

  void SetIndex(index)
  {
    current_index = index;
    notifyListeners();
  }
  List<TextEditingController> textEditingControllerList = [TextEditingController()];
  List<TextEditingController> daysTextEditingControllerList = [TextEditingController()];
  //new TextEditingController with field generate
void generateTextEditingController()
{
  textEditingControllerList.add(TextEditingController());
  daysTextEditingControllerList.add(TextEditingController());

notifyListeners();
}
// remove textField
void removeTextField(int index){
  //medicine name textfield
  textEditingControllerList[index].clear();
  textEditingControllerList[index].dispose();
  textEditingControllerList.removeAt(index);
  // how many days use medicine day
  daysTextEditingControllerList[index].clear();
  daysTextEditingControllerList[index].dispose();
  daysTextEditingControllerList.removeAt(index);
  //medicine rule checkbox delete
  morningList.removeAt(index);
  afternoonList.removeAt(index);
  nightList.removeAt(index);
  // medicine use before or after meal
  beforeList.removeAt(index);
  notifyListeners();

}

void removeAllTextField(){
  // for remove entire list
  textEditingControllerList.clear();
  daysTextEditingControllerList.clear();
  // for single one created for doctor easier to read
  textEditingControllerList.add(TextEditingController());
  daysTextEditingControllerList.add(TextEditingController());
  // medicine rule
  morningList.clear();
  afternoonList.clear();
  nightList.clear();
  // when use medicine before or after meal
  beforeList.clear();
  // for single one created for doctor easier to read
  morningList.add(true);
  afternoonList.add(false);
  nightList.add(true);
  beforeList.add(false);
  notifyListeners();
}
// medicine use rule
  List<bool> morningList = [true];
  List<bool> afternoonList = [false];
  List<bool> nightList = [false];

// when use medicine before or after meal
  List<bool> beforeList = [false];
  // medicine use rule generate
  void generateCheckBoxRule()
  {
    morningList.add(true);
    afternoonList.add(false);
    nightList.add(true);
    notifyListeners();
  }
// when use medicine before or after meal generate
  void generateCheckBoxMeal()
  {
    beforeList.add(false);
    notifyListeners();
  }

  // generate prescription
  Future<void> generatePrescription(BuildContext context) async {
    List<Medicine> medicinesList = [];

    for (int i = 0; i < textEditingControllerList.length; i++) {
      String medicineName = textEditingControllerList[i].text;
      int quantity = int.tryParse(daysTextEditingControllerList[i].text) ?? 0;

      if (medicineName.isNotEmpty && quantity > 0) {
        medicinesList.add(Medicine(
          name: medicineName,
          quantity: quantity,
          morning: morningList[i],
          lunch: afternoonList[i],
          dinner: nightList[i],
          beforeMeal: beforeList[i],
        ));
      }
    }

    if (medicinesList.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please add valid medicines')),
      );
      return;
    }

    final prescriptionRequest = CreatePrescriptionRequest(
      medicines: medicinesList,
      patientId: patient?.sId ?? "",
     // patientId: "12345", // Replace with the actual patient ID
    );

    bool success = await DoctorHelper.createPrescription(prescriptionRequest);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Prescription created successfully')),
      );
      // Navigate to the dashboard
          SetIndex(0);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to create prescription')),
      );
    }
  }

  // patient history
  Future<List<Prescriptions>>? patientHistory;
  getPatientHistory()async{
    patientHistory = DoctorHelper.patientHistory(patient!.sId??'');
  }

  // Method to create the prescription
  // Future<void> generatePrescription(BuildContext context) async {
  //   // Prepare the data for the prescription
  //   List<Medicine> medicinesList = [];
  //
  //   for (int i = 0; i < textEditingControllerList.length; i++) {
  //     String medicineName = textEditingControllerList[i].text;
  //     int quantity = int.tryParse(daysTextEditingControllerList[i].text) ?? 0;
  //
  //     // Only add valid medicines
  //     if (medicineName.isNotEmpty && quantity > 0) {
  //       medicinesList.add(Medicine(
  //         name: medicineName,
  //         quantity: quantity,
  //       ));
  //     }
  //   }
  //
  //   if (medicinesList.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please add valid medicines')));
  //     return;
  //   }
  //
  //   // Create the request model
  //   final prescriptionRequest = CreatePrescriptionRequest(
  //     medicines: medicinesList,
  //     patientId: patient?.sId ?? "", // Replace with actual patient ID
  //   );
  //
  //   // Call the service to generate the prescription
  //   bool success = await DoctorHelper.createPrescription(prescriptionRequest);
  //
  //   // Handle success or failure
  //   if (success) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Prescription created successfully')));
  //     // go to dashboard page
  //     SetIndex(0);
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to create prescription')));
  //   }
  // }
}