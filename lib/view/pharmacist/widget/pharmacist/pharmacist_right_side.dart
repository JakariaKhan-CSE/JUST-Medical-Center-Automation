import 'package:flutter/cupertino.dart';
import 'package:just_medical_center_automation/controller/pharmacistController/pharmacistController.dart';
import 'package:just_medical_center_automation/view/pharmacist/widget/pharmacist/see_patient_prescription.dart';
import 'package:provider/provider.dart';

import '../../change_password_pharmacist.dart';
import '../../dashboard_pharmacist.dart';
import '../../manage_medicine.dart';
import '../../medicine_add_page.dart';
import '../../pending_prescription.dart';



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
    else if(_pageController.current_index == 5)
      return SeePatientPrescription();
    else
      return DashboardPharmacist();
  }
}
