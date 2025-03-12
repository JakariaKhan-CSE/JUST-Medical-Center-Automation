import 'package:flutter/cupertino.dart';
import 'package:just_medical_center_automation/controller/adminController/adminController.dart';
import 'package:just_medical_center_automation/view/admin/search_user_screen.dart';
import 'package:provider/provider.dart';
import '../../../common/show_all_medicine_page.dart';
import '../../add_doctor_page.dart';
import '../../add_pharmacist_page.dart';
import '../../dashBoard_page.dart';
import '../../monthly_record.dart';
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
    // else if(_pageController.current_index == 6)
    //   return MonthlyRecord();
    else if(_pageController.current_index == 7)
      return SearchUserScreen();
    else
      return DashboardPage();
  }
}
