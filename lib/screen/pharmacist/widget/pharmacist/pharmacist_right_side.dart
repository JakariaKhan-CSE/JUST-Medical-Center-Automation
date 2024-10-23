import 'package:flutter/cupertino.dart';
import 'package:just_medical_center_automation/controller/pharmacistController/pharmacistController.dart';
import 'package:just_medical_center_automation/screen/pharmacist/change_password_pharmacist.dart';
import 'package:just_medical_center_automation/screen/pharmacist/dashboard_pharmacist.dart';
import 'package:just_medical_center_automation/screen/pharmacist/manage_medicine.dart';
import 'package:just_medical_center_automation/screen/pharmacist/medicine_add_page.dart';
import 'package:just_medical_center_automation/screen/pharmacist/pending_prescription.dart';
import 'package:provider/provider.dart';



class PharmacistRightPartFeature extends StatelessWidget {
  const PharmacistRightPartFeature({super.key});

  @override
  Widget build(BuildContext context) {
    final _pageController = Provider.of<PharmacistController>(context, listen: true);
    if(_pageController.current_index == 0)
      return DashboardPharmacist();
    else if(_pageController.current_index == 1)
      return PendingPrescriptionPage();
    else if(_pageController.current_index == 2)
      return MedicineAddPage();
    else if(_pageController.current_index == 3)
      return ManageMedicine();
    else if(_pageController.current_index == 4)
      return ChangePasswordPharmacist();
    else
      return DashboardPharmacist();
  }
}
