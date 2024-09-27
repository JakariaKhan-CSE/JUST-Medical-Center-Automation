import 'package:flutter/cupertino.dart';

import 'package:just_medical_center_automation/controller/adminController/adminController.dart';
import 'package:just_medical_center_automation/controller/doctorController/doctor_controller.dart';
import 'package:just_medical_center_automation/screen/Admin/add_doctor_page.dart';
import 'package:just_medical_center_automation/screen/Admin/add_pharmacist_page.dart';
import 'package:just_medical_center_automation/screen/Admin/dashBoard_page.dart';
import 'package:just_medical_center_automation/screen/Admin/show_all_medicine_page.dart';
import 'package:just_medical_center_automation/screen/doctor/setting_page.dart';
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
    // else if(_pageController.current_index == 3)
    //   return ShowAllMedicinePage();
    // else if(_pageController.current_index == 4)
    //   return Showalldoctorwithupdatedelte();
    // else if(_pageController.current_index == 5)
    //   return ShowAllPharmacistUpdateDelete();
    else
      return DashBoardDoctor();
  }
}
