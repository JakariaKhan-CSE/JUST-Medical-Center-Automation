import 'package:flutter/cupertino.dart';
import 'package:just_medical_center_automation/model/res/patient/doctorResponse.dart';
import 'package:just_medical_center_automation/services/helper/doctorHelper.dart';

class DoctorNotifier extends ChangeNotifier{
  late Future<List<TotalDoctors>> doctorList;

  getDoctors(){
    doctorList = DoctorHelper.getDoctors(); // getJobs function static tai JobHelper() airokom kora lageni
  }
}