import 'package:flutter/cupertino.dart';
import 'package:just_medical_center_automation/model/res/patient/prescriptionResponse.dart';
import 'package:just_medical_center_automation/services/helper/prescriptionHelper.dart';


class PrescriptionNotifier extends ChangeNotifier{
  late Future<List<PrescriptionResponse>> prescriptionList;
  PrescriptionResponse? _prescription;

  PrescriptionResponse? get prescription => _prescription;
  void setPrescriptionData(PrescriptionResponse prescription)
  {
    _prescription = prescription;
    notifyListeners();
  }

  getAllPrescription(){
     prescriptionList = PrescriptionHelper.getAllPrescription(); // getJobs function static tai JobHelper() airokom kora lageni
  }
}