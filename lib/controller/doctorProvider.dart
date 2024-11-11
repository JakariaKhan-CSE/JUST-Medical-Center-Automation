import 'package:flutter/cupertino.dart';
import 'package:just_medical_center_automation/model/res/patient/doctorResponse.dart';

class DoctorNotifier extends ChangeNotifier{
  late Future<List<DoctorResponse>> doctorList;

  getDoctors(){
    //doctorList = JobHelper.getJobs(); // getJobs function static tai JobHelper() airokom kora lageni
  }
}