import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:just_medical_center_automation/controller/adminController/adminController.dart';
import 'package:just_medical_center_automation/screen/Admin/add_doctor_page.dart';
import 'package:just_medical_center_automation/screen/Admin/add_pharmacist_page.dart';
import 'package:just_medical_center_automation/screen/Admin/dashBoard_page.dart';
import 'package:just_medical_center_automation/screen/Admin/show_all_medicine_page.dart';
import 'package:provider/provider.dart';

import 'component/showAllDoctorwithUpdateDelte.dart';
import 'component/showAllPharmacistUpdateDelete.dart';

class Adminrightsidefeaturepage extends StatelessWidget {
  const Adminrightsidefeaturepage({super.key});

  @override
  Widget build(BuildContext context) {
    final _pageController = Provider.of<AdminController>(context, listen: true);
    if(_pageController.current_index == 0)
      return DashboardPage();
    else if(_pageController.current_index == 1)
      return AddDoctorPage();
    else if(_pageController.current_index == 2)
      return AddPharmacistPage();
    else if(_pageController.current_index == 3)
      return ShowAllMedicinePage();
    else if(_pageController.current_index == 4)
      return Showalldoctorwithupdatedelte();
    else if(_pageController.current_index == 5)
      return ShowAllPharmacistUpdateDelete();
    else
      return DashboardPage();
  }
}
