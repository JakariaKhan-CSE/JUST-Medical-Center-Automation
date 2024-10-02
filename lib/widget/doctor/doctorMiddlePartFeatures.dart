import 'package:flutter/cupertino.dart';


import 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';

import 'package:just_medical_center_automation/screen/doctor/doctor_password_change.dart';
import 'package:just_medical_center_automation/screen/doctor/make_prescription.dart';
import 'package:just_medical_center_automation/screen/doctor/patient_details_page.dart';
import 'package:just_medical_center_automation/screen/doctor/updateprofile_page.dart';
import 'package:just_medical_center_automation/widget/doctor/component/dashboardDoctor.dart';
import 'package:just_medical_center_automation/widget/doctor/seeAllPatient.dart';
import 'package:provider/provider.dart';


class DoctorMiddlePartFeature extends StatelessWidget {
  const DoctorMiddlePartFeature({super.key});

  @override
  Widget build(BuildContext context) {
    final _pageController = Provider.of<DoctorController>(context, listen: true);
    if(_pageController.current_index == 0)
      return DashBoardDoctor();
    else if(_pageController.current_index == 1)
      return SeeAllPatientList();
    else if(_pageController.current_index == 2)
      return UpdateProfilePage();
    else if(_pageController.current_index == 3)
      return DoctorPasswordChange();
    else if(_pageController.current_index == 4)
      return PatientDetailsPage();
    else if(_pageController.current_index == 5)
      return MakePrescription();
    else
      return DashBoardDoctor();
  }
}
